part of 'get_movies_popular_trending_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class PopularMovieLoadingState extends MovieState {
  const PopularMovieLoadingState();
  @override
  List<Object> get props => [];
}

class TrendingMovieLoadingState extends MovieState {
  const TrendingMovieLoadingState();
  @override
  List<Object> get props => [];
}

class PopularMoviesLoadedState extends MovieState {
  final List<MovieEntity> listPopularMovies;
  const PopularMoviesLoadedState({required this.listPopularMovies});
  @override
  List<Object> get props => [listPopularMovies];
}

class TrendingMoviesLoadedState extends MovieState {
  final List<MovieEntity> listTrendingMovies;
  const TrendingMoviesLoadedState({required this.listTrendingMovies});
  @override
  List<Object> get props => [listTrendingMovies];
}

class MoviesErrorState extends MovieState {
  final String message;
  const MoviesErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
