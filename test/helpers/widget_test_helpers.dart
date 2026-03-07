import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Wraps a widget with MaterialApp for testing
Widget makeTestableWidget(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}

/// Wraps a widget with MaterialApp and custom theme for testing
Widget makeTestableWidgetWithTheme({
  required Widget child,
  ThemeData? lightTheme,
  ThemeData? darkTheme,
  ThemeMode themeMode = ThemeMode.light,
}) {
  return MaterialApp(
    theme: lightTheme,
    darkTheme: darkTheme,
    themeMode: themeMode,
    home: Scaffold(
      body: child,
    ),
  );
}

/// Pumps a widget and settles all animations
Future<void> pumpWidgetAndSettle(
  WidgetTester tester,
  Widget widget, {
  Duration? duration,
}) async {
  await tester.pumpWidget(widget);
  await tester.pumpAndSettle(duration?? const Duration(seconds: 1));
}

/// Finds a widget by its type and index
Finder findByTypeWithIndex<T>(int index) {
  return find.byType(T).at(index);
}

/// Waits for a specific duration
Future<void> waitFor(Duration duration) {
  return Future.delayed(duration);
}

/// Extension for WidgetTester to add helper methods
extension WidgetTesterX on WidgetTester {
  /// Taps a widget and waits for animations to settle
  Future<void> tapAndSettle(Finder finder) async {
    await tap(finder);
    await pumpAndSettle();
  }

  /// Enters text and waits for animations to settle
  Future<void> enterTextAndSettle(Finder finder, String text) async {
    await enterText(finder, text);
    await pumpAndSettle();
  }

  /// Scrolls until visible and waits for animations to settle
  Future<void> scrollUntilVisibleAndSettle({
    required Finder item,
    required Finder scrollable,
    double delta = 100,
  }) async {
    await scrollUntilVisible(item, delta, scrollable: scrollable);
    await pumpAndSettle();
  }
}
