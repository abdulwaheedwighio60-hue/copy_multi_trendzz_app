import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class SellerQuickActionsWidget extends StatelessWidget {
  const SellerQuickActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Actions",
            style: AppTextStyles.bodyLarge.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16.h),

          _actionCard(
            context,
            icon: Iconsax.add_circle,
            title: "Add Product",
            subtitle: "Create a new product",
            onTap: () {
              context.push(AppRoutes.addProductScreen);
            },
          ),

          SizedBox(height: 14.h),

          _actionCard(
            context,
            icon: Iconsax.box,
            title: "My Products",
            subtitle: "Manage all your products",
            onTap: () {
              context.push(AppRoutes.myProductScreen);
            },
          ),

          SizedBox(height: 14.h),

          _actionCard(
            context,
            icon: Iconsax.shopping_cart,
            title: "Orders",
            subtitle: "Track customer orders",
            onTap: () {
              context.push(AppRoutes.orderScreen);
            },
          ),

          SizedBox(height: 14.h),

          _actionCard(
            context,
            icon: Iconsax.chart_2,
            title: "Analytics",
            subtitle: "View sales reports",
            onTap: () {
              context.push(AppRoutes.analyticsScreen);
            },
          ),
        ],
      ),
    );
  }

  Widget _actionCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap,
      }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 14.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 54.w,
              height: 54.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Icon(
                icon,
                color: AppColors.primaryColor,
                size: 26.sp,
              ),
            ),

            SizedBox(width: 16.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    subtitle,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontSize: 12.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              Iconsax.arrow_right_3,
              size: 18.sp,
              color: Colors.grey.shade500,
            ),
          ],
        ),
      ),
    );
  }
}