import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movies_api/core/errors/failures.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/domain/repositories/movie_repository.dart';
import 'package:the_movies_api/domain/usecases/search_movie_usecase.dart';

import '../../mocks/movie_mock.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late SearchMovieUsecase usecase;
  late MovieRepository repository;

  final entity = MovieMock.entity;
  final List<MovieEntity> movies = [
    entity.copyWith(id: 123),
    entity.copyWith(id: 456),
  ];

  setUp(() {
    repository = MockMovieRepository();
    usecase = SearchMovieUsecase(repository: repository);
  });

  group('SearchMovieUsecase', () {
    const query = 'Avengers';

    test('should return a list of movies from the repository', () async {
      when(() => repository.searchMovies(query))
          .thenAnswer((_) async => Right(movies));

      final result = await usecase(query);

      expect(result, Right(movies));
      verify(() => repository.searchMovies(query)).called(1);
    });

    test('should return a failure from the repository', () async {
      when(() => repository.searchMovies(query))
          .thenAnswer((_) async => Left(ServerFailure()));

      final result = await usecase(query);

      expect(result, Left(ServerFailure()));
      verify(() => repository.searchMovies(query)).called(1);
    });
  });
}
