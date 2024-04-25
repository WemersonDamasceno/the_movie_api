import 'package:flutter/material.dart';
import 'package:the_movies_db/core/utils/constants/app_colors.dart';

enum StatusMovieEnum {
  released(name: "Released"),
  upcoming(name: "Upcoming");

  final String name;

  const StatusMovieEnum({required this.name});
}

extension StatusMovieEnumExtension on StatusMovieEnum {
  String get value {
    switch (this) {
      case StatusMovieEnum.released:
        return 'Released';
      default:
        return 'Upcoming';
    }
  }

  Color get color {
    switch (this) {
      case StatusMovieEnum.released:
        return AppColors.green;
      default:
        return Colors.black;
    }
  }
}
