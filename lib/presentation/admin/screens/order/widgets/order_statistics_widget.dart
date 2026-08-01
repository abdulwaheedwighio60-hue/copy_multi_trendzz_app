import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class OrderStatisticsWidget extends StatelessWidget {
  const OrderStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount;

    if (width >= 1100) {
      crossAxisCount = 4;
    } else if (width >= 700) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 1;
    }

    final double childAspectRatio = width >= 1100
        ? 2.2
        : width >= 700
        ? 2.5
        : 2.8;

    return GridView.count(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 18,
      mainAxisSpacing: 18,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: childAspectRatio,
      children: const [

        _StatisticCard(
          title: "Total Orders",
          value: "12,540",
          icon: Icons.shopping_bag_outlined,
          color: AppColors.primaryColor,
        ),

        _StatisticCard(
          title: "Pending Orders",
          value: "245",
          icon: Icons.pending_actions,
          color: Colors.orange,
        ),

        _StatisticCard(
          title: "Shipped Orders",
          value: "1,125",
          icon: Icons.local_shipping_outlined,
          color: Colors.blue,
        ),

        _StatisticCard(
          title: "Delivered Orders",
          value: "11,170",
          icon: Icons.check_circle_outline,
          color: Colors.green,
        ),
      ],
    );
  }
}

class _StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatisticCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

    final double iconSize = isDesktop
        ? 34
        : isTablet
        ? 30
        : 26;

    final double titleSize = isDesktop
        ? 14
        : isTablet
        ? 13
        : 12;

    final double valueSize = isDesktop
        ? 28
        : isTablet
        ? 24
        : 22;

    return Container(
      padding: EdgeInsets.all(
        isDesktop
            ? 22
            : isTablet
            ? 18
            : 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [

          Container(
            width: isDesktop ? 65 : 58,
            height: isDesktop ? 65 : 58,
            decoration: BoxDecoration(
              color: color.withOpacity(.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: color,
              size: iconSize,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: titleSize,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  value,
                  style: TextStyle(
                    fontSize: valueSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}