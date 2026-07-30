import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';


class ProductDetailInfoWidget extends StatelessWidget {
  final String productName;
  final String category;
  final String brand;
  final String sku;
  final double rating;
  final int totalSold;
  final bool isActive;

  const ProductDetailInfoWidget({
    super.key,
    required this.productName,
    required this.category,
    required this.brand,
    required this.sku,
    required this.rating,
    required this.totalSold,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Product Name
          Text(
            productName,
            style: AppTextStyles.titleLarge.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 12.h),

          /// Rating + Sold
          Row(
            children: [

              Icon(
                Iconsax.star1,
                color: Colors.amber,
                size: 18.sp,
              ),

              SizedBox(width: 6.w),

              Text(
                rating.toString(),
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(width: 16.w),

              Icon(
                Iconsax.shopping_bag,
                color: Colors.green,
                size: 18.sp,
              ),

              SizedBox(width: 6.w),

              Text(
                "$totalSold Sold",
                style: AppTextStyles.bodyMedium,
              ),

              const Spacer(),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: isActive
                      ? Colors.green.withOpacity(.12)
                      : Colors.red.withOpacity(.12),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  isActive ? "Active" : "Inactive",
                  style: TextStyle(
                    color: isActive
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ),

            ],
          ),

          SizedBox(height: 22.h),

          Divider(),

          SizedBox(height: 12.h),

          _infoTile(
            icon: Iconsax.category,
            title: "Category",
            value: category,
          ),

          SizedBox(height: 16.h),

          _infoTile(
            icon: Iconsax.building,
            title: "Brand",
            value: brand,
          ),

          SizedBox(height: 16.h),

          _infoTile(
            icon: Iconsax.barcode,
            title: "SKU",
            value: sku,
          ),

        ],
      ),
    );
  }

  Widget _infoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [

        Container(
          width: 42.w,
          height: 42.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(.08),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
            size: 20.sp,
          ),
        ),

        SizedBox(width: 14.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 4.h),

              Text(
                value,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

            ],
          ),
        ),

      ],
    );
  }
}