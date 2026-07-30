import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class ProductEmptyWidget extends StatelessWidget {
  final VoidCallback? onAddProduct;

  const ProductEmptyWidget({
    super.key,
    this.onAddProduct,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// Icon
            Container(
              width: 130.w,
              height: 130.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Iconsax.box,
                size: 65.sp,
                color: AppColors.primaryColor,
              ),
            ),

            SizedBox(height: 25.h),

            /// Title
            Text(
              "No Products Found",
              textAlign: TextAlign.center,
              style: AppTextStyles.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10.h),

            /// Description
            Text(
              "You haven't added any products yet.\nStart growing your store by adding your first product.",
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),

            SizedBox(height: 30.h),

            /// Button
            SizedBox(
              width: 220.w,
              height: 52.h,
              child: ElevatedButton.icon(
                onPressed: onAddProduct,
                icon: const Icon(Iconsax.add),
                label: const Text("Add Product"),
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