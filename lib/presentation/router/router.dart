import 'package:go_router/go_router.dart';
import 'package:the_movies_db/core/utils/enums/routes_path_enum.dart';
import 'package:the_movies_db/domain/entities/movie_entity.dart';
import 'package:the_movies_db/presentation/all_movies_series/views/all_movies_series_page.dart';
import 'package:the_movies_db/presentation/details_movie/views/details_movie_page.dart';
import 'package:the_movies_db/presentation/home/views/home_page.dart';
import 'package:the_movies_db/presentation/onboard/views/onboard_page.dart';
import 'package:the_movies_db/presentation/search/views/search_page.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutesPathEnum.onboard.path,
  routes: [
    GoRoute(
      path: RoutesPathEnum.onboard.path,
      name: RoutesPathEnum.onboard.name,
      builder: (_, state) {
        return const OnboardPage();
      },
    ),
    GoRoute(
      path: RoutesPathEnum.allMoviesSeries.path,
      name: RoutesPathEnum.allMoviesSeries.name,
      builder: (_, state) {
        final categoryEnum = state.extra as String;
        return AllMoviesSeriesPage(
          category: categoryEnum,
        );
      },
    ),
    GoRoute(
      path: RoutesPathEnum.home.path,
      name: RoutesPathEnum.home.name,
      builder: (_, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: RoutesPathEnum.search.path,
      name: RoutesPathEnum.search.name,
      builder: (_, state) {
        return const SearchPage();
      },
    ),
    GoRoute(
      path: RoutesPathEnum.detailsMovie.path,
      name: RoutesPathEnum.detailsMovie.name,
      builder: (_, state) {
        final movieEntity = state.extra as MovieEntity;
        return DetailsMoviePage(
          movieEntity: movieEntity,
        );
      },
    ),
  ],
);
