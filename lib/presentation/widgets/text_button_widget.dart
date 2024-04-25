import 'package:flutter/material.dart';
import 'package:the_movies_db/core/utils/constants/custom_styles.dart';

class TextButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const TextButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: () => onPressed(),
      child: Text(
        label,
        style: CustomStyles.styleTitle,
      ),
    );
  }
}
