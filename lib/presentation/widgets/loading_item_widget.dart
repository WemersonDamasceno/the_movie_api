import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingItemWidget extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final EdgeInsets? margin;

  const LoadingItemWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.radius,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade700,
      highlightColor: Colors.grey.shade500,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
