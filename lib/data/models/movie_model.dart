import 'package:the_movies_api/core/utils/constants/the_movie_constants.dart';
import 'package:the_movies_api/data/models/movie_detail_model.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final int idModel;
  final String titleModel;
  final String overviewModel;
  final String releaseDateModel;
  final String posterPathModel;
  final double voteAverageModel;
  final MovieDetailModel? movieDetailsModel;

  const MovieModel({
    required this.idModel,
    required this.titleModel,
    required this.overviewModel,
    required this.releaseDateModel,
    required this.posterPathModel,
    required this.voteAverageModel,
    this.movieDetailsModel,
  }) : super(
          id: idModel,
          title: titleModel,
          overview: overviewModel,
          releaseDate: releaseDateModel,
          posterPath: posterPathModel,
          voteAverage: voteAverageModel,
          movieDetails: movieDetailsModel,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final isMovie = json['first_air_date'] == null;

    if (isMovie == true) {
      return MovieModel(
        idModel: json['id'],
        titleModel: json['title'] as String,
        overviewModel: json['overview'] as String,
        releaseDateModel: json['release_date'],
        posterPathModel:
            "${TheMoviesConstants.baseUrlImage}${json['poster_path']}",
        voteAverageModel: double.parse((json['vote_average']).toString()),
        movieDetailsModel: null,
      );
    }

    return MovieModel(
      idModel: json['id'],
      titleModel: json['name'] as String,
      overviewModel: json['overview'] as String,
      releaseDateModel: json['first_air_date'],
      posterPathModel:
          "${TheMoviesConstants.baseUrlImage}${json['poster_path']}",
      voteAverageModel: double.parse((json['vote_average']).toString()),
      movieDetailsModel: null,
    );
  }

  Map<String, dynamic> toJson() {
    if (releaseDateModel.contains('-')) {
      return {
        'id': idModel,
        'title': titleModel,
        'overview': overviewModel,
        'release_date': releaseDateModel,
        'poster_path': posterPathModel,
        'vote_average': voteAverageModel,
      };
    }

    return {
      'id': idModel,
      'name': titleModel,
      'overview': overviewModel,
      'first_air_date': releaseDateModel,
      'poster_path': posterPathModel,
      'vote_average': voteAverageModel,
    };
  }

  MovieModel copy({
    int? id,
    String? title,
    String? overview,
    String? releaseDate,
    String? posterPath,
    double? voteAverage,
    MovieDetailModel? movieDetails,
  }) {
    return MovieModel(
      idModel: id ?? idModel,
      titleModel: title ?? titleModel,
      overviewModel: overview ?? overviewModel,
      releaseDateModel: releaseDate ?? releaseDateModel,
      posterPathModel: posterPath ?? posterPathModel,
      voteAverageModel: voteAverage ?? voteAverageModel,
      movieDetailsModel: movieDetails ?? movieDetailsModel,
    );
  }
}
