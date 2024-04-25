import 'package:flutter/material.dart';

class ImagePathWidget extends StatelessWidget {
  final String posterPath;

  const ImagePathWidget({
    Key? key,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          posterPath,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox(
              height: 150,
              width: 150,
              child: Icon(
                Icons.image_not_supported,
                color: Colors.grey,
                size: 50,
              ),
            );
          },
        ),
      ),
    );
  }
}
