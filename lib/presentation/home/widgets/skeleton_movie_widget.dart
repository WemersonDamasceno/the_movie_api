import 'package:flutter/material.dart';
import 'package:the_movies_api/presentation/widgets/loading_item_widget.dart';

class SkeletonMovieWidget extends StatelessWidget {
  const SkeletonMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(right: 10),
          child: LoadingItemWidget(width: 150, height: 250, radius: 7),
        );
      },
    );
  }
}
