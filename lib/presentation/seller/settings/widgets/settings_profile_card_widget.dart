import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class SettingsProfileCardWidget extends StatelessWidget {
  final String sellerName;
  final String storeName;
  final String email;
  final String imageUrl;
  final VoidCallback? onEdit;

  const SettingsProfileCardWidget({
    super.key,
    required this.sellerName,
    required this.storeName,
    required this.email,
    required this.imageUrl,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      padding: EdgeInsets.all(18.w),
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
      ),
      child: Row(
        children: [

          /// Profile Image
          CircleAvatar(
            radius: 35.r,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: NetworkImage(imageUrl),
          ),

          SizedBox(width: 16.w),

          /// Seller Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  sellerName,
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 6.h),

                Text(
                  storeName,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: Colors.grey.shade700,
                  ),
                ),

                SizedBox(height: 6.h),

                Text(
                  email,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 10.h),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Icon(
                        Iconsax.verify5,
                        color: Colors.green,
                        size: 15.sp,
                      ),

                      SizedBox(width: 5.w),

                      Text(
                        "Verified Seller",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),

          /// Edit Button
          InkWell(
            onTap: onEdit,
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Iconsax.edit,
                color: AppColors.primaryColor,
                size: 22.sp,
              ),
            ),
          ),

        ],
      ),
    );
  }
}