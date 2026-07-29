import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class InventoryHeaderWidget extends StatelessWidget {
  final VoidCallback? onFilterTap;
  final VoidCallback? onAddProductTap;
  final ValueChanged<String>? onSearch;

  const InventoryHeaderWidget({
    super.key,
    this.onFilterTap,
    this.onAddProductTap,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20.w,
        18.h,
        20.w,
        20.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28.r),
          bottomRight: Radius.circular(28.r),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.15),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Icon(
                    Iconsax.box,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),

                SizedBox(width: 14.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Inventory",
                        style: AppTextStyles.headlineLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        "Manage your product inventory",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 24.h),

            /// Search + Filter
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: TextField(
                      onChanged: onSearch,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search products...",
                        hintStyle: AppTextStyles.bodyMedium.copyWith(
                          color: Colors.grey,
                        ),
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: AppColors.primaryColor,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.h,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                InkWell(
                  onTap: onFilterTap,
                  borderRadius: BorderRadius.circular(14.r),
                  child: Container(
                    width: 52.w,
                    height: 52.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.15),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Icon(
                      Iconsax.setting_4,
                      color: Colors.white,
                      size: 22.sp,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 18.h),

            /// Add Product Button
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton.icon(
                onPressed: onAddProductTap,
                icon: const Icon(Iconsax.add_circle),
                label: const Text("Add New Product"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primaryColor,
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