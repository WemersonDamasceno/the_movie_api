import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movies_db/core/utils/enums/status_enum.dart';
import 'package:the_movies_db/domain/entities/movie_entity.dart';
import 'package:the_movies_db/presentation/all_movies_series/bloc/get_all_movies_series/get_all_movies_series_bloc.dart';

class MockMovieEntity extends Mock implements MovieEntity {}

void main() {
  late GetAllMoviesSeriesState initialState;

  setUp(() {
    initialState = const GetAllMoviesSeriesState().copyWith();
  });

  group('GetAllMoviesSeriesState', () {
    test('should have correct initial state', () {
      expect(initialState.props, [StatusEnum.initial, null]);
    });

    test('should allow copying with new status and listMovies', () {
      final newState = initialState.copyWith(
        status: StatusEnum.loading,
        listMovies: [MockMovieEntity()],
      );
      expect(newState.status, StatusEnum.loading);
      expect(newState.listMovies, isA<List<MovieEntity>>());
    });
  });
}
