import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:the_movies_db/core/utils/constants/custom_styles.dart';
import 'package:the_movies_db/core/utils/helpers/formatte_text_size.dart';
import 'package:the_movies_db/domain/entities/movie_entity.dart';
import 'package:the_movies_db/presentation/details_movie/widgets/company_widget.dart';
import 'package:the_movies_db/presentation/details_movie/widgets/image_detail_widget.dart';

class BodyDetailMoveSuccessWidget extends StatelessWidget {
  final MovieEntity movie;

  const BodyDetailMoveSuccessWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageDetailWidget(
              posterPath: movie.posterPath,
              status: movie.movieDetails!.status,
              backdropPath: movie.movieDetails!.backdropPath,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        formatteTextSize(movie.movieDetails!.tagline, 25),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 232, 232, 232),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          RatingStars(
                            value: movie.voteAverage * 5 / 10,
                            starBuilder: (index, color) => Icon(
                              Icons.star_rounded,
                              color: color,
                            ),
                            valueLabelVisibility: false,
                            animationDuration: const Duration(seconds: 3),
                            starColor: Colors.yellow,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "From ${movie.movieDetails!.voteCount} users",
                            style: CustomStyles.styleTextSubtitle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    formatteTextSize(movie.overview, 325),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF8F8F8F),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.7,
                minWidth: size.width * 0.4,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: movie.movieDetails!.companies!.map((company) {
                  return CompanyWidget(company: company);
                }).toList(),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ],
    );
  }
}
