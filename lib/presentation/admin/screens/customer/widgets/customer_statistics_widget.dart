import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/statistics/statictics_grid_widget.dart';
import 'package:multi_trendzz/core/widgets/statistics/statistics_model.dart';

class CustomerStatisticsWidget extends StatelessWidget {
  const CustomerStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const StatisticGridWidget(
      statistics: customerStatistics,
    );
  }
}

const List<StatisticModel> customerStatistics = [

  StatisticModel(
    title: "Total Customers",
    value: "12,540",
    growth: "+12%",
    icon: Icons.people_outline,
    color: Colors.blue,
  ),

  StatisticModel(
    title: "Active Customers",
    value: "11,240",
    growth: "+8%",
    icon: Icons.verified_user_outlined,
    color: Colors.green,
  ),

  StatisticModel(
    title: "Premium Customers",
    value: "2,180",
    growth: "+15%",
    icon: Icons.workspace_premium_outlined,
    color: Colors.orange,
  ),

  StatisticModel(
    title: "Blocked Customers",
    value: "85",
    growth: "-3%",
    icon: Icons.block_outlined,
    color: Colors.red,
  ),
];