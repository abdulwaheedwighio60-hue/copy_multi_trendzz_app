import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/statistics/statictics_grid_widget.dart';
import 'package:multi_trendzz/core/widgets/statistics/statistics_model.dart';

class ProductStatisticsWidget extends StatelessWidget {
  const ProductStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const StatisticGridWidget(
      statistics: productStatistics,
    );
  }
}

const List<StatisticModel> productStatistics = [

  StatisticModel(
    title: "Total Products",
    value: "2,540",
    growth: "+12%",
    icon: Icons.inventory_2_outlined,
    color: Colors.blue,
  ),

  StatisticModel(
    title: "Active Products",
    value: "2,180",
    growth: "+8%",
    icon: Icons.check_circle_outline,
    color: Colors.green,
  ),

  StatisticModel(
    title: "Pending Approval",
    value: "210",
    growth: "+5%",
    icon: Icons.pending_actions_outlined,
    color: Colors.orange,
  ),

  StatisticModel(
    title: "Out of Stock",
    value: "150",
    growth: "-3%",
    icon: Icons.remove_shopping_cart_outlined,
    color: Colors.red,
  ),
];