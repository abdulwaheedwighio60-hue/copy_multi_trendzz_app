import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class NotificationHeaderWidget extends StatelessWidget {
  final int unreadCount;
  final VoidCallback? onSearchTap;
  final VoidCallback? onMarkAllRead;

  const NotificationHeaderWidget({
    super.key,
    this.unreadCount = 12,
    this.onSearchTap,
    this.onMarkAllRead,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 18.h,
        left: 20.w,
        right: 20.w,
        bottom: 25.h,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            Color(0xff4A6CF7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Top Row
            Row(
              children: [

                InkWell(
                  onTap: () => context.pop(),
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    width: 45.w,
                    height: 45.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.15),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(width: 15.w),

                Expanded(
                  child: Text(
                    "Notifications",
                    style: AppTextStyles.titleLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                InkWell(
                  onTap: onSearchTap,
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    width: 45.w,
                    height: 45.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.15),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: const Icon(
                      Iconsax.search_normal,
                      color: Colors.white,
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(height: 24.h),

            Text(
              "Stay updated with your store activities",
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.white.withOpacity(.90),
              ),
            ),

            SizedBox(height: 20.h),

            Container(
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.12),
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Row(
                children: [

                  Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.20),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.notifications_active_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),

                  SizedBox(width: 18.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "$unreadCount Unread Notifications",
                          style: AppTextStyles.titleMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5.h),

                        Text(
                          "Check the latest updates from your store.",
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.white70,
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(height: 18.h),

            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton.icon(
                onPressed: onMarkAllRead,
                icon: const Icon(Iconsax.tick_circle),
                label: const Text("Mark All as Read"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}