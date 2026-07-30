import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';


class DashboardHeaderWidget extends StatelessWidget {

  final String adminName;
  final String adminImage;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  const DashboardHeaderWidget({
    super.key,
    required this.adminName,
    required this.adminImage,
    this.onNotificationTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onProfileTap,
            borderRadius: BorderRadius.circular(50.r),
            child:CircleAvatar(
              radius: 28.r,
              backgroundColor: AppColors.primaryColor.withOpacity(.10),
              backgroundImage: NetworkImage(adminImage),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back 👋",
                  style: AppTextStyles.bodyMedium,
                ),
                SizedBox(height: 3.h),
                Text(
                  adminName,
                  style: AppTextStyles.headlineMedium,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onNotificationTap,
            borderRadius: BorderRadius.circular(40.r),
            child: Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.10),
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Iconsax.notification,
                    color: AppColors.primaryColor,
                    size: 24.sp,
                  ),
                  Positioned(
                    right: 11,
                    top: 11,
                    child: Container(
                      height: 9,
                      width: 9,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}