import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/model/track_order_model.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class TrackingStepWidget extends StatelessWidget {
  const TrackingStepWidget({
    required this.status,
    required this.isFirst,
    required this.isLast,
  });

  final OrderStatusModel status;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final Color activeColor = status.isCompleted
        ? AppColors.primaryColor
        : AppColors.borderColor;

    final Color iconColor = status.isCompleted
        ? AppColors.primaryColor
        : AppColors.textHint;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 34.w,
            child: Column(
              children: [
                if (!isFirst)
                  Expanded(
                    child: Container(
                      width: 2.w,
                      color: status.isCompleted
                          ? AppColors.primaryColor
                          : AppColors.borderColor,
                    ),
                  )
                else
                  Expanded(
                    child: SizedBox(width: 2.w),
                  ),

                Container(
                  width: 22.w,
                  height: 22.w,
                  decoration: BoxDecoration(
                    color: status.isCompleted
                        ? AppColors.primaryColor
                        : AppColors.borderColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    status.isCompleted ? Icons.check : Icons.circle,
                    color: AppColors.white,
                    size: status.isCompleted ? 13.sp : 8.sp,
                  ),
                ),

                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2.w,
                      color: status.isCompleted
                          ? AppColors.primaryColor
                          : AppColors.borderColor,
                    ),
                  )
                else
                  Expanded(
                    child: SizedBox(width: 2.w),
                  ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: 2.h,
                bottom: isLast ? 0 : 30.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status.title,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: status.isCompleted
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
                      fontSize: 14.sp,
                      fontWeight: status.isCompleted
                          ? FontWeight.w800
                          : FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    status.dateTime,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 11.5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Icon(
              status.icon,
              color: iconColor,
              size: 22.sp,
            ),
          ),
        ],
      ),
    );
  }
}