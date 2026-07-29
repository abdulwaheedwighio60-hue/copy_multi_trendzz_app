import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/app_snack_bar.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() =>
      _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<NotificationGroupModel> notificationGroups = [
    NotificationGroupModel(
      title: 'TODAY',
      notifications: [
        NotificationModel(
          title: 'Order Shipped',
          description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          time: '1h',
          icon: Iconsax.truck_fast,
          type: NotificationType.order,
          isRead: false,
        ),
        NotificationModel(
          title: 'Flash Sale Alert',
          description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          time: '1h',
          icon: Iconsax.discount_shape,
          type: NotificationType.offer,
          isRead: false,
        ),
        NotificationModel(
          title: 'Product Review Request',
          description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis',
          time: '1h',
          icon: Iconsax.star,
          type: NotificationType.review,
          isRead: true,
        ),
      ],
    ),
    NotificationGroupModel(
      title: 'YESTERDAY',
      notifications: [
        NotificationModel(
          title: 'Order Shipped',
          description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          time: '1d',
          icon: Iconsax.truck_fast,
          type: NotificationType.order,
          isRead: true,
        ),
        NotificationModel(
          title: 'New Paypal Added',
          description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          time: '1d',
          icon: Iconsax.wallet_3,
          type: NotificationType.payment,
          isRead: true,
        ),
        NotificationModel(
          title: 'Flash Sale Alert',
          description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          time: '1d',
          icon: Iconsax.discount_shape,
          type: NotificationType.offer,
          isRead: true,
        ),
      ],
    ),
  ];

  int get unreadCount {
    int count = 0;

    for (final NotificationGroupModel group in notificationGroups) {
      for (final NotificationModel notification in group.notifications) {
        if (!notification.isRead) {
          count++;
        }
      }
    }

    return count;
  }

  void markGroupAsRead(int groupIndex) {
    setState(() {
      for (final NotificationModel notification
      in notificationGroups[groupIndex].notifications) {
        notification.isRead = true;
      }
    });

    AppSnackBar.show(
      context: context,
      type: AppSnackBarType.success,
      title: 'Marked as Read',
      message: '${notificationGroups[groupIndex].title} notifications marked as read.',
      duration: const Duration(seconds: 2),
    );
  }

  void markAllAsRead() {
    setState(() {
      for (final NotificationGroupModel group in notificationGroups) {
        for (final NotificationModel notification in group.notifications) {
          notification.isRead = true;
        }
      }
    });

    AppSnackBar.show(
      context: context,
      type: AppSnackBarType.success,
      title: 'All Read',
      message: 'All notifications have been marked as read.',
      duration: const Duration(seconds: 2),
    );
  }

  void openNotification(NotificationModel notification) {
    setState(() {
      notification.isRead = true;
    });

    AppSnackBar.show(
      context: context,
      type: AppSnackBarType.info,
      title: notification.title,
      message: 'Notification opened successfully.',
      duration: const Duration(seconds: 2),
    );

    // TODO:
    // Order notification ho to order detail / track order screen open kar sakte ho.
    // Offer notification ho to product listing / coupon screen open kar sakte ho.
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leadingWidth: 65.w,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              top: 6.h,
              bottom: 6.h,
            ),
            child: CustomBackButtonWidget(
              onTap: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go(AppRoutes.userProfileScreen);
                }
              },
            ),
          ),
          title: Text(
            'Notification',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontSize: 17.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Center(
                child: _buildUnreadBadge(),
              ),
            ),
          ],
        ),
        body: SafeArea(
          top: false,
          child: notificationGroups.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              20.w,
              14.h,
              20.w,
              24.h,
            ),
            itemCount: notificationGroups.length,
            itemBuilder: (context, groupIndex) {
              final NotificationGroupModel group =
              notificationGroups[groupIndex];

              return _buildNotificationGroup(
                group: group,
                groupIndex: groupIndex,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildUnreadBadge() {
    if (unreadCount <= 0) {
      return InkWell(
        onTap: markAllAsRead,
        borderRadius: BorderRadius.circular(100.r),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.success.withOpacity(0.12),
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Text(
            'ALL READ',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.success,
              fontSize: 11.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      );
    }

    return InkWell(
      onTap: markAllAsRead,
      borderRadius: BorderRadius.circular(100.r),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 13.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Text(
          '$unreadCount NEW',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.white,
            fontSize: 11.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationGroup({
    required NotificationGroupModel group,
    required int groupIndex,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 22.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGroupHeader(
            title: group.title,
            onMarkRead: () {
              markGroupAsRead(groupIndex);
            },
          ),

          SizedBox(height: 12.h),

          ListView.separated(
            itemCount: group.notifications.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(height: 0.h);
            },
            itemBuilder: (context, index) {
              final NotificationModel notification =
              group.notifications[index];

              return NotificationTileWidget(
                notification: notification,
                onTap: () => openNotification(notification),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGroupHeader({
    required String title,
    required VoidCallback onMarkRead,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              fontSize: 13.sp,
              letterSpacing: 1.6,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),

        InkWell(
          onTap: onMarkRead,
          borderRadius: BorderRadius.circular(8.r),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 4.h,
            ),
            child: Text(
              'Mark all as read',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primaryColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 86.w,
              height: 86.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.10),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Iconsax.notification_bing,
                color: AppColors.primaryColor,
                size: 38.sp,
              ),
            ),

            SizedBox(height: 18.h),

            Text(
              'No Notifications',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textPrimary,
                fontSize: 17.sp,
                fontWeight: FontWeight.w800,
              ),
            ),

            SizedBox(height: 8.h),

            Text(
              'You do not have any notifications at the moment.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontSize: 13.sp,
                height: 1.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTileWidget extends StatelessWidget {
  const NotificationTileWidget({
    super.key,
    required this.notification,
    required this.onTap,
  });

  final NotificationModel notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color iconColor = _getIconColor(notification.type);
    final Color iconBackground = iconColor.withOpacity(0.10);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
          12.w,
          14.h,
          10.w,
          14.h,
        ),
        decoration: BoxDecoration(
          color: notification.isRead
              ? AppColors.background
              : AppColors.white,
          border: Border(
            bottom: BorderSide(
              color: AppColors.borderColor.withOpacity(0.65),
              width: 1.w,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    color: iconBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    notification.icon,
                    color: iconColor,
                    size: 24.sp,
                  ),
                ),

                if (!notification.isRead)
                  Positioned(
                    right: 2.w,
                    top: 2.h,
                    child: Container(
                      width: 9.w,
                      height: 9.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.white,
                          width: 1.4.w,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            SizedBox(width: 13.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 15.sp,
                      fontWeight: notification.isRead
                          ? FontWeight.w700
                          : FontWeight.w900,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    notification.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 12.sp,
                      height: 1.25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 8.w),

            Text(
              notification.time,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getIconColor(NotificationType type) {
    switch (type) {
      case NotificationType.order:
        return AppColors.primaryColor;
      case NotificationType.offer:
        return AppColors.primaryColor;
      case NotificationType.review:
        return AppColors.primaryColor;
      case NotificationType.payment:
        return AppColors.primaryColor;
      case NotificationType.general:
        return AppColors.info;
    }
  }
}

class NotificationGroupModel {
  NotificationGroupModel({
    required this.title,
    required this.notifications,
  });

  final String title;
  final List<NotificationModel> notifications;
}

class NotificationModel {
  NotificationModel({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.type,
    required this.isRead,
  });

  final String title;
  final String description;
  final String time;
  final IconData icon;
  final NotificationType type;
  bool isRead;
}

enum NotificationType {
  order,
  offer,
  review,
  payment,
  general,
}