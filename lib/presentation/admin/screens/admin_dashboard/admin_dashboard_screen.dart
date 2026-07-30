import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/presentation/admin/widgets/admin_side_bar_widget.dart';
import 'package:multi_trendzz/presentation/admin/widgets/quick_action_widget.dart';
import 'package:multi_trendzz/presentation/admin/widgets/recent_order_widget.dart';
import 'package:multi_trendzz/presentation/admin/widgets/recent_users_widget.dart';
import 'package:multi_trendzz/presentation/admin/widgets/revenue_chart_widget.dart';
import 'package:multi_trendzz/presentation/admin/widgets/statistics_grid_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/dashboard_header_widget.dart';


class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isDesktop = width >= 1100;

    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      drawer: isMobile
          ? Drawer(
        child: AdminSidebarWidget(
          selectedIndex: 0,
          onItemSelected: (index) {},
        ),
      )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              /// Header

              const DashboardHeaderWidget(),

              SizedBox(height: 22.h),

              /// Statistics

              const StatisticsGridWidget(),

              SizedBox(height: 22.h),

              /// Mobile Layout

              if (isMobile) ...[

                const RevenueChartWidget(),

                SizedBox(height: 22.h),

                const RecentOrdersWidget(),

                SizedBox(height: 22.h),

                const RecentUsersWidget(),

                SizedBox(height: 22.h),

                const QuickActionsWidget(),

              ],

              /// Tablet Layout

              if (isTablet) ...[

                const RevenueChartWidget(),

                SizedBox(height: 22.h),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Expanded(
                      child: const RecentOrdersWidget(),
                    ),

                    SizedBox(width: 18.w),

                    Expanded(
                      child: const RecentUsersWidget(),
                    ),

                  ],
                ),

                SizedBox(height: 22.h),

                const QuickActionsWidget(),
              ],

              /// Desktop Layout

              if (isDesktop) ...[

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    /// LEFT SIDE

                    Expanded(
                      flex: 7,

                      child: Column(
                        children: [

                          const RevenueChartWidget(),

                          SizedBox(height: 22.h),

                          const RecentOrdersWidget(),

                        ],
                      ),
                    ),

                    SizedBox(width: 20.w),

                    /// RIGHT SIDE

                    Expanded(
                      flex: 4,

                      child: Column(
                        children: [

                          const RecentUsersWidget(),

                          SizedBox(height: 22.h),

                          const QuickActionsWidget(),

                        ],
                      ),
                    ),

                  ],
                ),

              ],

            ],
          ),
        ),
      ),
    );
  }
}