import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class CouponStatsWidget extends StatelessWidget {
  const CouponStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(18.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Coupon Analytics",
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20.h),

            Row(
              children: const [

                Expanded(
                  child: _StatCard(
                    icon: Iconsax.chart,
                    title: "Redemptions",
                    value: "438",
                    color: Colors.blue,
                  ),
                ),

                SizedBox(width: 12),

                Expanded(
                  child: _StatCard(
                    icon: Iconsax.wallet_money,
                    title: "Revenue",
                    value: "\$12.8K",
                    color: Colors.green,
                  ),
                ),

              ],
            ),

            SizedBox(height: 12.h),

            Row(
              children: const [

                Expanded(
                  child: _StatCard(
                    icon: Iconsax.percentage_circle,
                    title: "Conversion",
                    value: "28%",
                    color: Colors.orange,
                  ),
                ),

                SizedBox(width: 12),

                Expanded(
                  child: _StatCard(
                    icon: Iconsax.cup,
                    title: "Best Coupon",
                    value: "SUMMER50",
                    color: Colors.purple,
                  ),
                ),

              ],
            ),

            SizedBox(height: 22.h),

            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.08),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                children: [

                  Container(
                    width: 46.w,
                    height: 46.w,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Iconsax.ticket_discount,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(width: 14.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Top Performing Coupon",
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.grey.shade700,
                          ),
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          "SUMMER50 • 152 Uses",
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          "Generated \$4,820 in sales",
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.green,
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Icon(
            icon,
            color: color,
            size: 26.sp,
          ),

          const Spacer(),

          Text(
            value,
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 4.h),

          Text(
            title,
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey.shade700,
            ),
          ),

        ],
      ),
    );
  }
}