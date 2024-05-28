import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_api/core/utils/constants/app_colors.dart';
import 'package:the_movies_api/core/utils/constants/custom_styles.dart';
import 'package:the_movies_api/core/utils/enums/status_enum.dart';
import 'package:the_movies_api/presentation/details_movie/widgets/button_back_widget.dart';
import 'package:the_movies_api/presentation/search/bloc/search_movie_bloc.dart';
import 'package:the_movies_api/presentation/search/bloc/search_movie_event.dart';
import 'package:the_movies_api/presentation/search/bloc/search_movie_state.dart';
import 'package:the_movies_api/presentation/search/widgets/search_input_widget.dart';
import 'package:the_movies_api/presentation/widgets/body_error_movies_widget.dart';
import 'package:the_movies_api/presentation/widgets/body_no_movies_widget.dart';
import 'package:the_movies_api/presentation/widgets/grid_view_list_movie_widget.dart';
import 'package:the_movies_api/presentation/widgets/grid_view_loading_movie_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late SearchMovieBloc _searchMovieBloc;
  late TextEditingController _inputController;
  late Timer _debounce;

  @override
  void initState() {
    super.initState();

    _inputController = TextEditingController();
    _debounce = Timer(const Duration(milliseconds: 500), () {});

    _searchMovieBloc = BlocProvider.of<SearchMovieBloc>(context)
      ..add(SearchMovie(''));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColorPage,
        elevation: 0,
        leading: ButtonBackWidget(),
        title: GestureDetector(
          key: ValueKey('unfocus-search'),
          onTap: () => FocusScope.of(context).unfocus(),
          child: const Text(
            "Search for a movie",
            style: CustomStyles.styleTextTopic,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColorPage,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  SearchInputWidget(
                    inputController: _inputController,
                    onSearch: (value) {
                      _debounce.cancel();
                      _debounce = Timer(const Duration(milliseconds: 800), () {
                        _searchMovieBloc.add(SearchMovie(value));
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<SearchMovieBloc, SearchMovieState>(
                    bloc: _searchMovieBloc,
                    builder: (context, state) {
                      switch (state.status) {
                        case StatusEnum.empty:
                          return const BodyNoMoviesWidget();
                        case StatusEnum.error:
                          return BodyErrorMoviesWidget(
                            onPressedTryAgain: () {
                              _searchMovieBloc.add(
                                SearchMovie(_inputController.text),
                              );
                            },
                          );
                        case StatusEnum.success:
                          return SizedBox(
                            height: size.height * .73,
                            child: GridViewListMovieWidget(
                              moviesList: state.movies!,
                            ),
                          );
                        default:
                          return SizedBox(
                            height: size.height * .73,
                            child: const GridViewLoadingMovieWidget(),
                          );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
