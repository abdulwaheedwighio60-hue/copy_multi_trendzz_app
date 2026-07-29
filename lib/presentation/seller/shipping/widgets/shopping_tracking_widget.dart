import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class ShippingTrackingWidget extends StatelessWidget {
  const ShippingTrackingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final trackingSteps = [
      {
        "title": "Order Confirmed",
        "time": "24 Jul 2026 • 09:30 AM",
        "completed": true,
        "icon": Iconsax.receipt_item,
      },
      {
        "title": "Package Packed",
        "time": "24 Jul 2026 • 02:15 PM",
        "completed": true,
        "icon": Iconsax.box,
      },
      {
        "title": "Shipped",
        "time": "25 Jul 2026 • 10:00 AM",
        "completed": true,
        "icon": Icons.local_shipping_rounded,
      },
      {
        "title": "Out for Delivery",
        "time": "26 Jul 2026 • 08:45 AM",
        "completed": false,
        "icon": Iconsax.truck_fast,
      },
      {
        "title": "Delivered",
        "time": "Pending",
        "completed": false,
        "icon": Iconsax.tick_circle,
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(18.w),
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

            Text(
              "Tracking Timeline",
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20.h),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: trackingSteps.length,
              itemBuilder: (context, index) {
                final item = trackingSteps[index];

                final completed =
                item["completed"] as bool;

                final isLast =
                    index == trackingSteps.length - 1;

                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Column(
                        children: [

                          Container(
                            width: 42.w,
                            height: 42.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: completed
                                  ? AppColors.primaryColor
                                  : Colors.grey.shade300,
                            ),
                            child: Icon(
                              item["icon"] as IconData,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),

                          if (!isLast)
                            Expanded(
                              child: Container(
                                width: 2,
                                margin: EdgeInsets.symmetric(
                                  vertical: 4.h,
                                ),
                                color: completed
                                    ? AppColors.primaryColor
                                    : Colors.grey.shade300,
                              ),
                            ),
                        ],
                      ),

                      SizedBox(width: 16.w),

                      Expanded(
                        child: Padding(
                          padding:
                          EdgeInsets.only(top: 6.h),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [

                              Text(
                                item["title"] as String,
                                style: AppTextStyles.bodyLarge.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: completed
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),

                              SizedBox(height: 4.h),

                              Text(
                                item["time"] as String,
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: Colors.grey.shade600,
                                ),
                              ),

                              SizedBox(height: 22.h),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}