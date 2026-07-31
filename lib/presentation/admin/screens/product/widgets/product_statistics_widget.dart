import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class ProductStatisticsWidget extends StatelessWidget {
  const ProductStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;

    final int crossAxisCount = isDesktop
        ? 4
        : isTablet
        ? 2
        : 1;

    final double childAspectRatio = isDesktop
        ? 2.2
        : isTablet
        ? 2.4
        : 2.8;

    return GridView.count(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 18,
      mainAxisSpacing: 18,
      childAspectRatio: childAspectRatio,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: const [

        _StatisticCard(
          title: "Total Products",
          value: "2,540",
          icon: Icons.inventory_2_outlined,
          color: Colors.blue,
          growth: "+12%",
        ),

        _StatisticCard(
          title: "Active Products",
          value: "2,180",
          icon: Icons.check_circle_outline,
          color: Colors.green,
          growth: "+8%",
        ),

        _StatisticCard(
          title: "Pending Approval",
          value: "210",
          icon: Icons.pending_actions_outlined,
          color: Colors.orange,
          growth: "+5%",
        ),

        _StatisticCard(
          title: "Out of Stock",
          value: "150",
          icon: Icons.remove_shopping_cart_outlined,
          color: Colors.red,
          growth: "-3%",
        ),
      ],
    );
  }
}

class _StatisticCard extends StatelessWidget {

  final String title;
  final String value;
  final String growth;
  final IconData icon;
  final Color color;

  const _StatisticCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.growth,
  });

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;

    return Container(
      padding: EdgeInsets.all(
        isMobile
            ? 16
            : isTablet
            ? 18
            : 22,
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
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        children: [

          Container(
            width: isMobile ? 52 : 60,
            height: isMobile ? 52 : 60,
            decoration: BoxDecoration(
              color: color.withOpacity(.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: color,
              size: isMobile ? 26 : 30,
            ),
          ),

          SizedBox(width: isMobile ? 14 : 18),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: isMobile
                        ? 12
                        : isTablet
                        ? 13
                        : 14,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  value,
                  style: TextStyle(
                    fontSize: isMobile
                        ? 22
                        : isTablet
                        ? 24
                        : 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [

                    Icon(
                      growth.startsWith("-")
                          ? Icons.trending_down
                          : Icons.trending_up,
                      size: 16,
                      color: growth.startsWith("-")
                          ? Colors.red
                          : Colors.green,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      growth,
                      style: TextStyle(
                        color: growth.startsWith("-")
                            ? Colors.red
                            : Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: isMobile ? 11 : 12,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Text(
                      "This Month",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: isMobile ? 10 : 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}