import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movies_api/core/errors/failures.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/domain/repositories/movie_repository.dart';
import 'package:the_movies_api/domain/usecases/get_list_trending_movies_usecase.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetTrendingMoviesUsecase usecase;
  late MovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetTrendingMoviesUsecase(repository: repository);
  });

  group("GetMoviesTrending |", () {
    test("should get trending movies", () async {
      final movies = [
        const MovieEntity(
          id: 1,
          title: 'title',
          overview: 'overview',
          posterPath: 'posterPath',
          releaseDate: 'releaseDate',
          voteAverage: 1,
        )
      ];
      when(() => repository.getTrendingMovies(0))
          .thenAnswer((_) async => Right(movies));
      final result = await usecase(0);
      expect(result, Right(movies));
      verify(() => repository.getTrendingMovies(0));
      verifyNoMoreInteractions(repository);
    });

    test("should return server error", () async {
      when(() => repository.getTrendingMovies(0))
          .thenAnswer((_) async => Left(ServerFailure()));
      final result = await usecase(0);
      expect(result, Left(ServerFailure()));
      verify(() => repository.getTrendingMovies(0));
      verifyNoMoreInteractions(repository);
    });

    test("should retun a notFoundError", () async {
      when(() => repository.getTrendingMovies(0))
          .thenAnswer((_) async => Left(NotFoundFailure()));
      final result = await usecase(0);
      expect(result, Left(NotFoundFailure()));
      verify(() => repository.getTrendingMovies(0));
      verifyNoMoreInteractions(repository);
    });
  });
}
