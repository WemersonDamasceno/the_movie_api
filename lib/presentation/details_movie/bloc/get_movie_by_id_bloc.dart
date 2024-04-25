import 'package:bloc/bloc.dart';
import 'package:the_movies_db/core/utils/enums/status_enum.dart';
import 'package:the_movies_db/domain/usecases/get_movie_by_id_widget.dart';
import 'package:the_movies_db/presentation/details_movie/bloc/get_movie_by_id_event.dart';
import 'package:the_movies_db/presentation/details_movie/bloc/get_movie_by_id_state.dart';

class GetMovieByIdBloc extends Bloc<GetMovieByIdEvent, GetMovieByIdState> {
  final GetMovieByIdUsecase getMovieByIdUsecase;

  GetMovieByIdBloc({
    required this.getMovieByIdUsecase,
  }) : super(const GetMovieByIdState()) {
    on<GetMovieById>(_getMovieById);
  }

  Future<void> _getMovieById(
    GetMovieById event,
    Emitter<GetMovieByIdState> emit,
  ) async {
    emit(const GetMovieByIdState(statusEnum: StatusEnum.loading));

    final failureOrSucess = await getMovieByIdUsecase(
      GetMovieByIdParams(idMovie: event.idMovie),
    );
    emit(
      failureOrSucess.fold(
        (failure) => const GetMovieByIdState(
          statusEnum: StatusEnum.error,
        ),
        (movie) => GetMovieByIdState(
          statusEnum: StatusEnum.success,
          movie: movie,
        ),
      ),
    );
  }
}
