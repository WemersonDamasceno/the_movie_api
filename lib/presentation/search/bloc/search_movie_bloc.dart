import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_api/core/utils/enums/status_enum.dart';
import 'package:the_movies_api/domain/usecases/search_movie_usecase.dart';
import 'package:the_movies_api/presentation/search/bloc/search_movie_event.dart';
import 'package:the_movies_api/presentation/search/bloc/search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovieUsecase searchMovieUsecase;

  SearchMovieBloc({required this.searchMovieUsecase})
      : super(const SearchMovieState()) {
    on<SearchMovie>(_searchMovie);
  }

  _searchMovie(SearchMovie event, Emitter<SearchMovieState> emit) async {
    emit(state.copyWith(status: StatusEnum.loading));
    final result = await searchMovieUsecase(event.query);
    result.fold(
      (failure) => emit(state.copyWith(status: StatusEnum.error)),
      (movies) => emit(state.copyWith(
        status: movies.isNotEmpty ? StatusEnum.success : StatusEnum.empty,
        movies: movies,
      )),
    );
  }
}
