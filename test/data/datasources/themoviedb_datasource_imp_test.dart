import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movies_db/core/errors/exceptions.dart';
import 'package:the_movies_db/core/http_client/http_client.dart';
import 'package:the_movies_db/data/datasources/themoviedb_datasource_imp.dart';
import 'package:the_movies_db/data/models/companies_model.dart';
import 'package:the_movies_db/data/models/movie_detail_model.dart';
import 'package:the_movies_db/data/models/movie_model.dart';

import '../../mocks/companies_mock.dart';
import '../../mocks/movie_detail_mock.dart';
import '../../mocks/movie_mock.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late TheMoviedbDatasourceImp movieDatasourceImp;
  late HttpClient client;

  final MovieModel movieModel = MovieMock.model;
  const logo = 'https://image.tmdb.org/t/p/w500/logoPath.png';
  final CompaniesModel companiesModel = CompaniesMock.model.copy();

  MovieDetailModel movieDetailModel = MovieDetailMock.model.copy();
  movieDetailModel = MovieDetailMock.model.copy(
    companies: [companiesModel],
  );

  const posterPath = 'https://image.tmdb.org/t/p/w500/posterPath.png';
  const backdropPath = 'https://image.tmdb.org/t/p/w500/backdropPath.png';
  final List<MovieModel> expectedMovies = [
    movieModel.copy(id: 1, title: 'Movie 1'),
    movieModel.copy(id: 2, title: 'Movie 2'),
  ];

  setUp(() {
    client = MockHttpClient();
    movieDatasourceImp = TheMoviedbDatasourceImp(client: client);
  });

  group("Datasource PopularMovies |", () {
    test("should return list of movies when the call is successful", () async {
      // Arrange
      final responseJson = {
        'results': expectedMovies.map((movie) => movie.moviesToJson()).toList()
      };
      when(() => client.get(any())).thenAnswer((_) async => HttpResponse(
            data: jsonEncode(responseJson),
            statusCode: 200,
          ));

      // Act
      final result = await movieDatasourceImp.getPopularMovies();

      // Assert
      expect(result, expectedMovies.map((e) => e.copy(posterPath: posterPath)));
    });

    test("should throw a NotFoundException when the call is not successful",
        () async {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 404, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getPopularMovies();
      expect(result, throwsA(const NotFoundException()));
    });

    test("should throw a ServerException when the call is not successful",
        () async {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 503, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getPopularMovies();
      expect(result, throwsA(const ServerException()));
    });

    test("should throw a ExceptionGenerics when the call is not successful",
        () {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 500, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getPopularMovies();
      expect(result, throwsA(const ExceptionGenerics()));
    });
  });

  group("Datasource TrendingMovies |", () {
    test("should return list of movies when the call is successful", () async {
      // Arrange
      final responseJson = {
        'results': expectedMovies.map((movie) => movie.moviesToJson()).toList()
      };
      when(() => client.get(any())).thenAnswer((_) async => HttpResponse(
            data: jsonEncode(responseJson),
            statusCode: 200,
          ));

      // Act
      final result = await movieDatasourceImp.getTrendingMovies();

      // Assert
      expect(result, expectedMovies.map((e) => e.copy(posterPath: posterPath)));
    });
    test("should throw a NotFoundException when the call is not successful",
        () async {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 404, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getTrendingMovies();
      expect(result, throwsA(const NotFoundException()));
    });

    test("should throw a ServerException when the call is not successful",
        () async {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 503, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getTrendingMovies();
      expect(result, throwsA(const ServerException()));
    });

    test("should throw a ExceptionGenerics when the call is not successful",
        () {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 500, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getTrendingMovies();
      expect(result, throwsA(const ExceptionGenerics()));
    });
  });

  group("Datasource AllSeries |", () {
    test("should return list of series when the call is successful", () async {
      // Arrange
      final responseJson = {
        'results': expectedMovies.map((movie) => movie.seriesToJson()).toList()
      };
      when(() => client.get(any())).thenAnswer((_) async => HttpResponse(
            data: jsonEncode(responseJson),
            statusCode: 200,
          ));

      // Act
      final result = await movieDatasourceImp.getAllSeries();

      // Assert
      expect(result, expectedMovies.map((e) => e.copy(posterPath: posterPath)));
    });

    test("should throw a NotFoundException when the call is not successful",
        () async {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 404, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getAllSeries();
      expect(result, throwsA(const NotFoundException()));
    });

    test("should throw a ServerException when the call is not successful",
        () async {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 503, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getAllSeries();
      expect(result, throwsA(const ServerException()));
    });

    test("should throw a ExceptionGenerics when the call is not successful",
        () {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 500, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getAllSeries();
      expect(result, throwsA(const ExceptionGenerics()));
    });
  });

  group("Datasource AllMovies |", () {
    test("should return list of movies when the call is successful", () async {
      // Arrange
      final responseJson = {
        'results': expectedMovies.map((movie) => movie.moviesToJson()).toList()
      };
      when(() => client.get(any())).thenAnswer((_) async => HttpResponse(
            data: jsonEncode(responseJson),
            statusCode: 200,
          ));

      // Act
      final result = await movieDatasourceImp.getAllMovies();

      // Assert
      expect(result, expectedMovies.map((e) => e.copy(posterPath: posterPath)));
    });
    test("should throw a NotFoundException when the call is not successful",
        () async {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 404, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getAllMovies();
      expect(result, throwsA(const NotFoundException()));
    });

    test("should throw a ServerException when the call is not successful",
        () async {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 503, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getAllMovies();
      expect(result, throwsA(const ServerException()));
    });

    test("should throw a ExceptionGenerics when the call is not successful",
        () {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 500, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getAllMovies();
      expect(result, throwsA(const ExceptionGenerics()));
    });
  });

  group("Datasource MovieDetail |", () {
    test("should return movieDetails when the call is successful", () async {
      // Arrange
      final responseJson = movieDetailModel.toJson();
      when(() => client.get(any())).thenAnswer((_) async => HttpResponse(
            data: jsonEncode(responseJson),
            statusCode: 200,
          ));

      // Act
      final result = await movieDatasourceImp.getMovieDetail(1);

      // Assert
      expect(
          result,
          movieDetailModel.copy(
            backdropPath: backdropPath,
            companies: [companiesModel.copy(logoPath: logo)],
          ));
    });
    test("should throw a NotFoundException when the call is not successful",
        () async {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 404, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getMovieDetail(1);
      expect(result, throwsA(const NotFoundException()));
    });

    test("should throw a ServerException when the call is not successful",
        () async {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 503, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getMovieDetail(1);
      expect(result, throwsA(const ServerException()));
    });

    test("should throw a ExceptionGenerics when the call is not successful",
        () {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 500, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.getMovieDetail(1);
      expect(result, throwsA(const ExceptionGenerics()));
    });
  });

  group("Datasource SearchMovies |", () {
    test("should return list of movies when search movie call is successful",
        () async {
      // Arrange
      final responseJson = {
        'results': expectedMovies.map((movie) => movie.moviesToJson()).toList()
      };
      when(() => client.get(any())).thenAnswer((_) async => HttpResponse(
            data: jsonEncode(responseJson),
            statusCode: 200,
          ));

      // Act
      final result = await movieDatasourceImp.searchMovies(
        expectedMovies.first.title,
      );

      // Assert
      expect(result, expectedMovies.map((e) => e.copy(posterPath: posterPath)));
    });
    test("should throw a NotFoundException when the call is not successful",
        () async {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 404, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.searchMovies("query");
      expect(result, throwsA(const NotFoundException()));
    });

    test("should throw a ServerException when the call is not successful",
        () async {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 503, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.searchMovies("query");
      expect(result, throwsA(const ServerException()));
    });

    test("should throw a ExceptionGenerics when the call is not successful",
        () {
      when(() => client.get(any())).thenAnswer((_) async =>
          HttpResponse(statusCode: 500, data: "Ops! something went wrong"));
      final result = movieDatasourceImp.searchMovies("query");
      expect(result, throwsA(const ExceptionGenerics()));
    });
  });
}
