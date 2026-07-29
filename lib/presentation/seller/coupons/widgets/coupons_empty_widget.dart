import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class CouponEmptyWidget extends StatelessWidget {

  final VoidCallback? onCreateCoupon;
  final VoidCallback? onRefresh;

  const CouponEmptyWidget({
    super.key,
    this.onCreateCoupon,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 50.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// Icon
            Container(
              width: 150.w,
              height: 150.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.10),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Iconsax.ticket_discount,
                size: 75.sp,
                color: AppColors.primaryColor,
              ),
            ),

            SizedBox(height: 25.h),

            Text(
              "No Coupons Available",
              style: AppTextStyles.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10.h),

            Text(
              "You haven't created any discount coupons yet.\nCreate your first coupon and increase your sales.",
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),

            SizedBox(height: 30.h),

            /// Create Button
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton.icon(
                onPressed: onCreateCoupon,

                icon: const Icon(
                  Iconsax.add,
                ),

                label: const Text(
                  "Create Coupon",
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  AppColors.primaryColor,
                  foregroundColor:
                  Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(14.r),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.h),

            /// Refresh Button
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: OutlinedButton.icon(
                onPressed: onRefresh,

                icon: const Icon(
                  Iconsax.refresh,
                ),

                label: const Text(
                  "Refresh",
                ),

                style: OutlinedButton.styleFrom(
                  foregroundColor:
                  AppColors.primaryColor,

                  side: const BorderSide(
                    color:
                    AppColors.primaryColor,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(14.r),
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