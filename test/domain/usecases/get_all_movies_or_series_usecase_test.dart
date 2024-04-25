import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movies_api/core/errors/failures.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/domain/repositories/movie_repository.dart';
import 'package:the_movies_api/domain/usecases/get_all_movies_or_series_usecase.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetAllMoviesSeriesUsecase useCase;
  late MovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    useCase = GetAllMoviesSeriesUsecase(repository: repository);
  });

  group("GetAllMoviesSeriesUsecase", () {
    const categoryMovies = 'movies';
    const categorySeries = 'series';

    test('should return all movies when category is "movies"', () async {
      // Arrange
      final moviesList = <MovieEntity>[];
      when(() => repository.getAllMovies())
          .thenAnswer((_) async => Right(moviesList));

      // Act
      final result = await useCase(
          const GetAllMoviesSeriesParams(category: categoryMovies));

      // Assert
      expect(result, Right(moviesList));
      verify(() => repository.getAllMovies());
      verifyNoMoreInteractions(repository);
    });

    test('should return all series when category is "series"', () async {
      // Arrange
      final seriesList = <MovieEntity>[];
      when(() => repository.getAllSeries())
          .thenAnswer((_) async => Right(seriesList));

      // Act
      final result = await useCase(
          const GetAllMoviesSeriesParams(category: categorySeries));

      // Assert
      expect(result, Right(seriesList));
      verify(() => repository.getAllSeries());
      verifyNoMoreInteractions(repository);
    });

    test('should return server error when getting movies', () async {
      // Arrange
      when(() => repository.getAllMovies())
          .thenAnswer((_) async => Left(ServerFailure()));

      // Act
      final result = await useCase(
          const GetAllMoviesSeriesParams(category: categoryMovies));

      // Assert
      expect(result, Left(ServerFailure()));
      verify(() => repository.getAllMovies());
      verifyNoMoreInteractions(repository);
    });

    test('should return server error when getting series', () async {
      // Arrange
      when(() => repository.getAllSeries())
          .thenAnswer((_) async => Left(ServerFailure()));

      // Act
      final result = await useCase(
          const GetAllMoviesSeriesParams(category: categorySeries));

      // Assert
      expect(result, Left(ServerFailure()));
      verify(() => repository.getAllSeries());
      verifyNoMoreInteractions(repository);
    });

    test('should return not found error when getting movies', () async {
      // Arrange
      when(() => repository.getAllMovies())
          .thenAnswer((_) async => Left(NotFoundFailure()));

      // Act
      final result = await useCase(
          const GetAllMoviesSeriesParams(category: categoryMovies));

      // Assert
      expect(result, Left(NotFoundFailure()));
      verify(() => repository.getAllMovies());
      verifyNoMoreInteractions(repository);
    });

    test('should return not found error when getting series', () async {
      // Arrange
      when(() => repository.getAllSeries())
          .thenAnswer((_) async => Left(NotFoundFailure()));

      // Act
      final result = await useCase(
          const GetAllMoviesSeriesParams(category: categorySeries));

      // Assert
      expect(result, Left(NotFoundFailure()));
      verify(() => repository.getAllSeries());
      verifyNoMoreInteractions(repository);
    });

    //Test for params
    test('verify GetAllMoviesSeriesParams props', () {
      // Arrange
      const params = GetAllMoviesSeriesParams(category: categoryMovies);

      // Act
      final result = params.props;

      // Assert
      expect(result, [categoryMovies]);
    });
  });
}
