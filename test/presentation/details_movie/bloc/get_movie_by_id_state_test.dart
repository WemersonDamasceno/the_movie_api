import 'package:flutter_test/flutter_test.dart';
import 'package:the_movies_api/core/utils/enums/status_enum.dart';
import 'package:the_movies_api/domain/entities/movie_detail_entity.dart';
import 'package:the_movies_api/presentation/details_movie/bloc/get_movie_by_id_state.dart';

import '../../../mocks/movie_detail_mock.dart';

void main() {
  final MovieDetailsEntity movie = MovieDetailMock.entity;

  group('GetMovieByIdState', () {
    test('supports value comparisons', () {
      expect(
        GetMovieByIdState(movie: movie, statusEnum: StatusEnum.success),
        GetMovieByIdState(movie: movie, statusEnum: StatusEnum.success),
      );
    });

    test('copies with the provided values', () {
      final state = GetMovieByIdState(
        movie: movie,
        statusEnum: StatusEnum.success,
      );
      final copiedState = state.copyWith(statusEnum: StatusEnum.loading);

      expect(copiedState.statusEnum, StatusEnum.loading);
      expect(copiedState.movie, movie);
    });
  });
}
