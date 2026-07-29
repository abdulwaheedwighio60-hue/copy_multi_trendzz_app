import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/presentation/seller/seller_dashboard/widgets/seller_dashboard_header_widget.dart';
import 'package:multi_trendzz/presentation/seller/seller_dashboard/widgets/seller_dashboard_summary_widget.dart';
import 'package:multi_trendzz/presentation/seller/seller_dashboard/widgets/seller_latest_reviews_widget.dart';
import 'package:multi_trendzz/presentation/seller/seller_dashboard/widgets/seller_low_stock_widget.dart';
import 'package:multi_trendzz/presentation/seller/seller_dashboard/widgets/seller_monthly_sales_analytics_widget.dart';
import 'package:multi_trendzz/presentation/seller/seller_dashboard/widgets/seller_performance_overview_widget.dart';
import 'package:multi_trendzz/presentation/seller/seller_dashboard/widgets/seller_quick_action_widget.dart';
import 'package:multi_trendzz/presentation/seller/seller_dashboard/widgets/seller_recent_order_widget.dart';
import 'package:multi_trendzz/presentation/seller/seller_dashboard/widgets/seller_recent_transactions_widget.dart';
import 'package:multi_trendzz/presentation/seller/seller_dashboard/widgets/seller_top_selling_product_widget.dart';

class SellerDashboardScreen extends StatefulWidget {
  const SellerDashboardScreen({super.key});

  @override
  State<SellerDashboardScreen> createState() => _SellerDashboardScreenState();
}

class _SellerDashboardScreenState extends State<SellerDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            SellerDashboardHeaderWidget(),

            Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 110.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      const SellerDashboardSummaryWidget(),
                      SizedBox(height: 20.h),
                      SellerQuickActionsWidget(),
                      SizedBox(height: 20.h),
                      SellerRecentOrdersWidget(),
                      SizedBox(height: 20.h),
                      SellerLowStockWidget(),
                      SizedBox(height: 20.h),
                      SellerTopSellingProductsWidget(),
                      SizedBox(height: 20.h),
                      SellerMonthlySalesAnalyticsWidget(),
                      SizedBox(height: 20.h),
                      SellerLatestReviewsWidget(),
                      SizedBox(height: 20.h),
                      SellerRecentTransactionsWidget(),
                      SizedBox(height: 20.h),
                      SellerPerformanceOverviewWidget(),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
