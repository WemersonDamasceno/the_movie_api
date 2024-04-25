import 'package:flutter/material.dart';
import 'package:the_movies_db/core/utils/constants/custom_styles.dart';

class ButtonLargeWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ButtonLargeWidget({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width * 0.8;
    final size = Size(sizeWidth, 40);
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        width: size.width,
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.5),
              blurRadius: 100,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          label,
          style: CustomStyles.stylePercentText.copyWith(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
