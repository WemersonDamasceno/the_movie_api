import 'package:the_movies_api/core/utils/keys/themoviedb_key.dart';
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

  factory MovieModel.movieFromJson(Map<String, dynamic> json) => MovieModel(
        idModel: json['id'],
        titleModel: json['title'] as String,
        overviewModel: json['overview'] as String,
        releaseDateModel: json['release_date'] as String,
        posterPathModel: "${ThemovieDBKey.baseUrlImage}${json['poster_path']}",
        voteAverageModel: double.parse((json['vote_average']).toString()),
        movieDetailsModel: null,
      );

  factory MovieModel.seriesFromJson(Map<String, dynamic> json) => MovieModel(
        idModel: json['id'],
        titleModel: json['name'] as String,
        overviewModel: json['overview'] as String,
        releaseDateModel: json['first_air_date'],
        posterPathModel: "${ThemovieDBKey.baseUrlImage}${json['poster_path']}",
        voteAverageModel: double.parse((json['vote_average']).toString()),
        movieDetailsModel: null,
      );

  Map<String, dynamic> moviesToJson() => {
        'id': idModel,
        'title': titleModel,
        'overview': overviewModel,
        'release_date': releaseDateModel,
        'poster_path': posterPathModel,
        'vote_average': voteAverageModel,
      };

  Map<String, dynamic> seriesToJson() => {
        'id': idModel,
        'name': titleModel,
        'overview': overviewModel,
        'first_air_date': releaseDateModel,
        'poster_path': posterPathModel,
        'vote_average': voteAverageModel,
      };

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
