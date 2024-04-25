import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonBackWidget extends StatelessWidget {
  const ButtonBackWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kToolbarHeight,
        left: 16,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
          ),
          onPressed: () => GoRouter.of(context).pop(),
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
