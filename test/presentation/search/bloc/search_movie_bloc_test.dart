import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movies_db/core/errors/failures.dart';
import 'package:the_movies_db/core/utils/enums/status_enum.dart';
import 'package:the_movies_db/domain/entities/movie_entity.dart';
import 'package:the_movies_db/domain/usecases/search_movie_usecase.dart';
import 'package:the_movies_db/presentation/search/bloc/search_movie_bloc.dart';
import 'package:the_movies_db/presentation/search/bloc/search_movie_event.dart';
import 'package:the_movies_db/presentation/search/bloc/search_movie_state.dart';

import '../../../mocks/movie_mock.dart';

class MockSearchMovieUsecase extends Mock implements SearchMovieUsecase {}

void main() {
  late SearchMovieBloc searchMovieBloc;
  late SearchMovieUsecase searchMovieUsecase;

  final MovieEntity movie = MovieMock.entity;

  setUp(() {
    searchMovieUsecase = MockSearchMovieUsecase();
    searchMovieBloc = SearchMovieBloc(searchMovieUsecase: searchMovieUsecase);
  });

  group('SearchMovieBloc', () {
    const query = 'Avengers';

    blocTest(
      'emits [SearchMovieState(status: StatusEnum.loading), SearchMovieState(status: StatusEnum.success, movies: [MovieEntity(...)])] when successful',
      build: () {
        when(() => searchMovieUsecase(query))
            .thenAnswer((_) async => Right([movie]));
        return searchMovieBloc;
      },
      act: (bloc) => bloc.add(SearchMovie(query)),
      expect: () => [
        const SearchMovieState(status: StatusEnum.loading),
        SearchMovieState(status: StatusEnum.success, movies: [movie]),
      ],
    );

    blocTest(
      'emits [SearchMovieState(status: StatusEnum.loading), '
      'SearchMovieState(status: StatusEnum.error)] when unsuccessful',
      build: () {
        when(() => searchMovieUsecase(query))
            .thenAnswer((_) async => Left(ServerFailure()));
        return searchMovieBloc;
      },
      act: (bloc) => bloc.add(SearchMovie(query)),
      expect: () => [
        const SearchMovieState(status: StatusEnum.loading),
        const SearchMovieState(status: StatusEnum.error),
      ],
    );
  });

  tearDown(() {
    searchMovieBloc.close();
  });
}
