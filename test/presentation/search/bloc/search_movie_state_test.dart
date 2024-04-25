import 'package:flutter_test/flutter_test.dart';
import 'package:the_movies_api/core/utils/enums/status_enum.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/presentation/search/bloc/search_movie_state.dart';

void main() {
  group('SearchMovieState', () {
    final state = const SearchMovieState().copyWith();

    test('supports value comparisons', () {
      expect(
        state,
        const SearchMovieState(),
      );
    });

    test('returns correct default values', () {
      const state = SearchMovieState();

      expect(state.status, StatusEnum.initial);
      expect(state.movies, null);
    });

    test('copyWith returns correct object', () {
      const movie1 = MovieEntity(
        id: 1,
        title: 'Movie 1',
        overview: 'Overview 1',
        releaseDate: '2022-01-01',
        posterPath: 'poster_path_1.jpg',
        voteAverage: 7.5,
      );
      const movie2 = MovieEntity(
        id: 2,
        title: 'Movie 2',
        overview: 'Overview 2',
        releaseDate: '2022-02-02',
        posterPath: 'poster_path_2.jpg',
        voteAverage: 8.0,
      );

      const state = SearchMovieState(
        status: StatusEnum.loading,
        movies: [movie1],
      );

      final copiedState = state.copyWith(
        status: StatusEnum.success,
        movies: [movie1, movie2],
      );

      expect(copiedState.status, StatusEnum.success);
      expect(copiedState.movies, [movie1, movie2]);
    });
  });
}
