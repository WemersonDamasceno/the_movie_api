import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_db/core/utils/constants/custom_styles.dart';
import 'package:the_movies_db/core/utils/enums/movies_type_enum.dart';
import 'package:the_movies_db/core/utils/enums/routes_path_enum.dart';
import 'package:the_movies_db/core/utils/icons/app_images.dart';
import 'package:the_movies_db/presentation/all_movies_series/views/all_movies_series_view.dart';
import 'package:the_movies_db/presentation/home/get_movies_popular_trending/get_movies_popular_trending_bloc.dart';
import 'package:the_movies_db/presentation/home/widgets/card_poster_widget.dart';
import 'package:the_movies_db/presentation/home/widgets/list_movies_popular_or_trending_widget.dart';

class BodyHomeWidget extends StatefulWidget {
  const BodyHomeWidget({Key? key}) : super(key: key);

  @override
  State<BodyHomeWidget> createState() => _BodyHomeWidgetState();
}

class _BodyHomeWidgetState extends State<BodyHomeWidget> {
  late GetMoviesPopularTrendingBloc blocContext;
  @override
  void initState() {
    initBloc(context);
    super.initState();
  }

  initBloc(BuildContext context) {
    blocContext = BlocProvider.of<GetMoviesPopularTrendingBloc>(context);
    blocContext.add(const PopularMoviesLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Categories',
                style: CustomStyles.stylePercentText,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CardPosterWidget(
                    label: 'All Movies',
                    image: AppImages.movie,
                    colorInital: const Color(0xff16CAF1),
                    colorFinal: const Color(0xff0143A7),
                    onTap: () => GoRouter.of(context).pushNamed(
                      RoutesPathEnum.allMoviesSeries.name,
                      extra: CategoryEnum.movies.name,
                    ),
                  ),
                  CardPosterWidget(
                    label: 'All Series',
                    image: AppImages.anime,
                    colorInital: const Color(0xffFF2E2E),
                    colorFinal: const Color(0xffE08939),
                    onTap: () => GoRouter.of(context).pushNamed(
                      RoutesPathEnum.allMoviesSeries.name,
                      extra: CategoryEnum.series.name,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  'Most Popular',
                  style: CustomStyles.styleTextTopic,
                ),
              ),
              const SizedBox(
                height: 300,
                child: ListMoviePopularOrTrendingWidget(
                  movieTypeEnum: MoviesTypeEnum.popularMovies,
                ),
              ),
              const Text(
                'In Trend',
                style: CustomStyles.styleTextTopic,
              ),
              const SizedBox(
                height: 300,
                child: ListMoviePopularOrTrendingWidget(
                  movieTypeEnum: MoviesTypeEnum.trendingMovies,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
