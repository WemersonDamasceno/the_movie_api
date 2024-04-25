import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the_movies_api/core/utils/constants/app_colors.dart';
import 'package:the_movies_api/injection_container.dart';
import 'package:the_movies_api/presentation/router/router.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'The Movies DB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "SourceSansPro",
        primaryColor: AppColors.tmdbDarkBlue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.tmdbDarkBlue,
          secondary: AppColors.tmdbLighterGreen,
        ),
      ),
      routerConfig: router,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("pt", "BR"),
      ],
    );
  }
}
