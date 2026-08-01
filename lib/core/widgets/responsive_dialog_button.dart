import 'package:flutter/material.dart';

class ResponsiveDialogButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? icon;

  const ResponsiveDialogButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.backgroundColor,
    this.foregroundColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 600;
    final bool isTablet = width >= 600 && width < 1100;

    final double height = isMobile ? 42 : 46;

    final double horizontalPadding = isMobile
        ? 18
        : isTablet
        ? 24
        : 30;

    final double fontSize = isMobile
        ? 13
        : isTablet
        ? 14
        : 15;

    final BorderRadius borderRadius =
    BorderRadius.circular(isMobile ? 10 : 12);

    if (!isPrimary) {
      return SizedBox(
        height: height,
        child: OutlinedButton.icon(
          onPressed: onPressed,
          icon: icon != null
              ? Icon(
            icon,
            size: fontSize + 3,
          )
              : const SizedBox.shrink(),
          label: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor: foregroundColor ?? Colors.black87,
            side: BorderSide(
              color: Colors.grey.shade400,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: height,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon != null
            ? Icon(
          icon,
          size: fontSize + 3,
          color: foregroundColor ?? Colors.white,
        )
            : const SizedBox.shrink(),
        label: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: foregroundColor ?? Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.blue,
          elevation: 0,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }
}