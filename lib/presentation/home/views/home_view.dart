import 'package:flutter/material.dart';
import 'package:the_movies_db/core/utils/constants/app_colors.dart';
import 'package:the_movies_db/presentation/home/mixins/home_page_mixin.dart';
import 'package:the_movies_db/presentation/home/widgets/app_bar_home_widget.dart';
import 'package:the_movies_db/presentation/home/widgets/body_home_widget.dart';

class HomeView extends StatelessWidget with HomePageMixin {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColorPage,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: AppBarHomeWidget(),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15),
        child: BodyHomeWidget(),
      ),
    );
  }
}
