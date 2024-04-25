import 'package:the_movies_api/data/models/movie_detail_model.dart';
import 'package:the_movies_api/data/models/movie_model.dart';

abstract class MovieDatasource {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTrendingMovies();

  Future<MovieDetailModel> getMovieDetail(int id);

  Future<List<MovieModel>> searchMovies(String query);

  Future<List<MovieModel>> getAllSeries();
  Future<List<MovieModel>> getAllMovies();
}
