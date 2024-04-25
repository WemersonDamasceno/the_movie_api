import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movies_db/presentation/onboard/views/onboard_page.dart';
import 'package:the_movies_db/presentation/onboard/views/onboard_view.dart';

void main() {
  group('OnboardPage', () {
    testWidgets('renders OnboardView', (WidgetTester tester) async {
      // Build our page and trigger a frame.
      await tester.pumpWidget(const MaterialApp(home: OnboardPage()));

      // Verify that OnboardView is rendered.
      expect(find.byType(OnboardView), findsOneWidget);
    });
  });
}
