import 'package:flutter/material.dart';

class AppColors {
  static const tmdbDarkBlue = Color.fromRGBO(3, 37, 65, 1);
  static const tmdbLightBlue = Color.fromRGBO(1, 180, 228, 1);

  static const tmdbLighterGreen = Color.fromRGBO(30, 213, 169, 1);
  static const tmdbLogoGreen = Color.fromRGBO(144, 206, 161, 1);
  static const accountBlue = Color.fromRGBO(1, 119, 210, 1);
  static const tmdbGrey = Color.fromRGBO(94, 94, 94, 0.973);

  static const backgroundColorPage = Color(0xFF1A1A1D);

  static const green = Color.fromRGBO(23, 156, 0, 1);

  static const tmdbGradiente = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.topRight,
    colors: [
      tmdbLighterGreen,
      tmdbLightBlue,
    ],
  );
}
