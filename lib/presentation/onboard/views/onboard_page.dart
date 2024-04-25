import 'package:flutter/material.dart';
import 'package:the_movies_api/presentation/onboard/views/onboard_view.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const OnboardView(
      key: ValueKey('onboard_view'),
    );
  }
}
