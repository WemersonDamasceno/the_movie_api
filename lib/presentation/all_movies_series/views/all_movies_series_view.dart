import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_api/core/utils/constants/app_colors.dart';
import 'package:the_movies_api/core/utils/constants/custom_styles.dart';
import 'package:the_movies_api/core/utils/enums/status_enum.dart';
import 'package:the_movies_api/presentation/all_movies_series/bloc/get_all_movies_series/get_all_movies_series_bloc.dart';
import 'package:the_movies_api/presentation/details_movie/widgets/button_back_widget.dart';
import 'package:the_movies_api/presentation/widgets/body_error_movies_widget.dart';
import 'package:the_movies_api/presentation/widgets/body_no_movies_widget.dart';
import 'package:the_movies_api/presentation/widgets/grid_view_list_movie_widget.dart';
import 'package:the_movies_api/presentation/widgets/grid_view_loading_movie_widget.dart';

enum CategoryEnum { movies, series }

class AllMoviesSeriesView extends StatefulWidget {
  final String category;

  const AllMoviesSeriesView({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<AllMoviesSeriesView> createState() => _AllMoviesSeriesViewState();
}

class _AllMoviesSeriesViewState extends State<AllMoviesSeriesView> {
  late GetAllMoviesSeriesBloc _getAllMoviesSeriesBloc;

  @override
  void initState() {
    super.initState();

    _getAllMoviesSeriesBloc = BlocProvider.of<GetAllMoviesSeriesBloc>(context);

    _getAllMoviesSeriesBloc.add(
      GetAllMoviesSeries(category: widget.category),
    );
  }

  @override
  void dispose() {
    _getAllMoviesSeriesBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColorPage,
        elevation: 0,
        leading: ButtonBackWidget(),
        title: Text(
          widget.category == CategoryEnum.movies.name
              ? 'All Movies'
              : 'All Series',
          style: CustomStyles.stylePercentText,
        ),
      ),
      backgroundColor: AppColors.backgroundColorPage,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.only(top: 10, bottom: 80),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              return BlocBuilder<GetAllMoviesSeriesBloc,
                  GetAllMoviesSeriesState>(
                bloc: _getAllMoviesSeriesBloc,
                builder: (context, state) {
                  switch (state.status) {
                    case StatusEnum.empty:
                      return const BodyNoMoviesWidget();
                    case StatusEnum.error:
                      return BodyErrorMoviesWidget(
                        onPressedTryAgain: () {
                          _getAllMoviesSeriesBloc.add(
                            GetAllMoviesSeries(category: widget.category),
                          );
                        },
                      );
                    case StatusEnum.success:
                      return SizedBox(
                        height: constraints.minHeight,
                        child: GridViewListMovieWidget(
                          moviesList: state.listMovies!,
                        ),
                      );
                    default:
                      return SizedBox(
                        height: constraints.minHeight - kToolbarHeight,
                        child: const GridViewLoadingMovieWidget(),
                      );
                  }
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
