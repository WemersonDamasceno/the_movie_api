import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movies_api/core/errors/failures.dart';
import 'package:the_movies_api/domain/entities/movie_detail_entity.dart';
import 'package:the_movies_api/domain/repositories/movie_repository.dart';
import 'package:the_movies_api/domain/usecases/get_movie_by_id_widget.dart';

import '../../mocks/movie_detail_mock.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetMovieByIdUsecase useCase;
  late MovieRepository repository;

  final MovieDetailsEntity movieDetails = MovieDetailMock.entity;

  const params = GetMovieByIdParams(idMovie: 1);

  setUp(() {
    repository = MockMovieRepository();
    useCase = GetMovieByIdUsecase(repository: repository);
  });

  group("GetMovieByIdUsecase", () {
    const movieId = 1;

    test('should return movie details when movie is found', () async {
      // Arrange
      when(() => repository.getMovieDetail(movieId))
          .thenAnswer((_) async => Right(movieDetails));

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, Right(movieDetails));
      verify(() => repository.getMovieDetail(movieId));
      verifyNoMoreInteractions(repository);
    });

    test('should return not found failure when movie is not found', () async {
      // Arrange
      when(() => repository.getMovieDetail(movieId))
          .thenAnswer((_) async => Left(NotFoundFailure()));

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, Left(NotFoundFailure()));
      verify(() => repository.getMovieDetail(movieId));
      verifyNoMoreInteractions(repository);
    });

    test('should return server failure when an error occurs', () async {
      // Arrange
      when(() => repository.getMovieDetail(movieId))
          .thenAnswer((_) async => Left(ServerFailure()));

      // Act
      final result = await useCase(params);

      // Assert
      expect(result, Left(ServerFailure()));
      verify(() => repository.getMovieDetail(movieId));
      verifyNoMoreInteractions(repository);
    });

    test('verify if GetMovieByIdParams props returns correct values', () {
      // Arrange
      final expected = [movieId];

      // Act
      final result = params.props;

      // Assert
      expect(result, expected);
    });
  });
}
