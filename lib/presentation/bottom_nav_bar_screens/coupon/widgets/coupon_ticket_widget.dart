import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/model/coupon_model.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/coupon/widgets/coupon_ticket_cliper.dart';

class CouponTicketWidget extends StatelessWidget {
  const CouponTicketWidget({
    super.key,
    required this.coupon,
    required this.onCopy,
    required this.onTap,
  });

  final CouponModel coupon;
  final VoidCallback onCopy;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CouponTicketClipper(),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.borderColor.withOpacity(0.75),
              width: 1.w,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.035),
                blurRadius: 12.r,
                offset: Offset(0, 5.h),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  18.w,
                  14.h,
                  18.w,
                  14.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coupon.code,
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.textPrimary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                          SizedBox(height: 4.h),

                          Text(
                            coupon.unlockText,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textHint,
                              fontSize: 11.5.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          SizedBox(height: 9.h),

                          Row(
                            children: [
                              Icon(
                                Iconsax.discount_shape,
                                color: AppColors.primaryColor,
                                size: 18.sp,
                              ),

                              SizedBox(width: 6.w),

                              Expanded(
                                child: Text(
                                  coupon.description,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.textPrimary,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                height: 46.h,
                color: AppColors.lightColor,
                child: InkWell(
                  onTap: onCopy,
                  child: Center(
                    child: Text(
                      'COPY CODE',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                        letterSpacing: 1.7,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}