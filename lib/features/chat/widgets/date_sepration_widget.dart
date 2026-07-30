import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DateSeparatorWidget extends StatelessWidget {
  final String date;
  const DateSeparatorWidget({
    super.key,
    required this.date,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h,),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              endIndent: 12.w,
              indent: 12.w,
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              date,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey.shade300,
              thickness: 1,
              indent: 12.w,
              endIndent: 12.w,
            ),
          ),
        ],
      ),
    );
  }
}