import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class InventoryAnalyticsWidget extends StatelessWidget {
  const InventoryAnalyticsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [

          /// Header

          Row(
            children: [

              Text(
                "Inventory Analytics",
                style: AppTextStyles.titleMedium,
              ),

              const Spacer(),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(.10),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  "This Month",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),

            ],
          ),

          SizedBox(height: 20.h),

          Row(
            children: [

              Expanded(
                child: _AnalyticsCard(
                  title: "Inventory Value",
                  value: "\$124,580",
                  icon: Iconsax.money_3,
                  color: Colors.green,
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: _AnalyticsCard(
                  title: "Stock In",
                  value: "1,245",
                  icon: Iconsax.arrow_up_1,
                  color: Colors.blue,
                ),
              ),

            ],
          ),

          SizedBox(height: 12.h),

          Row(
            children: [

              Expanded(
                child: _AnalyticsCard(
                  title: "Stock Out",
                  value: "986",
                  icon: Iconsax.arrow_down,
                  color: Colors.red,
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: _AnalyticsCard(
                  title: "Products Sold",
                  value: "742",
                  icon: Iconsax.shopping_cart,
                  color: Colors.orange,
                ),
              ),

            ],
          ),

          SizedBox(height: 25.h),

          /// Monthly Overview

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Monthly Overview",
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 16.h),

          _ProgressItem(
            title: "Stock Filled",
            percentage: 0.82,
            color: Colors.green,
          ),

          SizedBox(height: 14.h),

          _ProgressItem(
            title: "Products Sold",
            percentage: 0.64,
            color: Colors.blue,
          ),

          SizedBox(height: 14.h),

          _ProgressItem(
            title: "Remaining Inventory",
            percentage: 0.36,
            color: Colors.orange,
          ),

          SizedBox(height: 25.h),

          /// Performance

          Row(
            children: [

              Expanded(
                child: _InfoCard(
                  title: "Fast Moving",
                  value: "Nike Air Max",
                  icon: Iconsax.flash_1,
                  color: Colors.green,
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: _InfoCard(
                  title: "Slow Moving",
                  value: "Sony Camera",
                  icon: Iconsax.clock,
                  color: Colors.orange,
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

class _AnalyticsCard extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _AnalyticsCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: EdgeInsets.all(16.w),

      decoration: BoxDecoration(

        color: color.withOpacity(.08),

        borderRadius: BorderRadius.circular(16.r),

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Icon(
            icon,
            color: color,
          ),

          SizedBox(height: 14.h),

          Text(
            value,
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 6.h),

          Text(
            title,
            style: AppTextStyles.bodySmall,
          ),

        ],
      ),
    );
  }
}

class _ProgressItem extends StatelessWidget {

  final String title;
  final double percentage;
  final Color color;

  const _ProgressItem({
    required this.title,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Row(
          children: [

            Text(
              title,
              style: AppTextStyles.bodyMedium,
            ),

            const Spacer(),

            Text(
              "${(percentage * 100).toInt()}%",
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),

        SizedBox(height: 8.h),

        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: LinearProgressIndicator(
            value: percentage,
            minHeight: 8.h,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),

      ],
    );
  }
}

class _InfoCard extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _InfoCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: EdgeInsets.all(16.w),

      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16.r),
      ),

      child: Column(

        children: [

          Icon(
            icon,
            color: color,
            size: 28.sp,
          ),

          SizedBox(height: 10.h),

          Text(
            title,
            style: AppTextStyles.bodySmall,
          ),

          SizedBox(height: 6.h),

          Text(
            value,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }
}