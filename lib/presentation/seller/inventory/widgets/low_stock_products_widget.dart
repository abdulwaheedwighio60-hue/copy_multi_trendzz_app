import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class LowStockProductsWidget extends StatelessWidget {
  const LowStockProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [

          Row(
            children: [

              Text(
                "Low Stock Products",
                style: AppTextStyles.titleMedium,
              ),

              const Spacer(),

              TextButton(
                onPressed: () {},
                child: const Text("View All"),
              ),

            ],
          ),

          SizedBox(height: 18.h),

          const _LowStockTile(
            productName: "Nike Air Max 270",
            category: "Shoes",
            stock: 5,
            image: Iconsax.shopping_bag,
          ),

          SizedBox(height: 14.h),

          const _LowStockTile(
            productName: "iPhone 15 Pro",
            category: "Mobiles",
            stock: 3,
            image: Iconsax.mobile,
          ),

          SizedBox(height: 14.h),

          const _LowStockTile(
            productName: "Sony Headphones",
            category: "Electronics",
            stock: 7,
            image: Iconsax.headphone,
          ),

        ],
      ),
    );
  }
}

class _LowStockTile extends StatelessWidget {

  final String productName;
  final String category;
  final int stock;
  final IconData image;

  const _LowStockTile({
    required this.productName,
    required this.category,
    required this.stock,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [

          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.10),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(
              image,
              color: AppColors.primaryColor,
              size: 28.sp,
            ),
          ),

          SizedBox(width: 14.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  productName,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  category,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 10.h),

                Row(
                  children: [

                    Icon(
                      Iconsax.warning_2,
                      color: Colors.orange,
                      size: 16.sp,
                    ),

                    SizedBox(width: 5.w),

                    Text(
                      "$stock items left",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),

          SizedBox(width: 10.w),

          SizedBox(
            height: 40.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: const Text("Restock"),
            ),
          ),

        ],
      ),
    );
  }
}