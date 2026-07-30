import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/app_colors.dart';

class ChatAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String imageUrl;
  final bool isOnline;
  final VoidCallback? onBackPressed;
  final VoidCallback? onCallPressed;
  final VoidCallback? onMorePressed;

  const ChatAppBarWidget({
    super.key,
    required this.name,
    required this.imageUrl,
    this.isOnline = false,
    this.onBackPressed,
    this.onCallPressed,
    this.onMorePressed,
  });


  @override
  Widget build(BuildContext context) {

    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: onBackPressed ??
                () => Navigator.pop(context),
        icon: const Icon(
          Iconsax.arrow_left,
          color: Colors.white,
        ),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          /// Profile Image
          Stack(
            children: [
              CircleAvatar(
                radius: 22.r,
                backgroundColor: Colors.white24,
                backgroundImage: NetworkImage(imageUrl),
              ),
              /// Online Indicator

              if(isOnline)
                Positioned(
                  right: 1,
                  bottom: 2,
                  child: Container(
                    width: 11.w,
                    height: 11.h,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],

          ),
          SizedBox(width: 12.w),
          /// User Name + Status
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight:
                  FontWeight.w600,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                isOnline ? "Online" : "Offline",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: onCallPressed,
          icon: const Icon(
            Iconsax.call,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: onMorePressed,
          icon: const Icon(
            Iconsax.more,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight);

}