import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movies_api/core/errors/failures.dart';
import 'package:the_movies_api/core/utils/enums/status_enum.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/domain/usecases/get_all_movies_or_series_usecase.dart';
import 'package:the_movies_api/presentation/all_movies_series/bloc/get_all_movies_series/get_all_movies_series_bloc.dart';

class MockGetAllMoviesSeriesUsecase extends Mock
    implements GetAllMoviesSeriesUsecase {}

void main() {
  late GetAllMoviesSeriesBloc bloc;
  late GetAllMoviesSeriesUsecase usecase;

  setUp(() {
    usecase = MockGetAllMoviesSeriesUsecase();
    bloc = GetAllMoviesSeriesBloc(getMoviesPopularUseCase: usecase);
  });

  group('GetAllMoviesSeriesBloc', () {
    const category = 'movies';
    const movie = MovieEntity(
      id: 1,
      title: 'Movie Title',
      overview: 'Movie Overview',
      posterPath: 'posterPath',
      releaseDate: '2022-01-01',
      voteAverage: 7.5,
    );
    final moviesList = [movie];

    blocTest(
      'emits [GetAllMoviesSeriesState(status: loading), GetAllMoviesSeriesState(listMovies: movies, status: success)] when GetAllMoviesSeries is added',
      build: () {
        when(() => usecase(const GetAllMoviesSeriesParams(category: category)))
            .thenAnswer((_) async => Right(moviesList));
        return bloc;
      },
      act: (bloc) => bloc.add(const GetAllMoviesSeries(category: category)),
      expect: () => [
        const GetAllMoviesSeriesState(status: StatusEnum.loading),
        GetAllMoviesSeriesState(
          listMovies: moviesList,
          status: StatusEnum.success,
        ),
      ],
    );

    blocTest(
      'emits [GetAllMoviesSeriesState(status: loading), GetAllMoviesSeriesState(status: error)] when GetAllMoviesSeries is added and usecase returns a failure',
      build: () {
        when(() => usecase(const GetAllMoviesSeriesParams(category: category)))
            .thenAnswer((_) async => Left(ServerFailure()));
        return bloc;
      },
      act: (bloc) => bloc.add(const GetAllMoviesSeries(category: category)),
      expect: () => [
        const GetAllMoviesSeriesState(status: StatusEnum.loading),
        const GetAllMoviesSeriesState(status: StatusEnum.error),
      ],
    );

    blocTest(
      'emits [GetAllMoviesSeriesState(status: empty)] when GetAllMoviesSeries is added and usecase returns an empty list',
      build: () {
        when(() => usecase(const GetAllMoviesSeriesParams(category: category)))
            .thenAnswer((_) async => const Right([]));
        return bloc;
      },
      act: (bloc) => bloc.add(const GetAllMoviesSeries(category: category)),
      expect: () => [
        const GetAllMoviesSeriesState(status: StatusEnum.loading),
        const GetAllMoviesSeriesState(
          status: StatusEnum.empty,
          listMovies: [],
        ),
      ],
    );

    blocTest(
      'emits [GetAllMoviesSeriesState(status: loading), GetAllMoviesSeriesState(status: error)] when GetAllMoviesSeries is added and usecase throws an exception',
      build: () {
        when(() => usecase(const GetAllMoviesSeriesParams(category: category)))
            .thenAnswer((_) async => Left(ServerFailure()));
        return bloc;
      },
      act: (bloc) => bloc.add(const GetAllMoviesSeries(category: category)),
      expect: () => [
        const GetAllMoviesSeriesState(status: StatusEnum.loading),
        const GetAllMoviesSeriesState(status: StatusEnum.error),
      ],
    );
  });
}
