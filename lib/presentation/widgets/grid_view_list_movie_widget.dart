import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_api/core/utils/enums/routes_path_enum.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/presentation/home/mixins/item_movie_mixin.dart';
import 'package:the_movies_api/presentation/home/widgets/item_movie_widget.dart';

class GridViewListMovieWidget extends StatelessWidget with ItemMovieMixin {
  final List<MovieEntity> moviesList;
  const GridViewListMovieWidget({
    Key? key,
    required this.moviesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: size.width * 0.001055,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(0),
        itemCount: moviesList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          final MovieEntity movie = moviesList[index];

          return InkWell(
            key: ValueKey('movie-$index'),
            onTap: () {
              GoRouter.of(context).pushNamed(
                RoutesPathEnum.detailsMovie.name,
                extra: movie,
              );
            },
            child: ItemMovieWidget(
              title: movie.title,
              imageURL: movie.posterPath,
              voteAverage: formatterVoteAverage(movie.voteAverage),
              date: movie.releaseDate,
            ),
          );
        });
  }
}
