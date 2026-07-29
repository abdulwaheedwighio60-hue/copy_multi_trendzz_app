import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class SellerTopSellingProductsWidget extends StatelessWidget {
  const SellerTopSellingProductsWidget({super.key});

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
                "Top Selling Products",
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

          SizedBox(height: 12.h),

          _productCard(
            rank: 1,
            productName: "iPhone 16 Pro",
            sold: 520,
            revenue: "\$62,400",
          ),

          SizedBox(height: 12.h),

          _productCard(
            rank: 2,
            productName: "Nike Air Max",
            sold: 410,
            revenue: "\$32,800",
          ),

          SizedBox(height: 12.h),

          _productCard(
            rank: 3,
            productName: "Apple Watch Series 10",
            sold: 315,
            revenue: "\$47,250",
          ),
        ],
      ),
    );
  }

  Widget _productCard({
    required int rank,
    required String productName,
    required int sold,
    required String revenue,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
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

          /// Product Image
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(14.r),
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

                SizedBox(height: 6.h),

                Row(
                  children: [

                    Icon(
                      Iconsax.shopping_bag,
                      size: 15.sp,
                      color: Colors.grey,
                    ),

                    SizedBox(width: 4.w),

                    Text(
                      "$sold Sold",
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontSize: 12.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),

                    SizedBox(width: 14.w),

                    Icon(
                      Iconsax.wallet_money,
                      size: 15.sp,
                      color: Colors.green,
                    ),

                    SizedBox(width: 4.w),

                    Text(
                      revenue,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 8.h,
            ),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(.12),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              children: [

                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 16.sp,
                ),

                SizedBox(width: 4.w),

                Text(
                  "#$rank",
                  style: TextStyle(
                    color: Colors.amber.shade800,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}