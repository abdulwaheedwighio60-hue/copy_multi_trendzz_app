import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';


class TypingIndicatorWidget extends StatefulWidget {
  final String userName;
  const TypingIndicatorWidget({
    super.key,
    this.userName = "User",
  });
  @override
  State<TypingIndicatorWidget> createState() => _TypingIndicatorWidgetState();
}
class _TypingIndicatorWidgetState extends State<TypingIndicatorWidget> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration:
      const Duration(milliseconds: 900),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: 12.w,
          top: 6.h,
          bottom: 6.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0,2),
            ),
          ],
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${widget.userName} is typing",
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(width: 6.w),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Row(
                  children:
                  List.generate(
                    3,(index) {
                      double value = (controller.value + index * 0.2) % 1;
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.w,),
                        height: 5.h,
                        width: 5.w,
                        decoration: BoxDecoration(
                          color: value < 0.5 ? AppColors.primaryColor : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}