import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movies_api/core/errors/failures.dart';
import 'package:the_movies_api/core/usecase/usecase.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/domain/repositories/movie_repository.dart';
import 'package:the_movies_api/presentation/all_movies_series/views/all_movies_series_view.dart';

class GetAllMoviesSeriesUsecase
    implements UseCase<List<MovieEntity>, GetAllMoviesSeriesParams> {
  GetAllMoviesSeriesUsecase({required this.repository});

  final MovieRepository repository;

  @override
  Future<Either<Failure, List<MovieEntity>>> call(
      GetAllMoviesSeriesParams params) async {
    if (params.category == CategoryEnum.movies.name) {
      return await repository.getAllMovies();
    }
    return await repository.getAllSeries();
  }
}

class GetAllMoviesSeriesParams extends Equatable {
  final String category;

  const GetAllMoviesSeriesParams({required this.category});

  @override
  List<Object?> get props => [category];
}
