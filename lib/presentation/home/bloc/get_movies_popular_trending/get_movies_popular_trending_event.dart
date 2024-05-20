part of 'get_movies_popular_trending_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class PopularMoviesLoadEvent extends MovieEvent {
  const PopularMoviesLoadEvent();
  @override
  List<Object> get props => [];
}

class TrendingMoviesLoadEvent extends MovieEvent {
  const TrendingMoviesLoadEvent();

  @override
  List<Object> get props => [];
}
