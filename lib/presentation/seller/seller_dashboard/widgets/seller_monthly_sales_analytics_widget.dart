import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class SellerMonthlySalesAnalyticsWidget extends StatelessWidget {
  const SellerMonthlySalesAnalyticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(18.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.grey.shade200),
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

            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  "Monthly Sales Analytics",
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "This Month",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            /// Fake Chart
            SizedBox(
              height: 120.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  _bar(55),
                  _bar(75),
                  _bar(95),
                  _bar(65),
                  _bar(110),
                  _bar(85),

                ],
              ),
            ),

            SizedBox(height: 10.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Jan"),
                Text("Feb"),
                Text("Mar"),
                Text("Apr"),
                Text("May"),
                Text("Jun"),
              ],
            ),

            SizedBox(height: 22.h),

            Row(
              children: [

                Expanded(
                  child: _infoCard(
                    Iconsax.wallet_money,
                    "\$18,450",
                    "Revenue",
                    Colors.green,
                  ),
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: _infoCard(
                    Iconsax.trend_up,
                    "+12.5%",
                    "Growth",
                    Colors.blue,
                  ),
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: _infoCard(
                    Iconsax.shopping_cart,
                    "320",
                    "Orders",
                    Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bar(double height) {
    return Container(
      width: 22.w,
      height: height.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }

  Widget _infoCard(
      IconData icon,
      String value,
      String title,
      Color color,
      ) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [

          Icon(
            icon,
            color: color,
            size: 22.sp,
          ),

          SizedBox(height: 8.h),

          Text(
            value,
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),

          SizedBox(height: 4.h),

          Text(
            title,
            style: AppTextStyles.bodyLarge.copyWith(
              color: Colors.grey,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}