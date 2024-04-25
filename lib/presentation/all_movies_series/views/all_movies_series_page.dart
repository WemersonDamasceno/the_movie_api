import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_db/injection_container.dart';
import 'package:the_movies_db/presentation/all_movies_series/bloc/get_all_movies_series/get_all_movies_series_bloc.dart';
import 'package:the_movies_db/presentation/all_movies_series/views/all_movies_series_view.dart';

class AllMoviesSeriesPage extends StatelessWidget {
  final String category;

  const AllMoviesSeriesPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetAllMoviesSeriesBloc>(),
      child: AllMoviesSeriesView(
        category: category,
      ),
    );
  }
}
