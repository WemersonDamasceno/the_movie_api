import 'package:equatable/equatable.dart';
import 'package:the_movies_db/domain/entities/movie_detail_entity.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;
  final double voteAverage;
  final MovieDetailsEntity? movieDetails;

  const MovieEntity({
    required this.id,
    required this.title,
    this.movieDetails,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
    required this.voteAverage,
  });

  copyWith({
    int? id,
    String? title,
    String? overview,
    String? releaseDate,
    String? posterPath,
    double? voteAverage,
    MovieDetailsEntity? movieDetails,
  }) {
    return MovieEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      posterPath: posterPath ?? this.posterPath,
      voteAverage: voteAverage ?? this.voteAverage,
      movieDetails: movieDetails ?? this.movieDetails,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        releaseDate,
        posterPath,
        voteAverage,
        movieDetails,
      ];
}
