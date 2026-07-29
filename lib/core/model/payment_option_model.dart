import 'package:flutter/material.dart';

enum PaymentType {
  selectable,
  action, payment,
}
class PaymentOptionModel {
  final String title;
  final IconData? icon;
  final String? imagePath;
  final PaymentType type;

  final Color? iconColor;
  final Color? iconBackgroundColor;

  PaymentOptionModel({
    required this.title,
    this.icon,
    this.imagePath,
    required this.type,
    this.iconColor,
    this.iconBackgroundColor,
  });
}