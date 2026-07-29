import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class SellerLowStockWidget extends StatelessWidget {
  const SellerLowStockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [

          /// Heading
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Low Stock Alert",
                style: AppTextStyles.bodyLarge.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          _productCard(
            productName: "Nike Air Max",
            sku: "NK-1001",
            stock: 5,
            isCritical: false,
          ),

          SizedBox(height: 12.h),

          _productCard(
            productName: "Apple Watch Series 10",
            sku: "AW-2034",
            stock: 2,
            isCritical: true,
          ),

          SizedBox(height: 12.h),

          _productCard(
            productName: "Wireless Headphones",
            sku: "WH-3452",
            stock: 8,
            isCritical: false,
          ),
        ],
      ),
    );
  }

  Widget _productCard({
    required String productName,
    required String sku,
    required int stock,
    required bool isCritical,
  }) {
    final Color statusColor =
    isCritical ? Colors.red : Colors.orange;

    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [

          Container(
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Iconsax.box,
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
                    fontSize: 15.sp,
                  ),
                ),

                SizedBox(height: 5.h),

                Text(
                  "SKU : $sku",
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: Colors.grey.shade600,
                    fontSize: 12.sp,
                  ),
                ),

                SizedBox(height: 6.h),

                Text(
                  "Remaining Stock : $stock",
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(.12),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Text(
              isCritical ? "Critical" : "Low",
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}