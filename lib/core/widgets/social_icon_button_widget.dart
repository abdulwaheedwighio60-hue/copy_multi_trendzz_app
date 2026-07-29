import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class SocialIconButtonWidget extends StatelessWidget {
  const SocialIconButtonWidget({
    super.key,
    required this.imagePath,
    this.onTap,
    this.size,
    this.iconSize,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
  });

  final String imagePath;
  final VoidCallback? onTap;

  final double? size;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    final double buttonSize = size ?? 60.w;

    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Ink(
          width: buttonSize,
          height: buttonSize,
          padding: padding ?? EdgeInsets.all(14.sp),
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.background,
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor ?? AppColors.greyColor.withValues(alpha: 0.40),
              width: borderWidth ?? 1.w,
            ),
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              width: iconSize ?? 28.w,
              height: iconSize ?? 28.w,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}