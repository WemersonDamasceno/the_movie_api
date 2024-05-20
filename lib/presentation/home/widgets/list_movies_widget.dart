import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_api/core/utils/enums/routes_path_enum.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/presentation/home/bloc/get_movies_popular_trending/get_movies_popular_trending_bloc.dart';
import 'package:the_movies_api/presentation/home/mixins/item_movie_mixin.dart';
import 'package:the_movies_api/presentation/home/widgets/item_movie_widget.dart';

class ListMovieWidget extends StatefulWidget {
  final List<MovieEntity> moviesList;
  final Axis? scrollDirection;
  const ListMovieWidget({
    Key? key,
    required this.moviesList,
    this.scrollDirection,
  }) : super(key: key);

  @override
  State<ListMovieWidget> createState() => _ListMovieWidgetState();
}

class _ListMovieWidgetState extends State<ListMovieWidget> with ItemMovieMixin {
  late ScrollController _scrollController;
  bool _isLoading = false;

  @override
  void initState() {
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _onScrollEnd();
      }
    });
    super.initState();
  }

  _onScrollEnd() {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
      BlocProvider.of<GetMoviesPopularTrendingBloc>(context).add(
        const PopularMoviesLoadEvent(),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: widget.moviesList.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          final MovieEntity movie = widget.moviesList[index];
          return InkWell(
            onTap: () {
              GoRouter.of(context).pushNamed(
                RoutesPathEnum.detailsMovie.name,
                extra: movie,
              );
            },
            child: ItemMovieWidget(
              title: movie.title,
              imageURL: movie.posterPath,
              voteAverage: formatterVoteAverage(movie.voteAverage),
              date: movie.releaseDate,
            ),
          );
        });
  }
}
