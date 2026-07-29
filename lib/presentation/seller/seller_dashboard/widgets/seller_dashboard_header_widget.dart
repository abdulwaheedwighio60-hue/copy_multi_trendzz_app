import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';

class SellerDashboardHeaderWidget extends StatelessWidget {
  const SellerDashboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280.h,
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
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 12.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Top Row
              Row(
                children: [

                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor: AppColors.lightColor,
                    child: Icon(
                      Iconsax.shop,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Good Morning 👋",
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: Colors.white70,
                            fontSize: 13.sp,
                          ),
                        ),

                        SizedBox(height: 3.h),

                        Text(
                          "Multi Trendzz Store",
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      context.push(AppRoutes.notificationScreen);
                    },
                    child: Container(
                      width: 46.w,
                      height: 46.w,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        CupertinoIcons.bell_fill,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              Text(
                "Seller Dashboard",
                style: AppTextStyles.bodyLarge.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
              ),

              SizedBox(height: 5.h),

              Text(
                "Manage your products and orders easily.",
                style: AppTextStyles.bodyLarge.copyWith(
                  color: Colors.white70,
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 22.h),

              Row(
                children: [

                  Expanded(
                    child: SizedBox(
                      height: 48.h,
                      child: CustomTextFormFieldWidget(
                        fillColor: Colors.white,
                        hintText: "Search Products",
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: AppColors.primaryColor,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 12.w),

                  InkWell(
                    onTap: () {

                      /// Navigate to Add Product Screen

                    },
                    child: Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.primaryColor,
                      ),
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