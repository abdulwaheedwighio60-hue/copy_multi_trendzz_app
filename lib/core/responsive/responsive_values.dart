import 'package:flutter/material.dart';
import 'responsive.dart';

class ResponsiveValues {
  ResponsiveValues._();

  static double padding(BuildContext context) {
    if (Responsive.isDesktop(context)) return 22;
    if (Responsive.isTablet(context)) return 18;
    return 14;
  }

  static double title(BuildContext context) {
    if (Responsive.isDesktop(context)) return 24;
    if (Responsive.isTablet(context)) return 20;
    return 18;
  }

  static double heading(BuildContext context) {
    if (Responsive.isDesktop(context)) return 15;
    if (Responsive.isTablet(context)) return 14;
    return 13;
  }

  static double body(BuildContext context) {
    if (Responsive.isDesktop(context)) return 14;
    if (Responsive.isTablet(context)) return 13;
    return 12;
  }

  static double icon(BuildContext context) {
    if (Responsive.isDesktop(context)) return 30;
    if (Responsive.isTablet(context)) return 28;
    return 24;
  }

  static double avatar(BuildContext context) {
    if (Responsive.isDesktop(context)) return 22;
    if (Responsive.isTablet(context)) return 20;
    return 18;
  }

  static double radius(BuildContext context) {
    if (Responsive.isDesktop(context)) return 20;
    if (Responsive.isTablet(context)) return 18;
    return 16;
  }

  static double spacing(BuildContext context) {
    if (Responsive.isDesktop(context)) return 20;
    if (Responsive.isTablet(context)) return 18;
    return 14;
  }
}