import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class CustomerStatisticsWidget extends StatelessWidget {
  const CustomerStatisticsWidget({super.key});

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
        ? 2.8
        : width >= 700
        ? 2.4
        : 3.2;

    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 18,
      mainAxisSpacing: 18,
      childAspectRatio: childAspectRatio,
      children: const [

        _StatisticCard(
          title: "Total Customers",
          value: "12,540",
          icon: Icons.people_outline,
          color: Colors.blue,
        ),

        _StatisticCard(
          title: "Active Customers",
          value: "11,240",
          icon: Icons.verified_user_outlined,
          color: Colors.green,
        ),

        _StatisticCard(
          title: "Premium Customers",
          value: "2,180",
          icon: Icons.workspace_premium_outlined,
          color: Colors.orange,
        ),

        _StatisticCard(
          title: "Blocked Customers",
          value: "85",
          icon: Icons.block_outlined,
          color: Colors.red,
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
        : 28;

    final double valueSize = isDesktop
        ? 28
        : isTablet
        ? 24
        : 22;

    final double titleSize = isDesktop
        ? 15
        : isTablet
        ? 14
        : 13;

    return Container(
      padding: EdgeInsets.all(
        isDesktop ? 22 : 18,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
            width: isDesktop ? 62 : 56,
            height: isDesktop ? 62 : 56,
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
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: valueSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: titleSize,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
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