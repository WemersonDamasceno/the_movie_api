import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movies_api/core/errors/failures.dart';
import 'package:the_movies_api/core/utils/enums/status_enum.dart';
import 'package:the_movies_api/domain/entities/movie_detail_entity.dart';
import 'package:the_movies_api/domain/usecases/get_movie_by_id_widget.dart';
import 'package:the_movies_api/presentation/details_movie/bloc/get_movie_by_id_bloc.dart';
import 'package:the_movies_api/presentation/details_movie/bloc/get_movie_by_id_event.dart';
import 'package:the_movies_api/presentation/details_movie/bloc/get_movie_by_id_state.dart';

import '../../../mocks/movie_detail_mock.dart';

class MockGetMovieByIdUsecase extends Mock implements GetMovieByIdUsecase {}

void main() {
  late GetMovieByIdBloc bloc;
  late GetMovieByIdUsecase mockGetMovieByIdUsecase;

  final MovieDetailsEntity movieDetails = MovieDetailMock.entity;
  const params = GetMovieByIdParams(idMovie: 1);

  setUp(() {
    mockGetMovieByIdUsecase = MockGetMovieByIdUsecase();
    bloc = GetMovieByIdBloc(getMovieByIdUsecase: mockGetMovieByIdUsecase);
  });

  tearDown(() {
    bloc.close();
  });

  group('GetMovieByIdBloc', () {
    blocTest(
      'emits [GetMovieByIdState(statusEnum: StatusEnum.loading), GetMovieByIdState(statusEnum: StatusEnum.success, movie: movie)] when GetMovieById is added and usecase returns movie',
      build: () {
        when(() => mockGetMovieByIdUsecase(params))
            .thenAnswer((_) async => Right(movieDetails));
        return bloc;
      },
      act: (bloc) => bloc.add(GetMovieById(idMovie: 1)),
      expect: () => [
        const GetMovieByIdState(statusEnum: StatusEnum.loading),
        GetMovieByIdState(statusEnum: StatusEnum.success, movie: movieDetails),
      ],
    );

    blocTest(
      'emits [GetMovieByIdState(statusEnum: StatusEnum.loading), GetMovieByIdState(statusEnum: StatusEnum.error)] when GetMovieById is added and usecase returns error',
      build: () {
        when(() => mockGetMovieByIdUsecase.call(params))
            .thenAnswer((_) async => Left(ServerFailure()));
        return bloc;
      },
      act: (bloc) => bloc.add(GetMovieById(idMovie: 1)),
      expect: () => [
        const GetMovieByIdState(statusEnum: StatusEnum.loading),
        const GetMovieByIdState(statusEnum: StatusEnum.error),
      ],
    );
  });
}
