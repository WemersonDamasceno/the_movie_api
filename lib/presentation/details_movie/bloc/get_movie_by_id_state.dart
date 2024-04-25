import 'package:equatable/equatable.dart';
import 'package:the_movies_api/core/utils/enums/status_enum.dart';
import 'package:the_movies_api/domain/entities/movie_detail_entity.dart';

class GetMovieByIdState extends Equatable {
  final MovieDetailsEntity? movie;
  final StatusEnum statusEnum;

  const GetMovieByIdState({
    this.movie,
    this.statusEnum = StatusEnum.initial,
  });

  GetMovieByIdState copyWith({
    MovieDetailsEntity? movie,
    StatusEnum? statusEnum,
  }) {
    return GetMovieByIdState(
      movie: movie ?? this.movie,
      statusEnum: statusEnum ?? this.statusEnum,
    );
  }

  @override
  List<Object?> get props => [movie, statusEnum];
}
