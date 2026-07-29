import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_trendzz/presentation/seller/customer/widgets/customer_info_widget.dart';
import 'package:multi_trendzz/presentation/seller/customer/widgets/customer_profile_header_widget.dart';
import 'package:multi_trendzz/presentation/seller/customer/widgets/customer_recent_order_widget.dart';
import 'package:multi_trendzz/presentation/seller/customer/widgets/customer_reviews_widget.dart';
import 'package:multi_trendzz/presentation/seller/customer/widgets/customer_statistics_widget.dart';

import '../../../core/constants/app_colors.dart';


class CustomerDetailScreen extends StatelessWidget {
  const CustomerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xffF7F8FA),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [

                CustomerProfileHeaderWidget(
                  onBack: () => context.pop(),
                  onMessage: () {},
                  onCall: () {},
                ),

                const SizedBox(height: 20),

                const CustomerInfoWidget(),

                const SizedBox(height: 20),

                const CustomerStatisticsWidget(),

                const SizedBox(height: 20),

                const CustomerRecentOrdersWidget(),

                const SizedBox(height: 20),

                const CustomerReviewsWidget(),

                const SizedBox(height: 30),

              ],
            ),
          ),
        ),
      ),
    );
  }
}