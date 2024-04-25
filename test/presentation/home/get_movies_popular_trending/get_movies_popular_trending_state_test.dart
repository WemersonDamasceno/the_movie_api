import 'package:flutter_test/flutter_test.dart';
import 'package:the_movies_db/domain/entities/movie_entity.dart';
import 'package:the_movies_db/presentation/home/get_movies_popular_trending/get_movies_popular_trending_bloc.dart';

void main() {
  group('MovieState', () {
    test('should compare PopularMovieLoadingState instances', () {
      expect(
          const PopularMovieLoadingState(), const PopularMovieLoadingState());
    });

    test('should compare TrendingMovieLoadingState instances', () {
      expect(
          const TrendingMovieLoadingState(), const TrendingMovieLoadingState());
    });

    test('should compare PopularMoviesLoadedState instances', () {
      final movies = [
        const MovieEntity(
          id: 1,
          title: 'Avengers: Infinity War',
          overview: 'The Avengers fight against Thanos.',
          releaseDate: '2018-04-25',
          posterPath: '/q6J1gmqSCjA7cJmgDjZP7TQLaW.jpg',
          voteAverage: 8.3,
        ),
        const MovieEntity(
          id: 2,
          title: 'Avengers: Endgame',
          overview: 'The Avengers try to undo Thanos\' actions.',
          releaseDate: '2019-04-24',
          posterPath: '/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
          voteAverage: 8.3,
        ),
      ];

      final state1 = PopularMoviesLoadedState(listPopularMovies: movies);
      final state2 = PopularMoviesLoadedState(listPopularMovies: movies);

      expect(state1, state2);
    });

    test('should compare TrendingMoviesLoadedState instances', () {
      final movies = [
        const MovieEntity(
          id: 1,
          title: 'Avengers: Infinity War',
          overview: 'The Avengers fight against Thanos.',
          releaseDate: '2018-04-25',
          posterPath: '/q6J1gmqSCjA7cJmgDjZP7TQLaW.jpg',
          voteAverage: 8.3,
        ),
        const MovieEntity(
          id: 2,
          title: 'Avengers: Endgame',
          overview: 'The Avengers try to undo Thanos\' actions.',
          releaseDate: '2019-04-24',
          posterPath: '/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
          voteAverage: 8.3,
        ),
      ];

      final state1 = TrendingMoviesLoadedState(listTrendingMovies: movies);
      final state2 = TrendingMoviesLoadedState(listTrendingMovies: movies);

      expect(state1, state2);
    });

    test('should compare MoviesErrorState instances', () {
      const state1 = MoviesErrorState(message: 'Error fetching movies');
      const state2 = MoviesErrorState(message: 'Error fetching movies');

      expect(state1, state2);
    });
  });
}
