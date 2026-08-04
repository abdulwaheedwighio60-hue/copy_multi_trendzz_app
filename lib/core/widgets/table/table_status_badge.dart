import 'package:flutter/material.dart';

class TableStatusBadge extends StatelessWidget {
  final String text;

  const TableStatusBadge({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    Color color;

    switch (text.toLowerCase()) {
      case "active":
      case "completed":
      case "delivered":
      case "paid":
        color = Colors.green;
        break;

      case "pending":
      case "processing":
        color = Colors.orange;
        break;

      case "inactive":
      case "cancelled":
      case "blocked":
      case "failed":
        color = Colors.red;
        break;

      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}