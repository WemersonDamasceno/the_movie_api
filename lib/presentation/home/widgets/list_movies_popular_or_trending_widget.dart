import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_api/core/utils/constants/custom_styles.dart';
import 'package:the_movies_api/core/utils/enums/movies_type_enum.dart';
import 'package:the_movies_api/presentation/home/bloc/get_movies_popular_trending/get_movies_popular_trending_bloc.dart';
import 'package:the_movies_api/presentation/home/widgets/list_movies_widget.dart';
import 'package:the_movies_api/presentation/home/widgets/skeleton_movie_widget.dart';

class ListMoviePopularOrTrendingWidget extends StatelessWidget {
  final MoviesTypeEnum movieTypeEnum;
  const ListMoviePopularOrTrendingWidget(
      {Key? key, required this.movieTypeEnum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMoviesPopularTrendingBloc, MovieState>(
      buildWhen: (previous, current) {
        if (movieTypeEnum == MoviesTypeEnum.popularMovies) {
          return current is PopularMoviesLoadedState;
        } else {
          return current is TrendingMoviesLoadedState;
        }
      },
      builder: (context, state) {
        if (state is PopularMovieLoadingState) {
          return const Center(child: SkeletonMovieWidget());
        }
        if (state is PopularMoviesLoadedState) {
          BlocProvider.of<GetMoviesPopularTrendingBloc>(context).add(
            const TrendingMoviesLoadEvent(),
          );
          return ListMovieWidget(
            moviesList: state.listPopularMovies,
          );
        }

        if (state is TrendingMoviesLoadedState) {
          return ListMovieWidget(
            moviesList: state.listTrendingMovies,
          );
        }

        if (state is MoviesErrorState) {
          return errorMessage(state.message, context);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  errorMessage(String message, BuildContext context) {
    return SizedBox(
        key: const ValueKey("error"),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<GetMoviesPopularTrendingBloc>(context).add(
                    const PopularMoviesLoadEvent(),
                  );
                },
                child: const Text(
                  "Tentar Novamente",
                  style: CustomStyles.styleTitle,
                ),
              ),
            ),
          ],
        ));
  }
}
