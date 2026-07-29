import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

enum NotificationType {
  order,
  payment,
  review,
  inventory,
  shipping,
  system,
}

class NotificationCardWidget extends StatelessWidget {
  final NotificationType type;
  final String title;
  final String description;
  final String time;
  final bool isRead;
  final VoidCallback? onTap;

  const NotificationCardWidget({
    super.key,
    required this.type,
    required this.title,
    required this.description,
    required this.time,
    this.isRead = false,
    this.onTap,
  });

  IconData get icon {
    switch (type) {
      case NotificationType.order:
        return Iconsax.shopping_cart;

      case NotificationType.payment:
        return Iconsax.wallet_money;

      case NotificationType.review:
        return Iconsax.star1;

      case NotificationType.inventory:
        return Iconsax.box;

      case NotificationType.shipping:
        return Iconsax.truck_fast;

      case NotificationType.system:
        return Iconsax.setting_2;
    }
  }

  Color get color {
    switch (type) {
      case NotificationType.order:
        return Colors.blue;

      case NotificationType.payment:
        return Colors.green;

      case NotificationType.review:
        return Colors.orange;

      case NotificationType.inventory:
        return Colors.red;

      case NotificationType.shipping:
        return Colors.purple;

      case NotificationType.system:
        return AppColors.primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18.r),
      child: Container(
        margin: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: 15.h,
        ),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          border: isRead
              ? null
              : Border.all(
            color: color.withOpacity(.35),
            width: 1.3,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Icon
            Container(
              width: 55.w,
              height: 55.w,
              decoration: BoxDecoration(
                color: color.withOpacity(.12),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(
                icon,
                color: color,
                size: 26.sp,
              ),
            ),

            SizedBox(width: 15.w),

            /// Text
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.titleMedium
                              .copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      if (!isRead)
                        Container(
                          width: 10.w,
                          height: 10.w,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                          ),
                        ),

                    ],
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    description,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  Row(
                    children: [

                      Icon(
                        Iconsax.clock,
                        size: 16.sp,
                        color: Colors.grey,
                      ),

                      SizedBox(width: 6.w),

                      Text(
                        time,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey,
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),

            SizedBox(width: 10.w),

            Icon(
              Icons.arrow_forward_ios,
              size: 18.sp,
              color: Colors.grey.shade400,
            ),

          ],
        ),
      ),
    );
  }
}