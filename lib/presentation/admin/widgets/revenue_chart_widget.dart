import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';


class RevenueChartWidget extends StatelessWidget {
  const RevenueChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "Revenue Overview",
                style: AppTextStyles.titleLarge,
              ),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(.10),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Text(
                  "This Year",
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

            ],
          ),

          SizedBox(height: 8.h),

          Text(
            "\$124,560",
            style: AppTextStyles.headlineLarge,
          ),

          SizedBox(height: 4.h),

          Text(
            "+18.2% than last year",
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.green,
            ),
          ),

          SizedBox(height: 25.h),

          SizedBox(
            height: 250.h,
            child: LineChart(
              LineChartData(

                borderData: FlBorderData(show: false),

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                ),

                titlesData: FlTitlesData(

                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                    ),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {

                        const months = [
                          "Jan",
                          "Feb",
                          "Mar",
                          "Apr",
                          "May",
                          "Jun",
                          "Jul"
                        ];

                        if (value.toInt() >= months.length) {
                          return const SizedBox();
                        }

                        return Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                            months[value.toInt()],
                            style: AppTextStyles.caption,
                          ),
                        );
                      },
                    ),
                  ),

                ),

                lineBarsData: [

                  LineChartBarData(

                    isCurved: true,

                    color: AppColors.primaryColor,

                    barWidth: 4,

                    dotData: const FlDotData(show: false),

                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.primaryColor.withOpacity(.12),
                    ),

                    spots: const [

                      FlSpot(0, 10),

                      FlSpot(1, 30),

                      FlSpot(2, 25),

                      FlSpot(3, 45),

                      FlSpot(4, 38),

                      FlSpot(5, 62),

                      FlSpot(6, 55),

                    ],

                  ),

                ],

              ),
            ),
          ),

        ],
      ),
    );
  }
}