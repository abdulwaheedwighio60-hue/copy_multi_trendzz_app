import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/statistics/statistics_card_widget.dart';
import 'package:multi_trendzz/core/widgets/statistics/statistics_model.dart';

class StatisticGridWidget extends StatelessWidget {

  final List<StatisticModel> statistics;

  const StatisticGridWidget({
    super.key,
    required this.statistics,
  });

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    int crossAxisCount;
    double childAspectRatio;

    if (width >= 1400) {
      crossAxisCount = 4;
      childAspectRatio = 2.5;
    } else if (width >= 1000) {
      crossAxisCount = 4;
      childAspectRatio = 2.2;
    } else if (width >= 700) {
      crossAxisCount = 2;
      childAspectRatio = 2.3;
    } else {
      crossAxisCount = 1;
      childAspectRatio = 2.8;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: statistics.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (_, index) {
        return StatisticCardWidget(
          data: statistics[index],
        );
      },
    );
  }
}