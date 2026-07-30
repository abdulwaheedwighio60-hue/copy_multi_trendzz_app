import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'dashboard_card_widget.dart';

class StatisticsGridWidget extends StatelessWidget {
  const StatisticsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    int crossAxisCount = 2;

    if (width >= 1200) {
      crossAxisCount = 4;
    } else if (width >= 700) {
      crossAxisCount = 3;
    }

    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      crossAxisSpacing: 18.w,
      mainAxisSpacing: 18.h,

      childAspectRatio: width >= 1200
          ? 1.8
          : width >= 700
          ? 1.55
          : 1.15,

      children: [

        DashboardCardWidget(
          title: "Total Users",
          value: "12,540",
          icon: Iconsax.profile_2user,
          iconBackgroundColor: Colors.blue,
          onTap: () {},
        ),

        DashboardCardWidget(
          title: "Total Sellers",
          value: "1,245",
          icon: Iconsax.shop,
          iconBackgroundColor: Colors.orange,
          onTap: () {},
        ),

        DashboardCardWidget(
          title: "Products",
          value: "5,860",
          icon: Iconsax.box,
          iconBackgroundColor: Colors.green,
          onTap: () {},
        ),

        DashboardCardWidget(
          title: "Orders",
          value: "8,920",
          icon: Iconsax.shopping_cart,
          iconBackgroundColor: Colors.purple,
          onTap: () {},
        ),

        DashboardCardWidget(
          title: "Revenue",
          value: "\$25,600",
          icon: Iconsax.wallet_2,
          iconBackgroundColor: Colors.teal,
          onTap: () {},
        ),

        DashboardCardWidget(
          title: "Pending Orders",
          value: "184",
          icon: Iconsax.clock,
          iconBackgroundColor: Colors.red,
          onTap: () {},
        ),

      ],
    );
  }
}