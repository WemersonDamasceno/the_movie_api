import 'package:flutter/material.dart';

Widget makeTestableWidget({required Widget child, String locale = 'pt'}) {
  return MaterialApp(
    scaffoldMessengerKey: GlobalKey<ScaffoldMessengerState>(),
    navigatorKey: GlobalKey<NavigatorState>(),
    locale: Locale(locale),
    home: child,
  );
}
