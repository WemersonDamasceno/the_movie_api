import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_api/core/utils/constants/app_colors.dart';
import 'package:the_movies_api/core/utils/constants/custom_styles.dart';
import 'package:the_movies_api/core/utils/enums/routes_path_enum.dart';
import 'package:the_movies_api/core/utils/icons/app_images.dart';
import 'package:the_movies_api/presentation/widgets/button_large_widget.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColorPage,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            Image.asset(
              AppImages.backdrop,
              width: size.width,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Onboarding",
                style: CustomStyles.styleTextTopic.copyWith(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: size.width * 0.5,
                child: const Text(
                  "Watch everything you want for free!",
                  textAlign: TextAlign.center,
                  style: CustomStyles.stylePercentText,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ButtonLargeWidget(
                key: const ValueKey('enter_now_button'),
                label: "Enter now",
                onPressed: () {
                  GoRouter.of(context).pushReplacementNamed(
                    RoutesPathEnum.home.name,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
