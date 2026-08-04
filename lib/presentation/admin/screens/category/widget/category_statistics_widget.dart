import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/statistics/statictics_grid_widget.dart';
import 'package:multi_trendzz/core/widgets/statistics/statistics_model.dart';

class CategoryStatisticsWidget extends StatelessWidget {
  const CategoryStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const StatisticGridWidget(
      statistics: categoryStatistics,
    );
  }
}

const List<StatisticModel> categoryStatistics = [

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