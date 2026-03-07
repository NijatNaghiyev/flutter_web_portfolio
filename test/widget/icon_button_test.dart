import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_portfolio/core/widgets/icon_button.dart';

void main() {
  group('IcButton Widget', () {
    testWidgets('renders SVG icon', (tester) async {
      // Arrange
      const testIconPath = 'assets/svgs/test_icon.svg';
      var tapped = false;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IcButton(
              icon: testIconPath,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(IcButton), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('calls onTap callback when tapped', (tester) async {
      // Arrange
      const testIconPath = 'assets/svgs/test_icon.svg';
      var tapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IcButton(
              icon: testIconPath,
              onTap: () {
                tapCount++;
              },
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(InkWell));
      await tester.pump();

      // Assert
      expect(tapCount, 1);
    });

    testWidgets('calls onTap multiple times when tapped multiple times', (
      tester,
    ) async {
      // Arrange
      const testIconPath = 'assets/svgs/test_icon.svg';
      var tapCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IcButton(
              icon: testIconPath,
              onTap: () {
                tapCount++;
              },
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      await tester.tap(find.byType(InkWell));
      await tester.pump();
      await tester.tap(find.byType(InkWell));
      await tester.pump();

      // Assert
      expect(tapCount, 3);
    });

    testWidgets('has circular border', (tester) async {
      // Arrange
      const testIconPath = 'assets/svgs/test_icon.svg';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IcButton(
              icon: testIconPath,
              onTap: () {},
            ),
          ),
        ),
      );

      // Act
      final inkWell = tester.widget<InkWell>(find.byType(InkWell));

      // Assert
      expect(inkWell.customBorder, isA<CircleBorder>());
    });

    testWidgets('has correct padding', (tester) async {
      // Arrange
      const testIconPath = 'assets/svgs/test_icon.svg';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IcButton(
              icon: testIconPath,
              onTap: () {},
            ),
          ),
        ),
      );

      // Act
      final padding = tester.widget<Padding>(
        find.descendant(
          of: find.byType(InkWell),
          matching: find.byType(Padding),
        ),
      );

      // Assert
      expect(padding.padding, const EdgeInsets.all(8));
    });

    testWidgets('has hover callback', (tester) async {
      // Arrange
      const testIconPath = 'assets/svgs/test_icon.svg';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IcButton(
              icon: testIconPath,
              onTap: () {},
            ),
          ),
        ),
      );

      // Find the InkWell widget
      final inkWellFinder = find.byType(InkWell);
      expect(inkWellFinder, findsOneWidget);

      // Verify InkWell has onHover callback
      final inkWell = tester.widget<InkWell>(inkWellFinder);
      expect(inkWell.onHover, isNotNull);
    });
  });
}
