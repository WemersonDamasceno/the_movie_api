import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_api/core/utils/constants/app_colors.dart';
import 'package:the_movies_api/core/utils/enums/feature_flags_enum.dart';
import 'package:the_movies_api/core/utils/enums/status_enum.dart';
import 'package:the_movies_api/core/utils/helpers/permissions_app.dart';
import 'package:the_movies_api/domain/entities/movie_entity.dart';
import 'package:the_movies_api/presentation/details_movie/bloc/get_movie_by_id_bloc.dart';
import 'package:the_movies_api/presentation/details_movie/bloc/get_movie_by_id_event.dart';
import 'package:the_movies_api/presentation/details_movie/bloc/get_movie_by_id_state.dart';
import 'package:the_movies_api/presentation/details_movie/widgets/body_detail_loading_widget.dart';
import 'package:the_movies_api/presentation/details_movie/widgets/body_detail_movie_success_widget.dart';
import 'package:the_movies_api/presentation/details_movie/widgets/button_back_widget.dart';
import 'package:the_movies_api/presentation/widgets/body_error_movies_widget.dart';
import 'package:the_movies_api/presentation/widgets/button_large_widget.dart';

class DetailsMovieView extends StatefulWidget {
  final MovieEntity movieEntity;

  const DetailsMovieView({
    Key? key,
    required this.movieEntity,
  }) : super(key: key);

  @override
  State<DetailsMovieView> createState() => _DetailsMovieViewState();
}

class _DetailsMovieViewState extends State<DetailsMovieView> {
  late GetMovieByIdBloc _getMovieByIdBloc;

  final PermissionsApp _permissionsApp = PermissionsApp();
  bool _isFeatureEnabled = false;

  @override
  void initState() {
    super.initState();
    _getMovieByIdBloc = BlocProvider.of<GetMovieByIdBloc>(context);

    _getMovieByIdBloc.add(
      GetMovieById(
        idMovie: widget.movieEntity.id,
      ),
    );

    _verifyFeature();
  }

  _verifyFeature() async {
    _isFeatureEnabled = await _permissionsApp.isFeatureEnabled(
      FeatureFlagsEnum.watchTrailer,
    );
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();

    _getMovieByIdBloc.close();
    _isFeatureEnabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        floatingActionButton: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 20,
            ),
            child: const ButtonBackWidget(),
          ),
        ),
        backgroundColor: AppColors.backgroundColorPage,
        body: Stack(
          children: [
            BlocBuilder<GetMovieByIdBloc, GetMovieByIdState>(
              bloc: _getMovieByIdBloc,
              builder: (context, state) {
                switch (state.statusEnum) {
                  case StatusEnum.error:
                    return BodyErrorMoviesWidget(
                      onPressedTryAgain: () {
                        _getMovieByIdBloc.add(
                          GetMovieById(
                            idMovie: widget.movieEntity.id,
                          ),
                        );
                      },
                    );

                  case StatusEnum.success:
                    return BodyDetailMoveSuccessWidget(
                      movie: widget.movieEntity.copyWith(
                        movieDetails: state.movie,
                      ),
                    );
                  default:
                    return const BodyDetailLoadingWidget();
                }
              },
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Visibility(
                visible: _isFeatureEnabled,
                child: ButtonLargeWidget(
                  key: const ValueKey("back-home"),
                  label: "Watch trailer",
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
