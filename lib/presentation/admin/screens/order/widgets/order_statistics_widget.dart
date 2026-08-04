import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/widgets/statistics/statictics_grid_widget.dart';
import 'package:multi_trendzz/core/widgets/statistics/statistics_model.dart';

class OrderStatisticsWidget extends StatelessWidget {
  const OrderStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const StatisticGridWidget(
      statistics: orderStatistics,
    );
  }
}

const List<StatisticModel> orderStatistics = [

  StatisticModel(
    title: "Total Orders",
    value: "12,540",
    growth: "+15%",
    icon: Icons.shopping_bag_outlined,
    color: AppColors.primaryColor,
  ),

  StatisticModel(
    title: "Pending Orders",
    value: "245",
    growth: "+5%",
    icon: Icons.pending_actions_outlined,
    color: Colors.orange,
  ),

  StatisticModel(
    title: "Shipped Orders",
    value: "1,125",
    growth: "+8%",
    icon: Icons.local_shipping_outlined,
    color: Colors.blue,
  ),

  StatisticModel(
    title: "Delivered Orders",
    value: "11,170",
    growth: "+12%",
    icon: Icons.check_circle_outline,
    color: Colors.green,
  ),
];