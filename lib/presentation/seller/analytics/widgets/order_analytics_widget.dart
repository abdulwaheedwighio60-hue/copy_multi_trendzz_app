import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class OrdersAnalyticsWidget extends StatelessWidget {
  const OrdersAnalyticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Header
          Row(
            children: [

              Text(
                "Orders Analytics",
                style: AppTextStyles.titleMedium,
              ),

              const Spacer(),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(.10),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  "This Week",
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          Text(
            "268 Orders",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 4.h),

          Text(
            "+12% compared to last week",
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.green,
            ),
          ),

          SizedBox(height: 24.h),

          SizedBox(
            height: 240.h,
            child: BarChart(
              BarChartData(

                maxY: 80,

                borderData: FlBorderData(show: false),

                gridData: FlGridData(
                  drawVerticalLine: false,
                  horizontalInterval: 20,
                ),

                titlesData: FlTitlesData(

                  topTitles: const AxisTitles(),

                  rightTitles: const AxisTitles(),

                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 20,
                      reservedSize: 30,
                    ),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,

                      getTitlesWidget: (value, meta) {

                        const days = [
                          "Mon",
                          "Tue",
                          "Wed",
                          "Thu",
                          "Fri",
                          "Sat",
                          "Sun",
                        ];

                        if (value.toInt() >= days.length) {
                          return const SizedBox();
                        }

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            days[value.toInt()],
                            style: AppTextStyles.bodySmall,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                barGroups: [

                  _bar(0, 22),

                  _bar(1, 38),

                  _bar(2, 46),

                  _bar(3, 34),

                  _bar(4, 55),

                  _bar(5, 68),

                  _bar(6, 61),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _bar(
      int x,
      double y,
      ) {
    return BarChartGroupData(
      x: x,

      barRods: [

        BarChartRodData(

          toY: y,

          width: 18,

          borderRadius: BorderRadius.circular(8),

          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [

              AppColors.primaryColor,

              AppColors.primaryColor.withOpacity(.55),

            ],
          ),
        ),
      ],
    );
  }
}