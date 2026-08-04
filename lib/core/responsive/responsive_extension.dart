import 'package:flutter/material.dart';
import 'responsive.dart';

extension ResponsiveExtension on BuildContext {

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  bool get isMobile => Responsive.isMobile(this);

  bool get isTablet => Responsive.isTablet(this);

  bool get isDesktop => Responsive.isDesktop(this);

  bool get isLargeDesktop => Responsive.isLargeDesktop(this);
}