import 'package:equatable/equatable.dart';
import 'package:the_movies_api/core/utils/enums/status_enum.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';

class SearchMovieState extends Equatable {
  final StatusEnum status;
  final List<MovieEntity>? movies;

  const SearchMovieState({
    this.status = StatusEnum.initial,
    this.movies,
  });

  SearchMovieState copyWith({
    StatusEnum? status,
    List<MovieEntity>? movies,
  }) {
    return SearchMovieState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
    );
  }

  @override
  List<Object?> get props => [status, movies];
}
