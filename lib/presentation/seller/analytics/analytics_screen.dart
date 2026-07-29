
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/presentation/seller/analytics/widgets/analytics_header_widget.dart';
import 'package:multi_trendzz/presentation/seller/analytics/widgets/date_filter_widget.dart';
import 'package:multi_trendzz/presentation/seller/analytics/widgets/order_analytics_widget.dart';
import 'package:multi_trendzz/presentation/seller/analytics/widgets/payment_analytics_widget.dart';
import 'package:multi_trendzz/presentation/seller/analytics/widgets/recent_earning_widget.dart';
import 'package:multi_trendzz/presentation/seller/analytics/widgets/revenue_summary_widget.dart';
import 'package:multi_trendzz/presentation/seller/analytics/widgets/sales_overview_chart_widget.dart';
import 'package:multi_trendzz/presentation/seller/analytics/widgets/top_categories_widget.dart';
import 'package:multi_trendzz/presentation/seller/analytics/widgets/top_selling_product_widget.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnalyticsHeaderWidget(),


          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:20.h),
                    /// Date Filter
                    DateFilterWidget(
                      onChanged: (value){
                        debugPrint(
                          "Selected Filter: $value",
                        );
                      },
                    ),
                    SizedBox(height:20.h),
                    /// Revenue Cards
                    const RevenueSummaryWidget(),
                    SizedBox(height:20.h),
                    ///  Chart
                    const SalesOverviewChartWidget(),

                    SizedBox(height:20.h),
                    /// Orders Chart
                    const OrdersAnalyticsWidget(),
                    SizedBox(height:20.h),
                    /// Categories
                    const TopCategoriesWidget(),
                    SizedBox(height:20.h),
                    /// Top Products
                    const TopSellingProductsWidget(),
                    SizedBox(height:20.h),
                    /// Payment Analytics
                    const PaymentAnalyticsWidget(),
                    SizedBox(height:20.h),
                    /// Recent Earnings
                    const RecentEarningsWidget(),
                    SizedBox(height:30.h),

                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:multi_trendzz/presentation/seller/analytics/widgets/order_analytics_widget.dart';
// import 'package:multi_trendzz/presentation/seller/analytics/widgets/recent_earning_widget.dart';
// import 'package:multi_trendzz/presentation/seller/analytics/widgets/top_selling_product_widget.dart';
//
// import 'widgets/analytics_header_widget.dart';
// import 'widgets/date_filter_widget.dart';
// import 'widgets/revenue_summary_widget.dart';
// import 'widgets/sales_overview_chart_widget.dart';
// import 'widgets/top_categories_widget.dart';
// import 'widgets/payment_analytics_widget.dart';
//
//
//
// class AnalyticsScreen extends StatefulWidget {
//   const AnalyticsScreen({
//     super.key,
//   });
//
//
//   @override
//   State<AnalyticsScreen> createState() =>
//       _AnalyticsScreenState();
// }
//
//
//
// class _AnalyticsScreenState
//     extends State<AnalyticsScreen> {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//
//       backgroundColor:
//       const Color(0xffF7F8FA),
//
//
//       body: SafeArea(
//
//         child: SingleChildScrollView(
//
//           physics:
//           const BouncingScrollPhysics(),
//
//
//           child: Column(
//
//             crossAxisAlignment:
//             CrossAxisAlignment.start,
//
//
//             children: [
//
//
//               /// Header
//               const AnalyticsHeaderWidget(),
//
//
//
//               SizedBox(height:20.h),
//
//
//
//               /// Date Filter
//               DateFilterWidget(
//
//                 onChanged: (value){
//
//                   debugPrint(
//                     "Selected Filter: $value",
//                   );
//
//                 },
//
//               ),
//
//
//
//               SizedBox(height:20.h),
//
//
//
//               /// Revenue Cards
//               const RevenueSummaryWidget(),
//
//
//
//               SizedBox(height:20.h),
//
//
//
//               /// Sales Chart
//               const SalesOverviewChartWidget(),
//
//
//
//               SizedBox(height:20.h),
//
//
//
//               /// Orders Chart
//               const OrdersAnalyticsWidget(),
//
//
//
//               SizedBox(height:20.h),
//
//
//
//               /// Categories
//               const TopCategoriesWidget(),
//
//
//
//               SizedBox(height:20.h),
//
//
//
//               /// Top Products
//               const TopSellingProductsWidget(),
//
//
//
//               SizedBox(height:20.h),
//
//
//
//               /// Payment Analytics
//               const PaymentAnalyticsWidget(),
//
//
//
//               SizedBox(height:20.h),
//
//
//
//               /// Recent Earnings
//               const RecentEarningsWidget(),
//
//
//
//               SizedBox(height:30.h),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }