import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class CustomerSummaryCardsWidget extends StatelessWidget {
  const CustomerSummaryCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1.20,
        children: const [

          _CustomerSummaryCard(
            title: "Total Customers",
            value: "1,245",
            icon: Iconsax.people,
            color: Colors.blue,
          ),

          _CustomerSummaryCard(
            title: "Active Customers",
            value: "986",
            icon: Iconsax.user_tick,
            color: Colors.green,
          ),

          _CustomerSummaryCard(
            title: "Premium Members",
            value: "142",
            icon: Iconsax.crown,
            color: Colors.orange,
          ),

          _CustomerSummaryCard(
            title: "New Customers",
            value: "37",
            icon: Iconsax.user_add,
            color: AppColors.primaryColor,
          ),

        ],
      ),
    );
  }
}

class _CustomerSummaryCard extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _CustomerSummaryCard({
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
              color: color.withOpacity(.12),
              borderRadius: BorderRadius.circular(12.r),
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

          SizedBox(height: 4.h),

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