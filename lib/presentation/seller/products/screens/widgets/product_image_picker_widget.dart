import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class ProductImagePickerWidget extends StatelessWidget {
  const ProductImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Container(
                width: 38.w,
                height: 38.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor
                      .withOpacity(.10),
                  borderRadius:
                  BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.photo_library_outlined,
                  color: AppColors.primaryColor,
                ),
              ),

              SizedBox(width: 10.w),

              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Media',
                    style:
                    AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Upload product images & videos.',
                    style:
                    AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 16.h),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 25.h,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffF8F9FB),
              borderRadius:
              BorderRadius.circular(14.r),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 55.w,
                  height: 55.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor
                        .withOpacity(.10),
                  ),
                  child: Icon(
                    Icons.add_photo_alternate_outlined,
                    color: AppColors.primaryColor,
                    size: 28.sp,
                  ),
                ),

                SizedBox(height: 10.h),

                Text(
                  'Add Product Images',
                  style:
                  AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  'Clear and high-quality images are recommended.',
                  textAlign: TextAlign.center,
                  style:
                  AppTextStyles.bodySmall.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),

                SizedBox(height: 14.h),

                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Image Picker
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Images'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.h),

          Text(
            'Supported formats: JPG, PNG, WEBP',
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}