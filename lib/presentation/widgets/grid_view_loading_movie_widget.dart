import 'package:flutter/material.dart';
import 'package:the_movies_api/presentation/home/mixins/item_movie_mixin.dart';
import 'package:the_movies_api/presentation/widgets/loading_item_widget.dart';

class GridViewLoadingMovieWidget extends StatelessWidget with ItemMovieMixin {
  const GridViewLoadingMovieWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: size.width * 0.00145,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(0),
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return const LoadingItemWidget(
            height: 235,
            width: 150,
            radius: 7,
          );
        });
  }
}
