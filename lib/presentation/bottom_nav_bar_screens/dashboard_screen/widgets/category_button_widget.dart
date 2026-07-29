import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class CategoryButtonWidget extends StatelessWidget {
  const CategoryButtonWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.size,
    this.iconSize,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.spacing,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  final double? size;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18.r),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 6.w,
          vertical: 6.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: size ?? 55.w,
              height: size ?? 55.w,
              decoration: BoxDecoration(
                color: backgroundColor ??
                    AppColors.greyColor.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: iconColor ?? AppColors.primaryColor,
                  size: iconSize ?? 22.sp,
                ),
              ),
            ),

            SizedBox(height: spacing ?? 8.h),

            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodyLarge.copyWith(
                color: textColor ?? AppColors.textPrimary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}