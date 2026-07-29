import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class ShippingTimelineWidget extends StatelessWidget {
  const ShippingTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.w),
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

          /// Heading
          Row(
            children: [

              Icon(
                Iconsax.truck_fast,
                color: AppColors.primaryColor,
              ),

              SizedBox(width: 10.w),

              Text(
                "Shipping Timeline",
                style: AppTextStyles.titleMedium,
              ),
            ],
          ),

          SizedBox(height: 24.h),

          _timelineTile(
            title: "Order Placed",
            subtitle: "29 Jul 2026 • 09:15 AM",
            icon: Iconsax.receipt_item,
            isCompleted: true,
            isLast: false,
          ),

          _timelineTile(
            title: "Order Confirmed",
            subtitle: "29 Jul 2026 • 09:45 AM",
            icon: Iconsax.tick_circle,
            isCompleted: true,
            isLast: false,
          ),

          _timelineTile(
            title: "Packed",
            subtitle: "29 Jul 2026 • 12:10 PM",
            icon: Iconsax.box,
            isCompleted: true,
            isLast: false,
          ),

          _timelineTile(
            title: "Shipped",
            subtitle: "30 Jul 2026 • 08:30 AM",
            icon: Iconsax.truck_fast,
            isCompleted: false,
            isCurrent: true,
            isLast: false,
          ),

          _timelineTile(
            title: "Out For Delivery",
            subtitle: "Waiting...",
            icon: Iconsax.location,
            isCompleted: false,
            isLast: false,
          ),

          _timelineTile(
            title: "Delivered",
            subtitle: "Pending",
            icon: Iconsax.verify,
            isCompleted: false,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _timelineTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isCompleted,
    bool isCurrent = false,
    required bool isLast,
  }) {

    Color color;

    if (isCompleted) {
      color = Colors.green;
    } else if (isCurrent) {
      color = Colors.orange;
    } else {
      color = Colors.grey;
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Column(
            children: [

              Container(
                width: 42.w,
                height: 42.w,
                decoration: BoxDecoration(
                  color: color.withOpacity(.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 20.sp,
                ),
              ),

              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2.w,
                    margin: EdgeInsets.symmetric(vertical: 4.h),
                    color: isCompleted
                        ? Colors.green
                        : Colors.grey.shade300,
                  ),
                ),
            ],
          ),

          SizedBox(width: 14.w),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),

                  SizedBox(height: 5.h),

                  Text(
                    subtitle,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}