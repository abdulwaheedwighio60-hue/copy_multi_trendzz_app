import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class SellerPerformanceOverviewWidget extends StatelessWidget {
  const SellerPerformanceOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Performance Overview",
            style: AppTextStyles.bodyLarge.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16.h),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 14.w,
            mainAxisSpacing: 14.h,
            childAspectRatio: 1.55,
            children: [

              _performanceCard(
                icon: Iconsax.star1,
                title: "Avg Rating",
                value: "4.8",
                color: Colors.amber,
              ),

              _performanceCard(
                icon: Iconsax.box,
                title: "Products",
                value: "245",
                color: Colors.blue,
              ),

              _performanceCard(
                icon: Iconsax.truck,
                title: "Pending Deliveries",
                value: "18",
                color: Colors.orange,
              ),

              _performanceCard(
                icon: Iconsax.wallet_money,
                title: "Pending Payout",
                value: "\$3,250",
                color: Colors.green,
              ),

              _performanceCard(
                icon: Iconsax.chart_success,
                title: "Conversion",
                value: "78%",
                color: Colors.purple,
              ),

              _performanceCard(
                icon: Iconsax.refresh,
                title: "Return Rate",
                value: "2.4%",
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _performanceCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [

          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              color: color.withOpacity(.10),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(
              icon,
              color: color,
              size: 26.sp,
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  value,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}