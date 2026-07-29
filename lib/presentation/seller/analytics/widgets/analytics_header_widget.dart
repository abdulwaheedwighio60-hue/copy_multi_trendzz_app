import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_text_style.dart';

class AnalyticsHeaderWidget extends StatelessWidget {
  final String sellerName;
  final String date;

  const AnalyticsHeaderWidget({
    super.key,
    this.sellerName = "Abdul Waheed",
    this.date = "Wednesday, 29 July 2026",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28.r),
          bottomRight: Radius.circular(28.r),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20.w,
            16.h,
            20.w,
            24.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Top Row
              Row(
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Analytics",
                          style: AppTextStyles.titleMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 6.h),

                        Text(
                          "Monitor your business performance",
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  _iconButton(
                    icon: CupertinoIcons.bell_fill,
                    onTap: () {
                      context.push(
                        AppRoutes.notificationScreen,
                      );
                    },
                  ),

                  SizedBox(width: 10.w),

                  _iconButton(
                    icon: Iconsax.document_download,
                    onTap: () {},
                  ),
                ],
              ),

              SizedBox(height: 28.h),

              /// Seller Info
              Row(
                children: [

                  CircleAvatar(
                    radius: 28.r,
                    backgroundColor:
                    Colors.white.withOpacity(.20),
                    child: Icon(
                      Iconsax.user,
                      color: Colors.white,
                      size: 28.sp,
                    ),
                  ),

                  SizedBox(width: 14.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Good Morning 👋",
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Colors.white70,
                          ),
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          sellerName,
                          style: AppTextStyles.titleMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          date,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconButton({
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        width: 46.w,
        height: 46.w,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.15),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 22.sp,
        ),
      ),
    );
  }
}