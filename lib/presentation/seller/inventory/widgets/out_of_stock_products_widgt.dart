import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class OutOfStockProductsWidget extends StatelessWidget {
  const OutOfStockProductsWidget({
    super.key,
  });

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

          /// Header
          Row(
            children: [

              Text(
                "Out of Stock",
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

          const _OutOfStockTile(
            productName: "Samsung Galaxy A55",
            category: "Mobiles",
            lastSold: "Yesterday",
            icon: Iconsax.mobile,
          ),

          SizedBox(height: 14.h),

          const _OutOfStockTile(
            productName: "Nike Air Jordan",
            category: "Shoes",
            lastSold: "2 days ago",
            icon: Iconsax.shopping_bag,
          ),

          SizedBox(height: 14.h),

          const _OutOfStockTile(
            productName: "Apple AirPods Pro",
            category: "Accessories",
            lastSold: "5 days ago",
            icon: Iconsax.headphone,
          ),
        ],
      ),
    );
  }
}

class _OutOfStockTile extends StatelessWidget {

  final String productName;
  final String category;
  final String lastSold;
  final IconData icon;

  const _OutOfStockTile({
    required this.productName,
    required this.category,
    required this.lastSold,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.red.shade100,
        ),
      ),
      child: Row(
        children: [

          /// Product Icon
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(.10),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(
              icon,
              color: Colors.red,
              size: 28.sp,
            ),
          ),

          SizedBox(width: 14.w),

          /// Product Info
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

                SizedBox(height: 5.h),

                Text(
                  category,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 10.h),

                Row(
                  children: [

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(.12),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        "Out of Stock",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp,
                        ),
                      ),
                    ),

                    SizedBox(width: 8.w),

                    Expanded(
                      child: Text(
                        "Last Sold: $lastSold",
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),

          SizedBox(width: 10.w),

          /// Restock Button
          SizedBox(
            height: 40.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
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