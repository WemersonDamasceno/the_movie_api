import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonBackWidget extends StatelessWidget {
  const ButtonBackWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pop(),
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.all(8),
        key: const ValueKey('back-app-bar'),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
