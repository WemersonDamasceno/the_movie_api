import 'package:flutter/material.dart';
import 'package:the_movies_api/core/utils/constants/custom_styles.dart';
import 'package:the_movies_api/core/utils/helpers/date_formatter.dart';
import 'package:the_movies_api/presentation/home/mixins/item_movie_mixin.dart';
import 'package:the_movies_api/presentation/home/widgets/percente_average_widget.dart';

class ItemMovieWidget extends StatelessWidget with ItemMovieMixin {
  final String title;
  final String imageURL;
  final String date;
  final int voteAverage;

  const ItemMovieWidget({
    Key? key,
    required this.title,
    required this.imageURL,
    required this.voteAverage,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 235,
          width: 150,
          child: Stack(
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.network(
                    imageURL,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                          size: 50,
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                    width: 150,
                    height: 225,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 15,
                child: PercentAverageWidget(
                  voteAverage: voteAverage,
                ),
              ),
            ],
          ),
        ),
        Tooltip(
          message: title,
          child: SizedBox(
            width: 150,
            child: Text(
              title,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: CustomStyles.styleTitle,
            ),
          ),
        ),
        Text(
          DateFormatter.formatDate(date),
          style: CustomStyles.styleTextSubtitle,
        ),
      ],
    );
  }
}
