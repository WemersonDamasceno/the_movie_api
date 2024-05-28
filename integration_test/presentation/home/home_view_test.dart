import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:the_movies_api/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Finder for OnboardView
  final Finder buttonEnterHome = find.byKey(const Key('enter_now_button'));
  final Finder homeView = find.byKey(const Key('home_view'));

  // Finder for HomeView
  final Finder searchButton = find.byKey(const Key('search-button'));
  final Finder buttonAllSeries = find.byKey(const Key('allSeries'));

  // Finder for SearchView
  final Finder searchInput = find.byKey(const Key('search-input'));
  final Finder firstMovie = find.byKey(const Key('movie-0'));
  final Finder unfocusSearch = find.byKey(const ValueKey('unfocus-search'));
  final Finder backButtonAppbar = find.byKey(const ValueKey('back-app-bar'));

  group("HomeView Integration Tests |", () {
    testWidgets("Search for the Naruto movie", (tester) async {
      app.main();

      // Screen OnboardView
      await tester.pumpAndSettle();
      await tester.tap(buttonEnterHome);
      await tester.pumpAndSettle();
      expect(homeView, findsOneWidget);

      // Screen HomeView
      await tester.tap(searchButton);
      await tester.pumpAndSettle();

      // Search for the SearchView
      await tester.enterText(searchInput, 'Naruto Shippuden');
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.tap(firstMovie);
      await tester.pumpAndSettle();

      // wait 3 seconds
      await Future.delayed(const Duration(seconds: 3));

      // Screen DetailsMovieView
      await tester.tap(backButtonAppbar);
      await tester.pumpAndSettle();

      //Search View
      await tester.tap(unfocusSearch);
      await tester.pumpAndSettle();
      await tester.tap(backButtonAppbar);
      await tester.pumpAndSettle();

      // Screen HomeView
      await tester.tap(buttonAllSeries);
      await tester.pumpAndSettle();
      expect(find.text('All Series'), findsOneWidget);

      // Screen AllMoviesSeriesView
      await tester.tap(firstMovie);
      await tester.pumpAndSettle();

      // Screen DetailsMovieView
      await tester.tap(backButtonAppbar);
      await tester.pumpAndSettle();

      // Screen AllMoviesSeriesView
      await tester.tap(backButtonAppbar);
      await tester.pumpAndSettle();

      expect(homeView, findsOneWidget);
    });
  });
}
