import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_api/injection_container.dart';
import 'package:the_movies_api/presentation/home/get_movies_popular_trending/get_movies_popular_trending_bloc.dart';
import 'package:the_movies_api/presentation/home/views/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GetMoviesPopularTrendingBloc>(),
      child: const HomeView(
        key: ValueKey('home_view'),
      ),
    );
  }
}
