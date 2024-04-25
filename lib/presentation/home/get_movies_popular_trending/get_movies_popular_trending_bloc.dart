import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/domain/usecases/get_list_popular_movies_usecase.dart';
import 'package:the_movies_api/domain/usecases/get_list_trending_movies_usecase.dart';

part 'get_movies_popular_trending_event.dart';
part 'get_movies_popular_trending_state.dart';

class GetMoviesPopularTrendingBloc extends Bloc<MovieEvent, MovieState> {
  final GetPopularMoviesUseCase getMoviesPopularUseCase;
  final GetTrendingMoviesUsecase getMoviesTrendingUsecase;

  GetMoviesPopularTrendingBloc({
    required this.getMoviesPopularUseCase,
    required this.getMoviesTrendingUsecase,
  }) : super(const PopularMovieLoadingState()) {
    on<PopularMoviesLoadEvent>(_getPopularMovies);
    on<TrendingMoviesLoadEvent>(_getTrendingMovies);
  }

  Future<void> _getPopularMovies(event, emit) async {
    emit(const PopularMovieLoadingState());
    final failureOrSucess = await getMoviesPopularUseCase(0);
    emit(
      failureOrSucess.fold(
          (failure) =>
              const MoviesErrorState(message: "Ops! Something went wrong"),
          (movies) => PopularMoviesLoadedState(listPopularMovies: movies)),
    );
  }

  Future<void> _getTrendingMovies(event, emit) async {
    emit(const TrendingMovieLoadingState());
    final failureOrSucess = await getMoviesTrendingUsecase(0);
    emit(
      failureOrSucess.fold(
          (failure) =>
              const MoviesErrorState(message: "Ops! Something went wrong"),
          (movies) => TrendingMoviesLoadedState(listTrendingMovies: movies)),
    );
  }
}
