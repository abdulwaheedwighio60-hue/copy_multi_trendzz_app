import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class CustomerProfileHeaderWidget extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onMessage;
  final VoidCallback? onCall;

  const CustomerProfileHeaderWidget({
    super.key,
    this.onBack,
    this.onMessage,
    this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),

      child: Column(
        children: [

          SizedBox(height: 15.h),

          /// Top Bar

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Row(
              children: [

                InkWell(
                  onTap: onBack,
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    width: 45.w,
                    height: 45.h,
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

                const Spacer(),

                Text(
                  "Customer Details",
                  style: AppTextStyles.titleMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                SizedBox(width: 45.w),

              ],
            ),
          ),

          SizedBox(height: 25.h),

          /// Profile Image

          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 50.r,
              backgroundImage: const NetworkImage(
                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300&q=80",
              ),
              backgroundColor: Colors.grey.shade200,
            ),
          ),

          SizedBox(height: 15.h),

          /// Name

          Text(
            "Abdul Waheed",
            style: AppTextStyles.headlineMedium.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 6.h),

          Text(
            "abdulwaheed@gmail.com",
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.white70,
            ),
          ),

          SizedBox(height: 12.h),

          /// Premium Badge

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                Icon(
                  Iconsax.crown,
                  size: 16.sp,
                  color: Colors.white,
                ),

                SizedBox(width: 6.w),

                Text(
                  "Premium Customer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: 25.h),

          /// Action Buttons

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Row(
              children: [

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onCall,
                    icon: const Icon(Iconsax.call),
                    label: const Text("Call"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primaryColor,
                      elevation: 0,
                      minimumSize: Size(
                        double.infinity,
                        50.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(14.r),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onMessage,
                    icon: const Icon(Iconsax.message),
                    label: const Text("Message"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primaryColor,
                      elevation: 0,
                      minimumSize: Size(
                        double.infinity,
                        50.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(14.r),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: 25.h),

        ],
      ),
    );
  }
}