import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_db/domain/entities/movie_entity.dart';
import 'package:the_movies_db/injection_container.dart';
import 'package:the_movies_db/presentation/details_movie/bloc/get_movie_by_id_bloc.dart';
import 'package:the_movies_db/presentation/details_movie/views/details_movie_view.dart';

class DetailsMoviePage extends StatelessWidget {
  final MovieEntity movieEntity;

  const DetailsMoviePage({Key? key, required this.movieEntity})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<GetMovieByIdBloc>(),
        ),
      ],
      child: DetailsMovieView(movieEntity: movieEntity),
    );
  }
}
