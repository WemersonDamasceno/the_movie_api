// ignore_for_file: constant_identifier_names

class TheMoviedbEndpoints {
  static const String BASE_API_URL = "https://api.themoviedb.org/3";

  static String popularMovies(String apiKey, int page) =>
      '$BASE_API_URL/movie/popular?api_key=$apiKey&page=$page';

  static String trendingMovies(String apiKey) =>
      '$BASE_API_URL/trending/movie/week?api_key=$apiKey';

  static String movieDetail(String apiKey, int id) =>
      '$BASE_API_URL/movie/$id?api_key=$apiKey';

  static String searchMovies(String apiKey, String query) =>
      '$BASE_API_URL/search/movie?api_key=$apiKey&query=$query&page=1';

  static String getAllSeries(String apiKey) =>
      '$BASE_API_URL/tv/popular?api_key=$apiKey';

  static String getAllMovies(String apiKey) =>
      '$BASE_API_URL/movie/popular?api_key=$apiKey';
}
