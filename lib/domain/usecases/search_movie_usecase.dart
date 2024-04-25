import 'package:dartz/dartz.dart';
import 'package:the_movies_api/core/errors/failures.dart';
import 'package:the_movies_api/core/usecase/usecase.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/domain/repositories/movie_repository.dart';

class SearchMovieUsecase extends UseCase<List<MovieEntity>, String> {
  final MovieRepository repository;

  SearchMovieUsecase({required this.repository});

  @override
  Future<Either<Failure, List<MovieEntity>>> call(String params) async {
    return await repository.searchMovies(params);
  }
}
