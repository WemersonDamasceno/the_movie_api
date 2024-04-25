import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:the_movies_db/core/utils/constants/custom_styles.dart';
import 'package:the_movies_db/core/utils/icons/app_images.dart';
import 'package:the_movies_db/presentation/widgets/button_large_widget.dart';
import 'package:the_movies_db/presentation/widgets/text_button_widget.dart';

class BodyErrorMoviesWidget extends StatelessWidget {
  final VoidCallback onPressedTryAgain;

  const BodyErrorMoviesWidget({
    Key? key,
    required this.onPressedTryAgain,
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
            'Ops! Parece que aconteceu um erro!',
            style: CustomStyles.styleTitle,
          ),
          const SizedBox(height: 16),
          ButtonLargeWidget(
            label: 'Tentar novamente',
            onPressed: () => onPressedTryAgain(),
          ),
          const SizedBox(height: 16),
          TextButtonWidget(
            label: 'Voltar',
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
