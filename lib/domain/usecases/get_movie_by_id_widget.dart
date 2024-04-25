import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movies_db/core/errors/failures.dart';
import 'package:the_movies_db/core/usecase/usecase.dart';
import 'package:the_movies_db/domain/entities/movie_detail_entity.dart';
import 'package:the_movies_db/domain/repositories/movie_repository.dart';

class GetMovieByIdUsecase
    implements UseCase<MovieDetailsEntity, GetMovieByIdParams> {
  GetMovieByIdUsecase({required this.repository});

  final MovieRepository repository;

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(
    GetMovieByIdParams params,
  ) async {
    return await repository.getMovieDetail(
      params.idMovie,
    );
  }
}

class GetMovieByIdParams extends Equatable {
  const GetMovieByIdParams({required this.idMovie});

  final int idMovie;

  @override
  List<Object> get props => [idMovie];
}
