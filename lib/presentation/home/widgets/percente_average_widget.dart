import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:the_movies_db/core/utils/constants/app_colors.dart';
import 'package:the_movies_db/core/utils/constants/custom_styles.dart';
import 'package:the_movies_db/presentation/home/mixins/item_movie_mixin.dart';

class PercentAverageWidget extends StatelessWidget with ItemMovieMixin {
  final int voteAverage;

  const PercentAverageWidget({
    Key? key,
    required this.voteAverage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: CircularPercentIndicator(
        radius: 25,
        percent: voteAverage / 100,
        circularStrokeCap: CircularStrokeCap.round,
        lineWidth: 4,
        animation: true,
        animationDuration: 3000,
        progressColor: selectColorPercentIndicator(voteAverage),
        backgroundColor: AppColors.tmdbGrey,
        fillColor: AppColors.tmdbDarkBlue,
        center: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: voteAverage.toString(),
              style: CustomStyles.stylePercentText,
            ),
            WidgetSpan(
              child: Transform.translate(
                offset: const Offset(2, -7),
                child: const Text(
                  '%',
                  textScaler: TextScaler.linear(0.5),
                  style: CustomStyles.stylePercentText,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
