import 'package:flutter/material.dart';

class BottomNavItem {
  const BottomNavItem({
    required this.title,
    required this.icon,
    required this.activeIcon,
  });

  final String title;
  final IconData icon;
  final IconData activeIcon;
}