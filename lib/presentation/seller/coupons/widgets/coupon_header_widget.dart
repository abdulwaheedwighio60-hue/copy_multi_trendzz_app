import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class CouponHeaderWidget extends StatelessWidget {
  final int totalCoupons;
  final VoidCallback? onSearchTap;
  final VoidCallback? onFilterTap;
  final VoidCallback? onCreateCoupon;

  const CouponHeaderWidget({
    super.key,
    this.totalCoupons = 24,
    this.onSearchTap,
    this.onFilterTap,
    this.onCreateCoupon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 18.h,
        left: 20.w,
        right: 20.w,
        bottom: 28.h,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Top Bar
            Row(
              children: [

                InkWell(
                  onTap: () => context.pop(),
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    width: 45.w,
                    height: 45.w,
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

                SizedBox(width: 15.w),

                Expanded(
                  child: Text(
                    "Coupons",
                    style: AppTextStyles.titleLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                _actionButton(
                  Iconsax.search_normal,
                  onSearchTap,
                ),

                SizedBox(width: 10.w),

                _actionButton(
                  Iconsax.setting_4,
                  onFilterTap,
                ),

              ],
            ),

            SizedBox(height: 24.h),

            Text(
              "Create and manage discount coupons",
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.white.withOpacity(.9),
              ),
            ),

            SizedBox(height: 22.h),

            Container(
              padding: EdgeInsets.all(18.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.12),
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Row(
                children: [

                  Container(
                    width: 65.w,
                    height: 65.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.18),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Iconsax.ticket_discount,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),

                  SizedBox(width: 18.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Text(
                          "$totalCoupons Coupons",
                          style: AppTextStyles.titleMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5.h),

                        Text(
                          "Boost sales with attractive discount offers.",
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.white70,
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(height: 20.h),

            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton.icon(
                onPressed: onCreateCoupon,
                icon: const Icon(Iconsax.add),
                label: const Text("Create Coupon"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _actionButton(
      IconData icon,
      VoidCallback? onTap,
      ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 45.w,
        height: 45.w,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.15),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}