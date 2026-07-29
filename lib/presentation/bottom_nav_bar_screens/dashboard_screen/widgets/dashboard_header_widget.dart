import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 215.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20.w,
            10.h,
            20.w,
            18.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.lightColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 6.h),

              Row(
                children: [
                  Icon(
                    Iconsax.location,
                    color: AppColors.lightColor,
                    size: 20.sp,
                  ),

                  SizedBox(width: 5.w),

                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Karachi, Sindh, Pakistan',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.lightColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.lightColor,
                          size: 25.sp,
                        ),
                      ],
                    ),
                  ),



                  SizedBox(width: 10.w),

                  InkWell(
                    onTap: (){
                      context.push(AppRoutes.notificationScreen);
                    },
                    child: Container(
                      width: 45.w,
                      height: 45.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.lightColor.withValues(
                          alpha: 0.25,
                        ),
                      ),
                      child: Icon(
                        CupertinoIcons.bell_fill,
                        color: AppColors.lightColor,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 18.h),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48.h,
                      child: CustomTextFormFieldWidget(
                        fillColor: AppColors.lightColor,
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: AppColors.primaryColor,
                          size: 20.sp,
                        ),
                        hintText: 'Search',
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.lightColor,
                    ),
                    child: Icon(
                      CupertinoIcons.slider_horizontal_3,
                      color: AppColors.primaryColor,
                      size: 22.sp,
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
}