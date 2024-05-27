import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:the_movies_api/core/utils/enums/status_movie_enum.dart';
import 'package:the_movies_api/domain/entities/movie_detail_entity.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/presentation/details_movie/views/details_movie_page.dart';

void main() {
  testGoldens("Details movie", (tester) async {
    await loadAppFonts();

    final builderDevice = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.phone,
        Device.iphone11,
        Device(name: "mega", size: Size(400, 600), textScale: 1.5),
      ])
      ..addScenario(
        name: "Details movie",
        widget: DetailsMoviePage(
          movieEntity: MovieEntity(
            id: 1,
            title: 'Title',
            overview: 'Overview',
            movieDetails: MovieDetailsEntity(
              backdropPath:
                  "https://img.elo7.com.br/product/zoom/25E7D76/big-poster-filme-vingadores-ultimato-lo003-tamanho-90x60-cm-presente-nerd.jpg",
              status: StatusMovieEnum.released,
              tagline: 'Tagline',
              voteCount: 432,
            ),
            posterPath:
                'https://img.elo7.com.br/product/zoom/25E7D5A/big-poster-filme-vingadores-ultimato-lo002-tamanho-90x60-cm-poster-cinema.jpg',
            releaseDate: '2022-01-01',
            voteAverage: 10,
          ),
        ),
      );

    await tester.pumpDeviceBuilder(builderDevice);

    await screenMatchesGolden(tester, "details_movie");
  });
}
