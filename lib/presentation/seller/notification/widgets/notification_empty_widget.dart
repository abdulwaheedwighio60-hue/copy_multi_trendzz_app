import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class NotificationEmptyWidget extends StatelessWidget {
  final VoidCallback? onRefresh;

  const NotificationEmptyWidget({
    super.key,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 40.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// Icon
            Container(
              width: 120.w,
              height: 120.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Iconsax.notification_bing,
                size: 60.sp,
                color: AppColors.primaryColor,
              ),
            ),

            SizedBox(height: 25.h),

            /// Title
            Text(
              "No Notifications Yet",
              textAlign: TextAlign.center,
              style: AppTextStyles.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10.h),

            /// Description
            Text(
              "You're all caught up.\nNew notifications will appear here when there is activity in your store.",
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),

            SizedBox(height: 30.h),

            /// Refresh Button
            SizedBox(
              width: 180.w,
              height: 48.h,
              child: ElevatedButton.icon(
                onPressed: onRefresh,
                icon: const Icon(Iconsax.refresh),
                label: const Text("Refresh"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}