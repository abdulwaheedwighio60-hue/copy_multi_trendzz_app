import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class SellerRecentOrdersWidget extends StatelessWidget {
  const SellerRecentOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [

          /// Heading
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Orders",
                style: AppTextStyles.bodyLarge.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextButton(
                onPressed: () {
                  // Navigate Orders Screen
                },
                child: Text(
                  "View All",
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          _orderCard(
            customer: "Ali Ahmed",
            orderNo: "#MT1001",
            amount: "\$120.00",
            items: "2 Items",
            status: "Processing",
            statusColor: Colors.orange,
          ),

          SizedBox(height: 12.h),

          _orderCard(
            customer: "Sara Khan",
            orderNo: "#MT1002",
            amount: "\$85.00",
            items: "1 Item",
            status: "Delivered",
            statusColor: Colors.green,
          ),

          SizedBox(height: 12.h),

          _orderCard(
            customer: "Hassan Ali",
            orderNo: "#MT1003",
            amount: "\$240.00",
            items: "4 Items",
            status: "Shipped",
            statusColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _orderCard({
    required String customer,
    required String orderNo,
    required String amount,
    required String items,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.lightColor,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [

          CircleAvatar(
            radius: 24.r,
            backgroundColor: AppColors.primaryColor.withOpacity(.1),
            child: Icon(
              Iconsax.user,
              color: AppColors.primaryColor,
              size: 22.sp,
            ),
          ),

          SizedBox(width: 14.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  customer,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  orderNo,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: Colors.grey.shade600,
                    fontSize: 12.sp,
                  ),
                ),

                SizedBox(height: 8.h),

                Row(
                  children: [

                    Icon(
                      Iconsax.money,
                      size: 16.sp,
                      color: AppColors.primaryColor,
                    ),

                    SizedBox(width: 4.w),

                    Text(
                      amount,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Text(
                      "• $items",
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Column(
            children: [

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(.12),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16.sp,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}