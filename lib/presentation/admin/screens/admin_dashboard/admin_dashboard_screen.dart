import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/presentation/admin/screens/admin_dashboard/widgets/admin_dashboard_header_widget.dart';
import 'package:multi_trendzz/presentation/admin/screens/admin_dashboard/widgets/admin_footer_widget.dart';
import 'package:multi_trendzz/presentation/admin/screens/admin_dashboard/widgets/admin_side_bar_widget.dart';
import 'package:multi_trendzz/presentation/admin/screens/admin_dashboard/widgets/dashboard_chart_widget.dart';
import 'package:multi_trendzz/presentation/admin/screens/admin_dashboard/widgets/popular_product_widget.dart';
import 'package:multi_trendzz/presentation/admin/screens/admin_dashboard/widgets/recent_order_widget.dart';

import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/dashboard_header_widget.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() =>
      _AdminDashboardScreenState();
}

class _AdminDashboardScreenState
    extends State<AdminDashboardScreen> {

  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final isMobile = width < 700;
    final isTablet = width >= 700 && width < 1100;
    final isDesktop = width >= 1100;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffF5F6FA),

      drawer: isMobile
          ? const Drawer(
        child: AdminSidebarWidget(),
      )
          : null,

      body: SafeArea(

        child: Row(

          children: [

            /// Desktop Sidebar
            if (isDesktop)

              AdminSidebarWidget(
                // selectedIndex: selectedIndex,
                // onItemSelected: (index) {
                //   setState(() {
                //     selectedIndex = index;
                //   });
                // },
              ),
            /// Main Content
            Expanded(
              child: Column(
                children: [

                  /// Fixed Header
                  AdminDashboardHeaderWidget(
                    onMenuTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),

                  /// Scrollable Content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 25.h),

                          // StatisticsGridWidget(),

                          SizedBox(height: 25.h),

                          if (isMobile) ...[
                            const RecentOrdersWidget(),
                            SizedBox(height: 25.h),

                          ],

                          if (isTablet) ...[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Expanded(
                                  child: RecentOrdersWidget(),
                                ),
                                SizedBox(width: 20.w),
                              ],
                            ),



                            SizedBox(height: 25.h),

                            const PopularProductsWidget(),
                          ],

                          if (isDesktop) ...[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Expanded(
                                  flex: 7,
                                  child: Column(
                                    children: [
                                      // RevenueChartWidget(),

                                      const RecentOrdersWidget(),
                                      SizedBox(height: 25.h),
                                      DashboardChartWidget(),
                                    ],
                                  ),
                                ),

                                SizedBox(width: 25.w),

                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    children: const [

                                      PopularProductsWidget(),


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
                  AdminFooterWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}