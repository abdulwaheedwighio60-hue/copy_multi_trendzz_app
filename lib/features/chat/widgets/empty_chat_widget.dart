import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';



class EmptyChatWidget extends StatelessWidget {

  final String title;
  final String description;
  final VoidCallback? onButtonPressed;

  const EmptyChatWidget({
    super.key,
    this.title = "No Messages Yet",
    this.description = "Start a conversation with buyers or sellers and your messages will appear here.",
    this.onButtonPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Chat Icon Container
            Container(
              height: 90.h,
              width: 90.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Iconsax.message_text,
                size: 45.sp,
                color: AppColors.primaryColor,
              ),
            ),

            SizedBox(height: 20.h),
            /// Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight:FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10.h),
            /// Description
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                height: 1.5,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 25.h),
            /// Button

            if(onButtonPressed != null)
              SizedBox(
                width: 180.w,
                height: 45.h,
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style:
                  ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r,),
                    ),
                  ),
                  child: Text(
                    "Start Chatting",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
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