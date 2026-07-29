import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponTicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double radius = 11.r;
    final double cutRadius = 12.r;
    final double cutCenterY = size.height * 0.55;

    final Path path = Path();

    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);

    path.quadraticBezierTo(
      size.width,
      0,
      size.width,
      radius,
    );

    path.lineTo(size.width, cutCenterY - cutRadius);

    path.arcToPoint(
      Offset(size.width, cutCenterY + cutRadius),
      radius: Radius.circular(cutRadius),
      clockwise: false,
    );

    path.lineTo(size.width, size.height - radius);

    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - radius,
      size.height,
    );

    path.lineTo(radius, size.height);

    path.quadraticBezierTo(
      0,
      size.height,
      0,
      size.height - radius,
    );

    path.lineTo(0, cutCenterY + cutRadius);

    path.arcToPoint(
      Offset(0, cutCenterY - cutRadius),
      radius: Radius.circular(cutRadius),
      clockwise: false,
    );

    path.lineTo(0, radius);

    path.quadraticBezierTo(
      0,
      0,
      radius,
      0,
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CouponTicketClipper oldClipper) {
    return false;
  }
}