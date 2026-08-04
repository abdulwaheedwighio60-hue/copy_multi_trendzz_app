import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/statistics/statictics_grid_widget.dart';
import 'package:multi_trendzz/core/widgets/statistics/statistics_model.dart';

class SellerStatisticsWidget extends StatelessWidget {
  const SellerStatisticsWidget({super.key});

  static const List<StatisticModel> statistics = [
    StatisticModel(
      title: "Total Sellers",
      value: "1,250",
      growth: "+12%",
      icon: Icons.people_alt_outlined,
      color: Colors.blue,
    ),
    StatisticModel(
      title: "Active Sellers",
      value: "1,120",
      growth: "+8%",
      icon: Icons.verified_user_outlined,
      color: Colors.green,
    ),
    StatisticModel(
      title: "Pending Sellers",
      value: "75",
      growth: "+5%",
      icon: Icons.hourglass_empty,
      color: Colors.orange,
    ),
    StatisticModel(
      title: "Blocked Sellers",
      value: "55",
      growth: "-2%",
      icon: Icons.block,
      color: Colors.red,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return StatisticGridWidget(
      statistics: statistics,
    );
  }
}