import 'package:equatable/equatable.dart';
import 'package:the_movies_api/core/utils/enums/status_movie_enum.dart';
import 'package:the_movies_api/domain/entities/companies_entity.dart';

class MovieDetailsEntity extends Equatable {
  final String backdropPath;
  final StatusMovieEnum status;
  final String tagline;
  final int voteCount;
  final List<CompaniesEntity>? companies;

  const MovieDetailsEntity({
    this.companies,
    required this.backdropPath,
    required this.status,
    required this.tagline,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        status,
        tagline,
        voteCount,
        companies,
      ];
}
