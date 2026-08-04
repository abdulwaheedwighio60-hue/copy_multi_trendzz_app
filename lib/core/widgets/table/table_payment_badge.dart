import 'package:flutter/material.dart';

class TablePaymentBadge extends StatelessWidget {
  final String text;

  const TablePaymentBadge({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

    final double fontSize = isDesktop
        ? 13
        : isTablet
        ? 12
        : 11;

    final bool isPaid = text.toLowerCase() == "paid";

    final Color color = isPaid
        ? Colors.green
        : Colors.orange;

    return Container(
      height: isDesktop ? 28 : 32,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? 12
            : isTablet
            ? 10
            : 8,
        vertical: isDesktop
            ? 2
            : isTablet
            ? 4
            : 5,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}