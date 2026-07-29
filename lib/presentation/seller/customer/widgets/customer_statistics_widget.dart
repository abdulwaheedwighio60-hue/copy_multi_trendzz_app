import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class CustomerStatisticsWidget extends StatelessWidget {
  const CustomerStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Customer Statistics",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16.h),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 1.35,
            children: const [

              _StatisticsCard(
                title: "Total Orders",
                value: "48",
                icon: Iconsax.box,
                color: Colors.blue,
              ),

              _StatisticsCard(
                title: "Completed",
                value: "45",
                icon: Iconsax.tick_circle,
                color: Colors.green,
              ),

              _StatisticsCard(
                title: "Cancelled",
                value: "3",
                icon: Iconsax.close_circle,
                color: Colors.red,
              ),

              _StatisticsCard(
                title: "Total Spending",
                value: "\$4,850",
                icon: Iconsax.wallet_money,
                color: AppColors.primaryColor,
              ),

            ],
          ),

        ],
      ),
    );
  }
}

class _StatisticsCard extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatisticsCard({
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: color.withOpacity(.12),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24.sp,
            ),
          ),

          const Spacer(),

          Text(
            value,
            style: AppTextStyles.headlineMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 6.h),

          Text(
            title,
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey.shade600,
            ),
          ),

        ],
      ),
    );
  }
}