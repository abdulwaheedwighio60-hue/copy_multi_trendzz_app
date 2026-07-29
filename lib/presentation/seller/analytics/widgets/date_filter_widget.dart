import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class DateFilterWidget extends StatefulWidget {
  final Function(String)? onChanged;

  const DateFilterWidget({
    super.key,
    this.onChanged,
  });

  @override
  State<DateFilterWidget> createState() =>
      _DateFilterWidgetState();
}

class _DateFilterWidgetState
    extends State<DateFilterWidget> {

  final List<String> filters = [
    "Today",
    "Week",
    "Month",
    "Year",
  ];

  int selectedIndex = 2; // Month Default

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 46.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        scrollDirection: Axis.horizontal,

        itemCount: filters.length,

        separatorBuilder: (_, __) =>
            SizedBox(width: 10.w),

        itemBuilder: (_, index) {

          final bool selected =
              selectedIndex == index;

          return InkWell(
            borderRadius:
            BorderRadius.circular(25.r),

            onTap: () {

              setState(() {
                selectedIndex = index;
              });

              widget.onChanged?.call(
                filters[index],
              );
            },

            child: AnimatedContainer(
              duration:
              const Duration(milliseconds: 250),

              padding: EdgeInsets.symmetric(
                horizontal: 22.w,
                vertical: 12.h,
              ),

              decoration: BoxDecoration(

                color: selected
                    ? AppColors.primaryColor
                    : Colors.white,

                borderRadius:
                BorderRadius.circular(25.r),

                border: Border.all(
                  color: selected
                      ? AppColors.primaryColor
                      : Colors.grey.shade300,
                ),

                boxShadow: selected
                    ? [
                  BoxShadow(
                    color: AppColors.primaryColor
                        .withOpacity(.20),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
                    : [],
              ),

              child: Center(
                child: Text(
                  filters[index],
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: selected
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}