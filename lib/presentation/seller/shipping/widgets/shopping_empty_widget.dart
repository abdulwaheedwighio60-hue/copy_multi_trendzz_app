import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class ShippingEmptyWidget extends StatelessWidget {
  final VoidCallback? onRefresh;
  final VoidCallback? onCreateShipment;

  const ShippingEmptyWidget({
    super.key,
    this.onRefresh,
    this.onCreateShipment,
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

            /// Illustration
            Container(
              width: 140.w,
              height: 140.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.local_shipping_rounded,
                size: 70.sp,
                color: AppColors.primaryColor,
              ),
            ),

            SizedBox(height: 25.h),

            Text(
              "No Shipments Found",
              textAlign: TextAlign.center,
              style: AppTextStyles.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10.h),

            Text(
              "You haven't created any shipments yet.\nCreate your first shipment to start tracking deliveries.",
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),

            SizedBox(height: 30.h),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onCreateShipment,
                icon: const Icon(Iconsax.add),
                label: const Text("Create Shipment"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 52.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.h),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onRefresh,
                icon: const Icon(Iconsax.refresh),
                label: const Text("Refresh"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primaryColor,
                  minimumSize: Size(double.infinity, 52.h),
                  side: const BorderSide(
                    color: AppColors.primaryColor,
                  ),
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