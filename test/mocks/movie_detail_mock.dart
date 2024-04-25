import 'package:the_movies_db/core/utils/enums/status_movie_enum.dart';
import 'package:the_movies_db/data/models/movie_detail_model.dart';
import 'package:the_movies_db/domain/entities/movie_detail_entity.dart';

class MovieDetailMock {
  static MovieDetailModel model = const MovieDetailModel(
    backdropPathModel: '/backdropPath.png',
    statusModel: StatusMovieEnum.released,
    taglineModel: 'Tagline',
    voteCountModel: 100,
    companiesModel: null,
  );

  static MovieDetailsEntity entity = MovieDetailsEntity(
    backdropPath: model.backdropPathModel,
    status: model.statusModel,
    tagline: model.taglineModel,
    voteCount: model.voteCountModel,
    companies: model.companiesModel,
  );
}
