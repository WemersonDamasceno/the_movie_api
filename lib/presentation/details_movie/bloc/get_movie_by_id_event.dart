import 'package:equatable/equatable.dart';

abstract class GetMovieByIdEvent extends Equatable {}

class GetMovieById extends GetMovieByIdEvent {
  final int idMovie;

  GetMovieById({
    required this.idMovie,
  });

  @override
  List<Object?> get props => [idMovie];
}
