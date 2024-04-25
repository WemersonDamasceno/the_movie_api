import 'package:flutter/material.dart';
import 'package:the_movies_db/presentation/widgets/loading_item_widget.dart';

class BodyDetailLoadingWidget extends StatelessWidget {
  const BodyDetailLoadingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        LoadingItemWidget(
          width: MediaQuery.of(context).size.width,
          height: size.height * 0.3,
          radius: 7,
        ),
        const SizedBox(height: 16),
        LoadingItemWidget(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 80,
          radius: 7,
        ),
        const SizedBox(height: 16),
        LoadingItemWidget(
          width: MediaQuery.of(context).size.width * 0.9,
          height: size.height * 0.4,
          radius: 7,
        ),
        const SizedBox(height: 16),
        LoadingItemWidget(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50,
          radius: 7,
        ),
      ],
    );
  }
}
