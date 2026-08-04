import 'package:flutter/material.dart';

class Responsive {
  Responsive._();

  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static bool isMobile(BuildContext context) =>
      width(context) < 700;

  static bool isTablet(BuildContext context) =>
      width(context) >= 700 && width(context) < 1100;

  static bool isDesktop(BuildContext context) =>
      width(context) >= 1100;

  static bool isLargeDesktop(BuildContext context) =>
      width(context) >= 1400;

  static bool isSmallMobile(BuildContext context) =>
      width(context) < 400;
}