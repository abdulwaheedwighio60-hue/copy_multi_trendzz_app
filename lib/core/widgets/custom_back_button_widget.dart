import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class CustomBackButtonWidget extends StatelessWidget {
  const CustomBackButtonWidget({
    super.key,
    this.onTap,
    this.size,
    this.iconSize,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    this.borderWidth, this.icon,
  });

  final VoidCallback? onTap;
  final double? size;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final double? borderWidth;
  final IconData? icon;


  @override
  Widget build(BuildContext context) {
    final bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return GestureDetector(
      onTap: onTap ??
              () {
            Navigator.pop(context);
          },
      child: Container(
        width: size ?? 40.w,
        height: size ?? 40.w,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor ??
                AppColors.greyColor.withValues(
                  alpha: 0.15,
                ),
            width: borderWidth ?? 1.w,
          ),
        ),
        child: Center(
          child: Icon(
            icon ?? (isIOS ? CupertinoIcons.back : Icons.arrow_back),
            color: iconColor ?? AppColors.darkColor,
            size: iconSize ?? 22.sp,
          ),
        ),
      ),
    );
  }
}