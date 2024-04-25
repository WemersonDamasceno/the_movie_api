import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movies_db/core/errors/exceptions.dart';
import 'package:the_movies_db/core/errors/failures.dart';
import 'package:the_movies_db/core/utils/enums/status_movie_enum.dart';
import 'package:the_movies_db/data/datasources/movie_datasource.dart';
import 'package:the_movies_db/data/models/movie_detail_model.dart';
import 'package:the_movies_db/data/models/movie_model.dart';
import 'package:the_movies_db/data/repositories/movie_repository_imp.dart';
import 'package:the_movies_db/domain/repositories/movie_repository.dart';

class MockMovieDatasource extends Mock implements MovieDatasource {}

void main() {
  late MovieRepository movieRepository;
  late MockMovieDatasource mockMovieDatasource;

  setUp(() {
    mockMovieDatasource = MockMovieDatasource();
    movieRepository = MovieRepositoryImp(movieDatasource: mockMovieDatasource);
  });

  group('MovieRepositoryImp', () {
    test('should be an instance of MovieRepository', () {
      expect(movieRepository, isA<MovieRepository>());
    });

    test(
        'getPopularMovies should return a list of model movies when call is successful',
        () async {
      // Arrange
      final List<MovieModel> movies = [
        const MovieModel(
          idModel: 1,
          titleModel: 'title',
          overviewModel: 'overview',
          posterPathModel: 'posterPath',
          releaseDateModel: 'releaseDate',
          voteAverageModel: 1,
          movieDetailsModel: null,
        ),
      ];
      when(() => mockMovieDatasource.getPopularMovies())
          .thenAnswer((_) async => movies);

      // Act
      final result = await movieRepository.getPopularMovies(0);

      // Assert
      expect(result, Right(movies));
    });

    test(
        'getPopularMovies should return an ExceptionGenericsFailure when an unspecified error occurs',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getPopularMovies()).thenThrow(Exception());

      // Act
      final result = await movieRepository.getPopularMovies(1);

      // Assert
      expect(result, Left(ExceptionGenericsFailure()));
    });

    test(
        'getPopularMovies should return a ServerFailure when call to datasource is unsuccessful',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getPopularMovies())
          .thenThrow(const ServerException());

      // Act
      final result = await movieRepository.getPopularMovies(0);

      // Assert
      expect(result, Left(ServerFailure()));
    });

    test(
        'getPopularMovies should return a NotFoundFailure when call to datasource is unsuccessful',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getPopularMovies())
          .thenThrow(const NotFoundException());

      // Act
      final result = await movieRepository.getPopularMovies(0);

      // Assert
      expect(result, Left(NotFoundFailure()));
    });

    test(
        'getTrendingMovies should return a list of model movies when call is successful',
        () async {
      // Arrange
      final List<MovieModel> movies = [
        const MovieModel(
          idModel: 1,
          titleModel: 'title',
          overviewModel: 'overview',
          posterPathModel: 'posterPath',
          releaseDateModel: 'releaseDate',
          voteAverageModel: 1,
          movieDetailsModel: null,
        ),
      ];
      when(() => mockMovieDatasource.getTrendingMovies())
          .thenAnswer((_) async => movies);

      // Act
      final result = await movieRepository.getTrendingMovies(0);

      // Assert
      expect(result, Right(movies));
    });

    test(
        'getTrendingMovies should return an ExceptionGenericsFailure when an unspecified error occurs',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getTrendingMovies())
          .thenThrow(Exception());

      // Act
      final result = await movieRepository.getTrendingMovies(1);

      // Assert
      expect(result, Left(ExceptionGenericsFailure()));
    });

    test(
        'getTrendingMovies should return a ServerFailure when call to datasource is unsuccessful',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getTrendingMovies())
          .thenThrow(const ServerException());

      // Act
      final result = await movieRepository.getTrendingMovies(0);

      // Assert
      expect(result, Left(ServerFailure()));
    });

    test(
        'getTrendingMovies should return a NotFoundFailure when call to datasource is unsuccessful',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getTrendingMovies())
          .thenThrow(const NotFoundException());

      // Act
      final result = await movieRepository.getTrendingMovies(0);

      // Assert
      expect(result, Left(NotFoundFailure()));
    });

    test(
        'getAllMovies should return a list of model movies when call is successful',
        () async {
      // Arrange
      final List<MovieModel> movies = [
        const MovieModel(
          idModel: 1,
          titleModel: 'title',
          overviewModel: 'overview',
          posterPathModel: 'posterPath',
          releaseDateModel: 'releaseDate',
          voteAverageModel: 1,
          movieDetailsModel: null,
        ),
      ];
      when(() => mockMovieDatasource.getAllMovies())
          .thenAnswer((_) async => movies);

      // Act
      final result = await movieRepository.getAllMovies();

      // Assert
      expect(result, Right(movies));
    });

    test(
        'getAllMovies should return an ExceptionGenericsFailure when an unspecified error occurs',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getAllMovies()).thenThrow(Exception());

      // Act
      final result = await movieRepository.getAllMovies();

      // Assert
      expect(result, Left(ExceptionGenericsFailure()));
    });

    test(
        'getAllMovies should return a ServerFailure when call to datasource is unsuccessful',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getAllMovies())
          .thenThrow(const ServerException());

      // Act
      final result = await movieRepository.getAllMovies();

      // Assert
      expect(result, Left(ServerFailure()));
    });

    test(
        'getAllMovies should return a NotFoundFailure when call to datasource is unsuccessful',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getAllMovies())
          .thenThrow(const NotFoundException());

      // Act
      final result = await movieRepository.getAllMovies();

      // Assert
      expect(result, Left(NotFoundFailure()));
    });

    test(
        'getAllSeries should return a list of model movies when call is successful',
        () async {
      // Arrange
      final List<MovieModel> movies = [
        const MovieModel(
          idModel: 1,
          titleModel: 'title',
          overviewModel: 'overview',
          posterPathModel: 'posterPath',
          releaseDateModel: 'releaseDate',
          voteAverageModel: 1,
          movieDetailsModel: null,
        ),
      ];
      when(() => mockMovieDatasource.getAllSeries())
          .thenAnswer((_) async => movies);

      // Act
      final result = await movieRepository.getAllSeries();

      // Assert
      expect(result, Right(movies));
    });

    test(
        'getAllSeries should return an ExceptionGenericsFailure when an unspecified error occurs',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getAllSeries()).thenThrow(Exception());

      // Act
      final result = await movieRepository.getAllSeries();

      // Assert
      expect(result, Left(ExceptionGenericsFailure()));
    });

    test(
        'getAllSeries should return a ServerFailure when call to datasource is unsuccessful',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getAllSeries())
          .thenThrow(const ServerException());

      // Act
      final result = await movieRepository.getAllSeries();

      // Assert
      expect(result, Left(ServerFailure()));
    });

    test(
        'getAllSeries should return a NotFoundFailure when call to datasource is unsuccessful',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getAllSeries())
          .thenThrow(const NotFoundException());

      // Act
      final result = await movieRepository.getAllSeries();

      // Assert
      expect(result, Left(NotFoundFailure()));
    });

    test(
        'getMovieDetail should return a movie detail model when call is successful',
        () async {
      // Arrange
      const MovieDetailModel movieDetail = MovieDetailModel(
        backdropPathModel: 'backdropPath',
        statusModel: StatusMovieEnum.released,
        taglineModel: 'tagline',
        voteCountModel: 1,
        companiesModel: null,
      );
      when(() => mockMovieDatasource.getMovieDetail(any()))
          .thenAnswer((_) async => movieDetail);

      // Act
      final result = await movieRepository.getMovieDetail(1);

      // Assert
      expect(result, const Right(movieDetail));
    });

    test(
        'getMovieDetail should return an ExceptionGenericsFailure when an unspecified error occurs',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getMovieDetail(1)).thenThrow(Exception());

      // Act
      final result = await movieRepository.getMovieDetail(1);

      // Assert
      expect(result, Left(ExceptionGenericsFailure()));
    });

    test(
        'getMovieDetail should return a ServerFailure when call to datasource is unsuccessful',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getMovieDetail(any()))
          .thenThrow(const ServerException());

      // Act
      final result = await movieRepository.getMovieDetail(1);

      // Assert
      expect(result, Left(ServerFailure()));
    });

    test(
        'getMovieDetail should return a NotFoundFailure when call to datasource is unsuccessful',
        () async {
      // Arrange
      when(() => mockMovieDatasource.getMovieDetail(any()))
          .thenThrow(const NotFoundException());

      // Act
      final result = await movieRepository.getMovieDetail(1);

      // Assert
      expect(result, Left(NotFoundFailure()));
    });

    test(
        'searchMovies should return a list of model movies when call is successful',
        () async {
      // Arrange
      final List<MovieModel> movies = [
        const MovieModel(
          idModel: 1,
          titleModel: 'title',
          overviewModel: 'overview',
          posterPathModel: 'posterPath',
          releaseDateModel: 'releaseDate',
          voteAverageModel: 1,
          movieDetailsModel: null,
        ),
      ];
      when(() => mockMovieDatasource.searchMovies(any()))
          .thenAnswer((_) async => movies);

      // Act
      final result = await movieRepository.searchMovies('query');

      // Assert
      expect(result, Right(movies));
    });

    test(
        'searchMovies should return an ExceptionGenericsFailure when an unspecified error occurs',
        () async {
      // Arrange
      when(() => mockMovieDatasource.searchMovies('query'))
          .thenThrow(Exception());

      // Act
      final result = await movieRepository.searchMovies('query');

      // Assert
      expect(result, Left(ExceptionGenericsFailure()));
    });

    test(
        'searchMovies should return a ServerFailure when call to datasource is unsuccessful',
        () async {
      // Arrange
      when(() => mockMovieDatasource.searchMovies(any()))
          .thenThrow(const ServerException());

      // Act
      final result = await movieRepository.searchMovies('query');

      // Assert
      expect(result, Left(ServerFailure()));
    });

    test(
        'searchMovies should return a NotFoundFailure when call to datasource is unsuccessful',
        () async {
      // Arrange
      when(() => mockMovieDatasource.searchMovies(any()))
          .thenThrow(const NotFoundException());

      // Act
      final result = await movieRepository.searchMovies('query');

      // Assert
      expect(result, Left(NotFoundFailure()));
    });
  });
}
