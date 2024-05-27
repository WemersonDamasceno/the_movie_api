import 'package:the_movies_api/core/utils/constants/the_movie_constants.dart';
import 'package:the_movies_api/core/utils/enums/status_movie_enum.dart';
import 'package:the_movies_api/data/models/companies_model.dart';
import 'package:the_movies_api/domain/entities/movie_detail_entity.dart';

class MovieDetailModel extends MovieDetailsEntity {
  final String backdropPathModel;
  final StatusMovieEnum statusModel;
  final String taglineModel;
  final int voteCountModel;
  final List<CompaniesModel>? companiesModel;

  const MovieDetailModel({
    required this.backdropPathModel,
    required this.statusModel,
    required this.taglineModel,
    required this.voteCountModel,
    this.companiesModel,
  }) : super(
          backdropPath: backdropPathModel,
          status: statusModel,
          tagline: taglineModel,
          voteCount: voteCountModel,
          companies: companiesModel,
        );

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    final status = json['status'] as String;
    final companies = json['production_companies'] as List;

    return MovieDetailModel(
      backdropPathModel:
          "${TheMoviesConstants.baseUrlImage}${json['backdrop_path']}",
      companiesModel: companies.map((e) => CompaniesModel.fromJson(e)).toList(),
      voteCountModel: json['vote_count'] as int,
      taglineModel: json['tagline'] as String,
      statusModel: getStatusMovie(status),
    );
  }

  static StatusMovieEnum getStatusMovie(String statusMovie) {
    if (statusMovie == 'Released') {
      return StatusMovieEnum.released;
    } else {
      return StatusMovieEnum.upcoming;
    }
  }

  Map<String, dynamic> toJson() => {
        'backdrop_path': backdropPathModel,
        'status': status.name,
        'tagline': tagline,
        'vote_count': voteCount,
        'production_companies': companiesModel?.map((e) => e.toJson()).toList(),
      };

  copy({
    String? backdropPath,
    StatusMovieEnum? status,
    String? tagline,
    int? voteCount,
    List<CompaniesModel>? companies,
  }) {
    return MovieDetailModel(
      backdropPathModel: backdropPath ?? this.backdropPath,
      statusModel: status ?? this.status,
      taglineModel: tagline ?? this.tagline,
      voteCountModel: voteCount ?? this.voteCount,
      companiesModel: companies ?? companiesModel,
    );
  }
}
