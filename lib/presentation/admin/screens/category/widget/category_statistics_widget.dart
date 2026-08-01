import 'package:flutter/material.dart';

class CategoryStatisticsWidget extends StatelessWidget {
  const CategoryStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    int crossAxisCount;
    double childAspectRatio;

    if (width >= 1400) {
      crossAxisCount = 4;
      childAspectRatio = 2.5;
    } else if (width >= 1000) {
      crossAxisCount = 4;
      childAspectRatio = 2.2;
    } else if (width >= 700) {
      crossAxisCount = 2;
      childAspectRatio = 2.3;
    } else {
      crossAxisCount = 1;
      childAspectRatio = 2.8;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: statistics.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return StatisticCard(
          data: statistics[index],
        );
      },
    );
  }
}

class StatisticModel {
  final String title;
  final String value;
  final String growth;
  final IconData icon;
  final Color color;

  const StatisticModel({
    required this.title,
    required this.value,
    required this.growth,
    required this.icon,
    required this.color,
  });
}

const List<StatisticModel> statistics = [

  StatisticModel(
    title: "Total Categories",
    value: "120",
    growth: "+10%",
    icon: Icons.category_outlined,
    color: Colors.blue,
  ),

  StatisticModel(
    title: "Active Categories",
    value: "98",
    growth: "+6%",
    icon: Icons.check_circle_outline,
    color: Colors.green,
  ),

  StatisticModel(
    title: "Inactive Categories",
    value: "22",
    growth: "-2%",
    icon: Icons.block_outlined,
    color: Colors.red,
  ),

  StatisticModel(
    title: "Products Assigned",
    value: "2,540",
    growth: "+15%",
    icon: Icons.inventory_2_outlined,
    color: Colors.orange,
  ),
];

class StatisticCard extends StatelessWidget {
  final StatisticModel data;

  const StatisticCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1200;
    final bool isTablet = width >= 700 && width < 1200;
    final bool isMobile = width < 700;

    final double iconBox =
    isDesktop ? 56 : isTablet ? 60 : 54;

    final double iconSize =
    isDesktop ? 26 : isTablet ? 28 : 26;

    final double titleSize =
    isDesktop ? 12 : isTablet ? 13 : 12;

    final double valueSize =
    isDesktop ? 22 : isTablet ? 25 : 22;

    final double growthSize =
    isDesktop ? 11 : isTablet ? 12 : 11;

    final double monthSize =
    isDesktop ? 10 : isTablet ? 11 : 10;

    return Container(
      padding: EdgeInsets.all(
        isDesktop ? 16 : 18,
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
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [

          Container(
            width: iconBox,
            height: iconBox,
            decoration: BoxDecoration(
              color: data.color.withOpacity(.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              data.icon,
              color: data.color,
              size: iconSize,
            ),
          ),

          SizedBox(
            width: isDesktop ? 14 : 18,
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: titleSize,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  data.value,
                  style: TextStyle(
                    fontSize: valueSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  children: [

                    Icon(
                      data.growth.startsWith("-")
                          ? Icons.trending_down_rounded
                          : Icons.trending_up_rounded,
                      size: 15,
                      color: data.growth.startsWith("-")
                          ? Colors.red
                          : Colors.green,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      data.growth,
                      style: TextStyle(
                        fontSize: growthSize,
                        fontWeight: FontWeight.bold,
                        color: data.growth.startsWith("-")
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Expanded(
                      child: Text(
                        "This Month",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: monthSize,
                          color: Colors.grey.shade500,
                        ),
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