import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class SellerDashboardSummaryWidget extends StatelessWidget {
  const SellerDashboardSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Overview",
            style: AppTextStyles.bodyLarge.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16.h),

          Row(
            children: [
              Expanded(
                child: _summaryCard(
                  icon: Iconsax.wallet_money,
                  title: "Total Sales",
                  value: "\$12,450",
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: _summaryCard(
                  icon: Iconsax.shopping_cart,
                  title: "Orders",
                  value: "125",
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          Row(
            children: [
              Expanded(
                child: _summaryCard(
                  icon: Iconsax.box,
                  title: "Products",
                  value: "45",
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: _summaryCard(
                  icon: Iconsax.people,
                  title: "Customers",
                  value: "280",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.lightColor,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46.w,
            height: 46.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              icon,
              color: AppColors.primaryColor,
              size: 24.sp,
            ),
          ),

          SizedBox(height: 18.h),

          Text(
            value,
            style: AppTextStyles.bodyLarge.copyWith(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 5.h),

          Text(
            title,
            style: AppTextStyles.bodyLarge.copyWith(
              fontSize: 13.sp,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}