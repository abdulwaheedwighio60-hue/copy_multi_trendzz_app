import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class ProductDescriptionWidget extends StatelessWidget {
  final TextEditingController descriptionController;
  final TextEditingController tagsController;

  const ProductDescriptionWidget({
    super.key,
    required this.descriptionController,
    required this.tagsController,
  });

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
                  Icons.description_outlined,
                  color: AppColors.primaryColor,
                ),
              ),

              SizedBox(width: 10.w),

              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Description',
                    style:
                    AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Describe your product clearly.',
                    style:
                    AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 18.h),

          TextFormField(
            controller: descriptionController,
            maxLines: 6,
            decoration: _decoration(
              label: 'Description',
              hint:
              'Enter detailed product description...',
            ),
          ),

          SizedBox(height: 12.h),

          TextFormField(
            controller: tagsController,
            decoration: _decoration(
              label: 'Tags',
              hint:
              'Example: camera, sony, 4k',
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _decoration({
    required String label,
    required String hint,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: const Color(0xffF8F9FB),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 14.h,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 1.3,
        ),
      ),
    );
  }
}