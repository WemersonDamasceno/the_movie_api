import 'package:flutter/material.dart';
import 'package:the_movies_db/core/utils/constants/custom_styles.dart';
import 'package:the_movies_db/core/utils/enums/status_movie_enum.dart';
import 'package:the_movies_db/presentation/details_movie/widgets/backdrop_image_widget.dart';
import 'package:the_movies_db/presentation/details_movie/widgets/image_path_widget.dart';

class ImageDetailWidget extends StatelessWidget {
  final String posterPath;
  final String backdropPath;
  final StatusMovieEnum status;

  const ImageDetailWidget({
    Key? key,
    required this.posterPath,
    required this.backdropPath,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BackdropImageWidget(backdropPath: backdropPath),
        ImagePathWidget(posterPath: posterPath),
        Positioned(
          top: 25,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: status.color,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              status.value,
              style: CustomStyles.styleTextSubtitle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
