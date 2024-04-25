import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:the_movies_db/core/utils/constants/custom_styles.dart';
import 'package:the_movies_db/core/utils/icons/app_images.dart';

class BodyNoMoviesWidget extends StatelessWidget {
  const BodyNoMoviesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * .8,
            child: LottieBuilder.asset(AppImages.error),
          ),
          const Text(
            'No movies to show.',
            style: CustomStyles.styleTextTopic,
          ),
        ],
      ),
    );
  }
}
