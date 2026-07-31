import 'package:flutter/material.dart';

class DashboardCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final bool isIncrease;

  const DashboardCardWidget({
    super.key,
    required this.title,
    required this.value,
    required this.percentage,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    this.isIncrease = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                title,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 24,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          /// Value
          Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          /// Growth
          Row(
            children: [

              Icon(
                isIncrease
                    ? Icons.trending_up
                    : Icons.trending_down,
                size: 18,
                color: isIncrease
                    ? Colors.green
                    : Colors.red,
              ),

              const SizedBox(width: 5),

              Text(
                percentage,
                style: TextStyle(
                  color: isIncrease
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 8),

              Text(
                "This Month",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}