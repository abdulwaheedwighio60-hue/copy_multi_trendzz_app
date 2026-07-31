import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardChartWidget extends StatelessWidget {
  const DashboardChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

    final double cardHeight = isDesktop
        ? 380
        : isTablet
        ? 340
        : 300;

    final double titleSize = isDesktop
        ? 22
        : isTablet
        ? 20
        : 18;

    final double filterSize = isDesktop
        ? 13
        : isTablet
        ? 12
        : 11;

    final double axisSize = isDesktop
        ? 12
        : isTablet
        ? 11
        : 10;

    return Container(
      height: cardHeight,
      padding: EdgeInsets.all(isDesktop ? 24 : 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sales Overview",
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 14 : 12,
                  vertical: isDesktop ? 8 : 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "This Year",
                  style: TextStyle(
                    fontSize: filterSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: isDesktop ? 30 : 20),

          Expanded(
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 100,

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 20,
                ),

                borderData: FlBorderData(show: false),

                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      reservedSize: 35,
                      showTitles: true,
                      interval: 20,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            fontSize: axisSize,
                            color: Colors.grey.shade700,
                          ),
                        );
                      },
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
                          "Jul",
                          "Aug",
                          "Sep",
                          "Oct",
                          "Nov",
                          "Dec",
                        ];

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            months[value.toInt()],
                            style: TextStyle(
                              fontSize: axisSize,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 15),
                      FlSpot(1, 25),
                      FlSpot(2, 22),
                      FlSpot(3, 38),
                      FlSpot(4, 45),
                      FlSpot(5, 42),
                      FlSpot(6, 60),
                      FlSpot(7, 68),
                      FlSpot(8, 75),
                      FlSpot(9, 72),
                      FlSpot(10, 90),
                      FlSpot(11, 95),
                    ],

                    isCurved: true,
                    color: Colors.indigo,
                    barWidth: isDesktop ? 4 : 3,
                    isStrokeCapRound: true,

                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.indigo.withOpacity(.15),
                    ),

                    dotData: FlDotData(
                      show: !isTablet,
                    ),
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