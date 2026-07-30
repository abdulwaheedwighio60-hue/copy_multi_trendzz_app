import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';


class MessageBubbleWidget extends StatelessWidget {

  final String message;
  final String time;
  final bool isSender;
  final bool isSeen;

  const MessageBubbleWidget({
    super.key,
    required this.message,
    required this.time,
    required this.isSender,
    this.isSeen = false,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: isSender ? 60.w : 12.w,
          right: isSender ? 12.w : 60.w,
          top: 6.h,
          bottom: 6.h
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: isSender ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(isSender ? 16.r : 4.r,),
            bottomRight: Radius.circular(isSender ? 4.r : 16.r,),
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0,2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                fontSize: 14.sp,
                height: 1.4,
                color: isSender ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: isSender ? Colors.white70 : Colors.grey,
                  ),
                ),
                if(isSender)
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Icon(
                      isSeen ? Icons.done_all : Icons.done,
                      size: 14.sp,
                      color: isSeen ? Colors.lightBlueAccent : Colors.white70,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}