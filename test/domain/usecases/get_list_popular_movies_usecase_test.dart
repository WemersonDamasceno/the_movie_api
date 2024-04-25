import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movies_api/core/errors/failures.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/domain/repositories/movie_repository.dart';
import 'package:the_movies_api/domain/usecases/get_list_popular_movies_usecase.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetPopularMoviesUseCase useCase;
  late MovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    useCase = GetPopularMoviesUseCase(repository: repository);
  });

  group("GetMoviesPopular |", () {
    test('should get popular movies', () async {
      //population list_movies
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
      //listen to calls in the repository ↓↓↓
      //when the repository is called at some point side Right is the expected result
      when(() => repository.getPopularMovies(0))
          .thenAnswer((_) async => Right(movies));
      //do the call to the usecase ↓↓↓
      final result = await useCase(0);
      //verify the result ↓↓↓
      expect(result, Right(movies));
      verify(() => repository.getPopularMovies(0));
      verifyNoMoreInteractions(repository);
    });

    test('should return server error', () async {
      when(() => repository.getPopularMovies(0))
          .thenAnswer((_) async => Left(ServerFailure()));
      final result = await useCase(0);
      expect(result, Left(ServerFailure()));
      verify(() => repository.getPopularMovies(0));
      verifyNoMoreInteractions(repository);
    });
    test("should retun a notFoundError", () async {
      when(() => repository.getPopularMovies(0))
          .thenAnswer((_) async => Left(NotFoundFailure()));
      final result = await useCase(0);
      expect(result, Left(NotFoundFailure()));
      verify(() => repository.getPopularMovies(0));
      verifyNoMoreInteractions(repository);
    });
  });
}
