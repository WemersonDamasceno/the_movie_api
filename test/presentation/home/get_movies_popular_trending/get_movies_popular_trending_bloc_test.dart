import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movies_db/domain/usecases/get_list_popular_movies_usecase.dart';
import 'package:the_movies_db/domain/usecases/get_list_trending_movies_usecase.dart';
import 'package:the_movies_db/presentation/home/get_movies_popular_trending/get_movies_popular_trending_bloc.dart';

class MockGetPopularMoviesUseCase extends Mock
    implements GetPopularMoviesUseCase {}

class MockGetTrendingMoviesUsecase extends Mock
    implements GetTrendingMoviesUsecase {}

void main() {
  group('GetMoviesPopularTrendingBloc', () {
    late GetPopularMoviesUseCase popularMoviesUseCase;
    late GetTrendingMoviesUsecase trendingMoviesUsecase;
    late GetMoviesPopularTrendingBloc bloc;

    setUp(() {
      popularMoviesUseCase = MockGetPopularMoviesUseCase();
      trendingMoviesUsecase = MockGetTrendingMoviesUsecase();
      bloc = GetMoviesPopularTrendingBloc(
        getMoviesPopularUseCase: popularMoviesUseCase,
        getMoviesTrendingUsecase: trendingMoviesUsecase,
      );
    });

    test('initial state is PopularMovieLoadingState', () {
      expect(bloc.state, const PopularMovieLoadingState());
    });

    blocTest(
      'emits [PopularMovieLoadingState, PopularMoviesLoadedState] when PopularMoviesLoadEvent is added',
      build: () {
        when(() => popularMoviesUseCase(0))
            .thenAnswer((_) async => const Right([]));
        return bloc;
      },
      act: (bloc) => bloc.add(const PopularMoviesLoadEvent()),
      expect: () => [
        const PopularMovieLoadingState(),
        const PopularMoviesLoadedState(listPopularMovies: []),
      ],
    );

    blocTest(
      'emits [TrendingMovieLoadingState, TrendingMoviesLoadedState] when TrendingMoviesLoadEvent is added',
      build: () {
        when(() => trendingMoviesUsecase(0))
            .thenAnswer((_) async => const Right([]));
        return bloc;
      },
      act: (bloc) => bloc.add(const TrendingMoviesLoadEvent()),
      expect: () => [
        const TrendingMovieLoadingState(),
        const TrendingMoviesLoadedState(listTrendingMovies: []),
      ],
    );
  });
}
