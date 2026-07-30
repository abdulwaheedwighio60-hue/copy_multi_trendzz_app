import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';



class ProductDetailDescriptionWidget extends StatelessWidget {
  final String description;
  final List<String> tags;

  const ProductDetailDescriptionWidget({
    super.key,
    required this.description,
    required this.tags,
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

          /// Header
          Row(
            children: [

              Icon(
                Iconsax.document_text,
                color: AppColors.primaryColor,
                size: 22.sp,
              ),

              SizedBox(width: 10.w),

              Text(
                "Description",
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),

          SizedBox(height: 18.h),

          /// Description
          Text(
            description,
            style: AppTextStyles.bodyMedium.copyWith(
              height: 1.6,
              color: Colors.grey.shade700,
            ),
          ),

          SizedBox(height: 25.h),

          Divider(),

          SizedBox(height: 20.h),

          /// Tags Header
          Row(
            children: [

              Icon(
                Iconsax.tag,
                color: Colors.orange,
                size: 22.sp,
              ),

              SizedBox(width: 10.w),

              Text(
                "Product Tags",
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),

          SizedBox(height: 18.h),

          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: tags.map((tag) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(.08),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
              );
            }).toList(),
          ),

        ],
      ),
    );
  }
}