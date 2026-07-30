import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class SettingsSectionWidget extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SettingsSectionWidget({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20.w,
        20.h,
        20.w,
        10.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Container(
                width: 5.w,
                height: 24.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),

              SizedBox(width: 10.w),

              Text(
                title,
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),

          if (subtitle != null) ...[
            SizedBox(height: 6.h),

            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Text(
                subtitle!,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ],

        ],
      ),
    );
  }
}