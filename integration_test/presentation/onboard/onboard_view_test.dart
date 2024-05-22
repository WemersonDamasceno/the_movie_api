import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:the_movies_api/main.dart' as app;

void main() {
  // Wait for the application to initialize
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final Finder buttonEnterHome = find.byKey(const Key('enter_now_button'));
  final Finder homeView = find.byKey(const Key('home_view'));

  group("Onboard view test", () {
    testWidgets("Navigate to home view", (WidgetTester tester) async {
      // Run the main app
      app.main();

      await tester.pumpAndSettle();

      await tester.tap(buttonEnterHome);

      await tester.pumpAndSettle();

      expect(homeView, findsOneWidget);
      expect(buttonEnterHome, findsNothing);
    });
  });
}
