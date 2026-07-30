import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class ProductSummaryWidget extends StatelessWidget {
  const ProductSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [

          Row(
            children: const [

              Expanded(
                child: _SummaryCard(
                  title: "Products",
                  value: "248",
                  icon: Iconsax.box,
                  color: Colors.blue,
                ),
              ),

              SizedBox(width: 12),

              Expanded(
                child: _SummaryCard(
                  title: "Active",
                  value: "221",
                  icon: Iconsax.tick_circle,
                  color: Colors.green,
                ),
              ),

            ],
          ),

          SizedBox(height: 12.h),

          Row(
            children: const [

              Expanded(
                child: _SummaryCard(
                  title: "Low Stock",
                  value: "18",
                  icon: Iconsax.warning_2,
                  color: Colors.orange,
                ),
              ),

              SizedBox(width: 12),

              Expanded(
                child: _SummaryCard(
                  title: "Out of Stock",
                  value: "09",
                  icon: Iconsax.close_circle,
                  color: Colors.red,
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryCard({
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

          SizedBox(height: 16.h),

          Text(
            value,
            style: AppTextStyles.titleLarge.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 5.h),

          Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.grey.shade600,
            ),
          ),

        ],
      ),
    );
  }
}