import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/statistics/statistics_model.dart';
import 'package:multi_trendzz/presentation/admin/screens/category/widget/category_statistics_widget.dart';

class StatisticCardWidget extends StatelessWidget {
  final StatisticModel data;

  const StatisticCardWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1200;
    final bool isTablet = width >= 700 && width < 1200;

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

    final bool isPositive =
    !data.growth.startsWith("-");

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
          /// Icon
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

          /// Details
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
                      isPositive
                          ? Icons.trending_up_rounded
                          : Icons.trending_down_rounded,
                      size: 15,
                      color: isPositive
                          ? Colors.green
                          : Colors.red,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      data.growth,
                      style: TextStyle(
                        fontSize: growthSize,
                        fontWeight: FontWeight.bold,
                        color: isPositive
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),

                    const SizedBox(width: 6),

                    Expanded(
                      child: Text(
                        "This Month",
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