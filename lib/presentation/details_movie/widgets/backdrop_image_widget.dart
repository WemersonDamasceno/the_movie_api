import 'package:flutter/material.dart';

class BackdropImageWidget extends StatelessWidget {
  final String backdropPath;

  const BackdropImageWidget({
    Key? key,
    required this.backdropPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(1),
            Colors.transparent,
          ],
          stops: const [0.3, 0.9],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: Image.network(
        backdropPath,
        fit: BoxFit.cover,
        width: size.width,
        height: size.height * 0.4,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: SizedBox(
              height: size.height * 0.4,
              width: 150,
              child: const Icon(
                Icons.image_not_supported,
                color: Colors.grey,
                size: 50,
              ),
            ),
          );
        },
      ),
    );
  }
}
