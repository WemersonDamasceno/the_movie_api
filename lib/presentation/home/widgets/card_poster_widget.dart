import 'package:flutter/material.dart';
import 'package:the_movies_api/core/utils/constants/custom_styles.dart';

class CardPosterWidget extends StatelessWidget {
  final String label;
  final String image;

  final Color colorInital;
  final Color colorFinal;

  final VoidCallback onTap;

  const CardPosterWidget({
    Key? key,
    required this.label,
    required this.image,
    required this.colorInital,
    required this.colorFinal,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.only(top: 16),
        height: size.height * 0.25,
        width: size.width * 0.47,
        child: Stack(
          alignment: Alignment.bottomLeft,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: size.height * 0.21,
              width: 145,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    colorInital,
                    colorFinal,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: size.width * 0.46,
                height: size.height * 0.3,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 10,
              child: Text(
                label,
                style: CustomStyles.styleTextTopic.copyWith(
                  shadows: [
                    const Shadow(
                      color: Colors.grey,
                      offset: Offset(0, 1),
                      blurRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
