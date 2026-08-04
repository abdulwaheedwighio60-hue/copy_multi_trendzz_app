import 'package:flutter/material.dart';

class TableColumnTitle extends StatelessWidget {
  final String title;
  final TextAlign textAlign;
  final Color? color;
  final FontWeight? fontWeight;

  const TableColumnTitle(
      this.title, {
        super.key,
        this.textAlign = TextAlign.left,
        this.color,
        this.fontWeight,
      });

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

    final double fontSize = isDesktop
        ? 15
        : isTablet
        ? 14
        : 13;

    return Text(
      title,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color ?? Colors.black87,
      ),
    );
  }
}