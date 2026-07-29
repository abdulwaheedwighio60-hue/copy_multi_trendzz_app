import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

enum AppSnackBarType {
  success,
  error,
  warning,
  info,
}

enum AppSnackBarPosition {
  top,
  bottom,
}

class AppSnackBar {
  AppSnackBar._();

  static void show({
    required BuildContext context,
    required String message,
    String? title,
    AppSnackBarType type = AppSnackBarType.success,
    AppSnackBarPosition position = AppSnackBarPosition.bottom,
    Duration duration = const Duration(seconds: 3),
    String? actionText,
    VoidCallback? onActionTap,
  }) {
    final _SnackBarStyle style = _getStyle(type);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          duration: duration,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.fromLTRB(
            16.w,
            position == AppSnackBarPosition.top ? 18.h : 0,
            16.w,
            position == AppSnackBarPosition.bottom ? 18.h : 0,
          ),
          content: _AppSnackBarContent(
            title: title ?? style.title,
            message: message,
            icon: style.icon,
            iconColor: style.iconColor,
            softColor: style.softColor,
            borderColor: style.borderColor,
            accentColor: style.accentColor,
            actionText: actionText,
            onActionTap: onActionTap,
          ),
        ),
      );
  }

  static _SnackBarStyle _getStyle(AppSnackBarType type) {
    switch (type) {
      case AppSnackBarType.success:
        return _SnackBarStyle(
          title: 'Success',
          icon: Iconsax.tick_circle,
          iconColor: AppColors.success,
          accentColor: AppColors.success,
          softColor: AppColors.success.withOpacity(0.12),
          borderColor: AppColors.success.withOpacity(0.28),
        );

      case AppSnackBarType.error:
        return _SnackBarStyle(
          title: 'Error',
          icon: Iconsax.close_circle,
          iconColor: AppColors.error,
          accentColor: AppColors.error,
          softColor: AppColors.error.withOpacity(0.12),
          borderColor: AppColors.error.withOpacity(0.28),
        );

      case AppSnackBarType.warning:
        return _SnackBarStyle(
          title: 'Warning',
          icon: Iconsax.warning_2,
          iconColor: AppColors.warning,
          accentColor: AppColors.warning,
          softColor: AppColors.warning.withOpacity(0.14),
          borderColor: AppColors.warning.withOpacity(0.32),
        );

      case AppSnackBarType.info:
        return _SnackBarStyle(
          title: 'Information',
          icon: Iconsax.info_circle,
          iconColor: AppColors.info,
          accentColor: AppColors.info,
          softColor: AppColors.info.withOpacity(0.12),
          borderColor: AppColors.info.withOpacity(0.28),
        );
    }
  }
}

class _AppSnackBarContent extends StatelessWidget {
  const _AppSnackBarContent({
    required this.title,
    required this.message,
    required this.icon,
    required this.iconColor,
    required this.softColor,
    required this.borderColor,
    required this.accentColor,
    this.actionText,
    this.onActionTap,
  });

  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;
  final Color softColor;
  final Color borderColor;
  final Color accentColor;
  final String? actionText;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: 0.92,
        end: 1,
      ),
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          alignment: Alignment.bottomCenter,
          child: child,
        );
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: borderColor,
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.12),
              blurRadius: 24.r,
              spreadRadius: -4.r,
              offset: Offset(0, 12.h),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4.h,
              width: double.infinity,
              color: accentColor,
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(
                14.w,
                13.h,
                10.w,
                13.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      color: softColor,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: 24.sp,
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.textPrimary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          SizedBox(height: 4.h),

                          Text(
                            message,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 12.5.sp,
                              height: 1.38,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          if (actionText != null &&
                              actionText!.trim().isNotEmpty) ...[
                            SizedBox(height: 9.h),
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();

                                onActionTap?.call();
                              },
                              borderRadius: BorderRadius.circular(8.r),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2.w,
                                  vertical: 3.h,
                                ),
                                child: Text(
                                  actionText!,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: accentColor,
                                    fontSize: 12.5.sp,
                                    fontWeight: FontWeight.w800,
                                    decoration: TextDecoration.underline,
                                    decorationColor: accentColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 6.w),

                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    borderRadius: BorderRadius.circular(100.r),
                    child: Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        color: AppColors.lightColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        color: AppColors.textHint,
                        size: 17.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SnackBarStyle {
  const _SnackBarStyle({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.softColor,
    required this.borderColor,
    required this.accentColor,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final Color softColor;
  final Color borderColor;
  final Color accentColor;
}