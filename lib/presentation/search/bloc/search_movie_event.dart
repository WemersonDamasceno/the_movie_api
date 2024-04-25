import 'package:equatable/equatable.dart';

abstract class SearchMovieEvent extends Equatable {}

class SearchMovie extends SearchMovieEvent {
  final String query;

  SearchMovie(this.query);

  @override
  List<Object?> get props => [query];
}
