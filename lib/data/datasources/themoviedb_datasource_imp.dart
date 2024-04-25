import 'dart:convert';

import 'package:the_movies_api/core/errors/exceptions.dart';
import 'package:the_movies_api/core/http_client/http_client.dart';
import 'package:the_movies_api/core/utils/constants/themoviedb_endpoints.dart';
import 'package:the_movies_api/core/utils/keys/themoviedb_key.dart';
import 'package:the_movies_api/data/datasources/movie_datasource.dart';
import 'package:the_movies_api/data/models/movie_detail_model.dart';
import 'package:the_movies_api/data/models/movie_model.dart';

class TheMoviedbDatasourceImp implements MovieDatasource {
  final HttpClient client;
  int currentPage = 1;
  List<MovieModel> listPopularMovies = [];

  TheMoviedbDatasourceImp({required this.client});

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(
      TheMoviedbEndpoints.popularMovies(ThemovieDBKey.apiKey, currentPage),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.data);
      for (var movie in json['results']) {
        listPopularMovies.add(MovieModel.fromJson(movie));
      }
      currentPage++;
      return listPopularMovies;
    } else if (response.statusCode == 503) {
      throw const ServerException();
    } else if (response.statusCode == 404) {
      throw const NotFoundException();
    } else {
      throw const ExceptionGenerics();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await client.get(
      TheMoviedbEndpoints.trendingMovies(ThemovieDBKey.apiKey),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.data);
      List<MovieModel> listTrendingMovies = [];
      listTrendingMovies = json['results']
          .map<MovieModel>((movie) => MovieModel.fromJson(movie))
          .toList();
      return listTrendingMovies;
    } else if (response.statusCode == 503) {
      throw const ServerException();
    } else if (response.statusCode == 404) {
      throw const NotFoundException();
    } else {
      throw const ExceptionGenerics();
    }
  }

  @override
  Future<List<MovieModel>> getAllSeries() async {
    final List<MovieModel> listAllSeries = [];
    final response = await client.get(
      TheMoviedbEndpoints.getAllSeries(ThemovieDBKey.apiKey),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.data);
      for (var movie in json['results']) {
        listAllSeries.add(MovieModel.fromJson(movie));
      }
      return listAllSeries;
    } else if (response.statusCode == 503) {
      throw const ServerException();
    } else if (response.statusCode == 404) {
      throw const NotFoundException();
    } else {
      throw const ExceptionGenerics();
    }
  }

  @override
  Future<List<MovieModel>> getAllMovies() async {
    final List<MovieModel> listAllMovies = [];
    final response = await client.get(
      TheMoviedbEndpoints.getAllMovies(ThemovieDBKey.apiKey),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.data);
      for (var movie in json['results']) {
        listAllMovies.add(MovieModel.fromJson(movie));
      }
      return listAllMovies;
    } else if (response.statusCode == 503) {
      throw const ServerException();
    } else if (response.statusCode == 404) {
      throw const NotFoundException();
    } else {
      throw const ExceptionGenerics();
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await client.get(
      TheMoviedbEndpoints.movieDetail(ThemovieDBKey.apiKey, id),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.data);
      return MovieDetailModel.fromJson(json);
    } else if (response.statusCode == 503) {
      throw const ServerException();
    } else if (response.statusCode == 404) {
      throw const NotFoundException();
    } else {
      throw const ExceptionGenerics();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client.get(
      TheMoviedbEndpoints.searchMovies(ThemovieDBKey.apiKey, query),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.data);
      List<MovieModel> listMovies = [];
      listMovies = json['results']
          .map<MovieModel>((movie) => MovieModel.fromJson(movie))
          .toList();
      return listMovies;
    } else if (response.statusCode == 503) {
      throw const ServerException();
    } else if (response.statusCode == 404) {
      throw const NotFoundException();
    } else {
      throw const ExceptionGenerics();
    }
  }
}
