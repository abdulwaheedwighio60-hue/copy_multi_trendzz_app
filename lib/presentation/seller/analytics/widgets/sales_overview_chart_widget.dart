import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class SalesOverviewChartWidget extends StatelessWidget {
  const SalesOverviewChartWidget({super.key});

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
                "Sales Overview",
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
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Text(
                  "This Month",
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 8.h),

          Text(
            "\$45,820 Revenue",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 4.h),

          Text(
            "+18.4% compared to last month",
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.green,
            ),
          ),

          SizedBox(height: 25.h),

          SizedBox(
            height: 250.h,
            child: LineChart(
              LineChartData(

                minX: 0,
                maxX: 6,

                minY: 0,
                maxY: 100,

                borderData: FlBorderData(
                  show: false,
                ),

                gridData: FlGridData(
                  drawVerticalLine: false,
                  horizontalInterval: 20,
                ),

                titlesData: FlTitlesData(

                  topTitles:
                  const AxisTitles(),

                  rightTitles:
                  const AxisTitles(),

                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 34,
                      interval: 20,
                    ),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,

                      getTitlesWidget:
                          (value, meta) {

                        switch (value.toInt()) {

                          case 0:
                            return const Text("Mon");

                          case 1:
                            return const Text("Tue");

                          case 2:
                            return const Text("Wed");

                          case 3:
                            return const Text("Thu");

                          case 4:
                            return const Text("Fri");

                          case 5:
                            return const Text("Sat");

                          case 6:
                            return const Text("Sun");

                        }

                        return const SizedBox();
                      },
                    ),
                  ),
                ),

                lineBarsData: [

                  LineChartBarData(

                    isCurved: true,

                    color: AppColors.primaryColor,

                    barWidth: 4,

                    dotData: FlDotData(
                      show: true,
                    ),

                    belowBarData: BarAreaData(

                      show: true,

                      gradient: LinearGradient(

                        begin: Alignment.topCenter,

                        end: Alignment.bottomCenter,

                        colors: [

                          AppColors.primaryColor.withOpacity(.30),

                          AppColors.primaryColor.withOpacity(.05),

                        ],
                      ),
                    ),

                    spots: const [

                      FlSpot(0, 18),

                      FlSpot(1, 30),

                      FlSpot(2, 42),

                      FlSpot(3, 35),

                      FlSpot(4, 58),

                      FlSpot(5, 72),

                      FlSpot(6, 90),

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