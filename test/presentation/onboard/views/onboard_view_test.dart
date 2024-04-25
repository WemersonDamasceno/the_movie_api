import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movies_db/presentation/onboard/views/onboard_page.dart';

class MockGoRouter extends Mock implements GoRouter {}

class MockGoRouterProvider extends StatelessWidget {
  const MockGoRouterProvider({
    required this.goRouter,
    required this.child,
    Key? key,
  }) : super(key: key);

  /// The mock navigator used to mock navigation calls.
  final MockGoRouter goRouter;

  /// The child [Widget] to render.
  final Widget child;

  @override
  Widget build(BuildContext context) => InheritedGoRouter(
        goRouter: goRouter,
        child: child,
      );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Widget child;

  //late MockGoRouter mockGoRouter;
  //final button = find.byKey(const ValueKey('enter_now_button'));

  setUp(() {
    //mockGoRouter = MockGoRouter();
    child = OnboardPage(
      key: UniqueKey(),
    );
  });

  group('OnboardView', () {
    testWidgets('renders all widgets correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: child));

      await tester.pump();

      expect(
        find.byKey(const ValueKey('onboard_view')),
        findsOneWidget,
      );
    });

    // testWidgets('navigates to home page when button is pressed',
    //     (WidgetTester tester) async {
    //   await tester.runAsync(() async {
    //     await tester.pumpWidget(makeTestableWidget(
    //         child: MockGoRouterProvider(
    //       goRouter: mockGoRouter,
    //       child: child,
    //     )));

    //     await tester.pump();

    //     await tester.tap(button);

    //     verify(
    //       () => mockGoRouter.pushReplacementNamed(RoutesPathEnum.home.name),
    //     ).called(1);
    //   });
    // });
  });
}
