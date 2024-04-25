part of 'get_all_movies_series_bloc.dart';

abstract class GetAllMoviesSeriesEvent extends Equatable {
  const GetAllMoviesSeriesEvent();
}

class GetAllMoviesSeries extends GetAllMoviesSeriesEvent {
  final String category;

  const GetAllMoviesSeries({
    required this.category,
  });

  @override
  List<Object> get props => [category];
}
