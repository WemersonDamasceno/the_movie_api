import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movies_api/core/utils/enums/status_enum.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/domain/usecases/get_all_movies_or_series_usecase.dart';

part 'get_all_movies_series_event.dart';
part 'get_all_movies_series_state.dart';

class GetAllMoviesSeriesBloc
    extends Bloc<GetAllMoviesSeriesEvent, GetAllMoviesSeriesState> {
  final GetAllMoviesSeriesUsecase getMoviesPopularUseCase;

  GetAllMoviesSeriesBloc({
    required this.getMoviesPopularUseCase,
  }) : super(const GetAllMoviesSeriesState()) {
    on<GetAllMoviesSeries>(_getPopularMovies);
  }

  _getPopularMovies(
    GetAllMoviesSeries event,
    Emitter<GetAllMoviesSeriesState> emit,
  ) async {
    emit(const GetAllMoviesSeriesState(status: StatusEnum.loading));
    final failureOrSucess = await getMoviesPopularUseCase(
      GetAllMoviesSeriesParams(category: event.category),
    );
    emit(
      failureOrSucess.fold(
        (failure) => const GetAllMoviesSeriesState(status: StatusEnum.error),
        (movies) => GetAllMoviesSeriesState(
          listMovies: movies,
          status: movies.isNotEmpty ? StatusEnum.success : StatusEnum.empty,
        ),
      ),
    );
  }
}
