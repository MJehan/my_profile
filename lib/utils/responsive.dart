import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
          MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double horizontalPadding(BuildContext context) {
    final w = width(context);
    if (w < 600) return 20;
    if (w < 1000) return 40;
    if (w < 1400) return 80;
    return (w - 1200) / 2;
  }

  static double sectionPadding(BuildContext context) =>
      isMobile(context) ? 60 : 100;

  static int projectColumns(BuildContext context) {
    if (isDesktop(context)) return 3;
    if (isTablet(context)) return 2;
    return 1;
  }

  static int skillColumns(BuildContext context) {
    if (isDesktop(context)) return 4;
    if (isTablet(context)) return 2;
    return 2;
  }
}