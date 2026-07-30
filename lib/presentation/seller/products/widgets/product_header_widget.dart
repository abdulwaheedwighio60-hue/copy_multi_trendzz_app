import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class ProductHeaderWidget extends StatelessWidget {
  final int totalProducts;
  final VoidCallback? onAddProduct;
  final VoidCallback? onSearch;
  final VoidCallback? onFilter;

  const ProductHeaderWidget({
    super.key,
    required this.totalProducts,
    this.onAddProduct,
    this.onSearch,
    this.onFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 55.h,
        left: 20.w,
        right: 20.w,
        bottom: 22.h,
      ),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Top Row
          Row(
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Products",
                      style: AppTextStyles.titleLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5.h),

                    Text(
                      "$totalProducts Products Available",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: Colors.white70,
                      ),
                    ),

                  ],
                ),
              ),

              _iconButton(
                icon: Iconsax.search_normal,
                onTap: onSearch,
              ),

              SizedBox(width: 10.w),

              _iconButton(
                icon: Iconsax.setting_4,
                onTap: onFilter,
              ),

            ],
          ),

          SizedBox(height: 22.h),

          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton.icon(
              onPressed: onAddProduct,
              icon: const Icon(Iconsax.add),
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
    );
  }

  Widget _iconButton({
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 46.w,
        height: 46.w,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.18),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 22.sp,
        ),
      ),
    );
  }
}