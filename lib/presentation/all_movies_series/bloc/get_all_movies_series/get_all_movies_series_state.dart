part of 'get_all_movies_series_bloc.dart';

class GetAllMoviesSeriesState extends Equatable {
  final StatusEnum status;
  final List<MovieEntity>? listMovies;

  const GetAllMoviesSeriesState({
    this.status = StatusEnum.initial,
    this.listMovies,
  });

  GetAllMoviesSeriesState copyWith({
    StatusEnum? status,
    List<MovieEntity>? listMovies,
  }) {
    return GetAllMoviesSeriesState(
      status: status ?? this.status,
      listMovies: listMovies ?? this.listMovies,
    );
  }

  @override
  List<Object?> get props => [status, listMovies];
}
