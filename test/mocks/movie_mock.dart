import 'package:the_movies_api/data/models/movie_model.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';

class MovieMock {
  static MovieModel model = const MovieModel(
    idModel: 1,
    titleModel: 'Movie 1',
    overviewModel: 'Overview 1',
    releaseDateModel: '2021-10-10',
    voteAverageModel: 5.0,
    posterPathModel: '/posterPath.png',
    movieDetailsModel: null,
  );

  static MovieEntity entity = MovieEntity(
    id: model.id,
    title: model.title,
    overview: model.overview,
    releaseDate: model.releaseDate,
    voteAverage: model.voteAverage,
    posterPath: model.posterPath,
    movieDetails: model.movieDetails,
  );
}
