import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_db/injection_container.dart';
import 'package:the_movies_db/presentation/search/bloc/search_movie_bloc.dart';
import 'package:the_movies_db/presentation/search/views/search_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchMovieBloc>(),
      child: const SearchView(),
    );
  }
}
