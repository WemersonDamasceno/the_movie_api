import 'package:dartz/dartz.dart';
import 'package:the_movies_api/core/errors/exceptions.dart';
import 'package:the_movies_api/core/errors/failures.dart';
import 'package:the_movies_api/data/datasources/movie_datasource.dart';
import 'package:the_movies_api/domain/entities/movie_detail_entity.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/domain/repositories/movie_repository.dart';

class MovieRepositoryImp implements MovieRepository {
  final MovieDatasource movieDatasource;

  MovieRepositoryImp({
    required this.movieDatasource,
  });

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies(int page) async {
    try {
      final result = await movieDatasource.getPopularMovies();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(ExceptionGenericsFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTrendingMovies(int page) async {
    try {
      final result = await movieDatasource.getTrendingMovies();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(ExceptionGenericsFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getAllMovies() async {
    try {
      final result = await movieDatasource.getAllMovies();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(ExceptionGenericsFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getAllSeries() async {
    try {
      final result = await movieDatasource.getAllSeries();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(ExceptionGenericsFailure());
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetail(
    int idMovie,
  ) async {
    try {
      final result = await movieDatasource.getMovieDetail(idMovie);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(ExceptionGenericsFailure());
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query) async {
    try {
      final result = await movieDatasource.searchMovies(query);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on NotFoundException {
      return Left(NotFoundFailure());
    } catch (e) {
      return Left(ExceptionGenericsFailure());
    }
  }
}
