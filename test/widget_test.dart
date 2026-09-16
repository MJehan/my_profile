// Widget tests for MD Jehan's portfolio app.
//
// These tests verify the core structure of the portfolio renders
// correctly: the navbar, hero section, and key content pieces.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_profile/main.dart';
import 'package:my_profile/utils/constants.dart';

void main() {
  group('Portfolio app smoke tests', () {
    testWidgets('App renders without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(const JehanPortfolioApp());
      await tester.pump(const Duration(milliseconds: 100));

      // App should be present
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('Navbar shows the logo initials "MJ"', (WidgetTester tester) async {
      await tester.pumpWidget(const JehanPortfolioApp());
      await tester.pump(const Duration(milliseconds: 100));

      // The logo shows "MJ" in the navbar
      expect(find.text('MJ'), findsWidgets);
    });

    testWidgets('Hero section shows the name and role',
            (WidgetTester tester) async {
          // Use a wide surface so desktop layout renders (name is always shown)
          tester.view.physicalSize = const Size(1400, 900);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(tester.view.reset);

          await tester.pumpWidget(const JehanPortfolioApp());
          await tester.pump(const Duration(milliseconds: 100));

          // Hero name (rendered inside a ShaderMask, but still a Text widget)
          expect(find.text(AppConstants.name), findsOneWidget);

          // Role is shown in the hero
          expect(find.text(AppConstants.role), findsOneWidget);
        });

    testWidgets('Section titles are present after initial render',
            (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1400, 2400);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(tester.view.reset);

          await tester.pumpWidget(const JehanPortfolioApp());
          await tester.pump(const Duration(milliseconds: 100));

          // Section eyebrows are rendered
          expect(find.text('ABOUT ME'), findsOneWidget);
          expect(find.text('CAREER'), findsOneWidget);
          expect(find.text('PORTFOLIO'), findsOneWidget);
          expect(find.text('EXPERTISE'), findsOneWidget);
          expect(find.text('BACKGROUND'), findsOneWidget);
          expect(find.text('GET IN TOUCH'), findsOneWidget);
        });

    testWidgets('Contact section shows email and phone',
            (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1400, 4000);
          tester.view.devicePixelRatio = 1.0;
          addTearDown(tester.view.reset);

          await tester.pumpWidget(const JehanPortfolioApp());
          await tester.pump(const Duration(milliseconds: 100));

          // Scroll down to contact section to ensure it's laid out
          await tester.scrollUntilVisible(
            find.text(AppConstants.email),
            500,
            scrollable: find.byType(Scrollable).first,
          );
          await tester.pump(const Duration(milliseconds: 100));

          expect(find.text(AppConstants.email), findsOneWidget);
          expect(find.text(AppConstants.phone), findsOneWidget);
        });
  });
}