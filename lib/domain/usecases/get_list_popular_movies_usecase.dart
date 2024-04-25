import 'package:dartz/dartz.dart';
import 'package:the_movies_api/core/errors/failures.dart';
import 'package:the_movies_api/core/usecase/usecase.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/domain/repositories/movie_repository.dart';

class GetPopularMoviesUseCase implements UseCase<List<MovieEntity>, int> {
  final MovieRepository repository;

  GetPopularMoviesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<MovieEntity>>> call(int page) async {
    return await repository.getPopularMovies(page);
  }
}
