import 'package:dartz/dartz.dart';
import 'package:the_movies_db/core/errors/failures.dart';
import 'package:the_movies_db/domain/entities/movie_detail_entity.dart';
import 'package:the_movies_db/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies(int page);
  Future<Either<Failure, List<MovieEntity>>> getTrendingMovies(int page);

  Future<Either<Failure, MovieDetailsEntity>> getMovieDetail(int idMovie);

  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query);

  Future<Either<Failure, List<MovieEntity>>> getAllSeries();
  Future<Either<Failure, List<MovieEntity>>> getAllMovies();
}
