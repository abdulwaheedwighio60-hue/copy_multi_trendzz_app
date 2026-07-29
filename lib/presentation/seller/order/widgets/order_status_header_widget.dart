import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class OrderStatusHeaderWidget extends StatelessWidget {
  final String orderId;
  final String customerName;
  final String orderDate;
  final String status;
  final double totalAmount;
  final int totalItems;

  const OrderStatusHeaderWidget({
    super.key,
    this.orderId = "ORD-10245",
    this.customerName = "John Smith",
    this.orderDate = "29 Jul 2026",
    this.status = "Pending",
    this.totalAmount = 240,
    this.totalItems = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Status Badge
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 7.h,
            ),
            decoration: BoxDecoration(
              color: _statusColor(status).withOpacity(.12),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Text(
              status,
              style: AppTextStyles.bodySmall.copyWith(
                color: _statusColor(status),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 18.h),

          Text(
            "Order #$orderId",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 6.h),

          Text(
            customerName,
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.grey.shade700,
            ),
          ),

          SizedBox(height: 18.h),

          Row(
            children: [

              Expanded(
                child: _infoCard(
                  icon: Iconsax.calendar,
                  title: "Order Date",
                  value: orderDate,
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: _infoCard(
                  icon: Iconsax.box,
                  title: "Items",
                  value: "$totalItems Products",
                ),
              ),

            ],
          ),

          SizedBox(height: 12.h),

          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.08),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              children: [

                CircleAvatar(
                  radius: 22.r,
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Iconsax.wallet_money,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),

                SizedBox(width: 14.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Total Amount",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey,
                        ),
                      ),

                      SizedBox(height: 3.h),

                      Text(
                        "\$${totalAmount.toStringAsFixed(2)}",
                        style: AppTextStyles.titleMedium.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
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
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [

          Icon(
            icon,
            color: AppColors.primaryColor,
            size: 22.sp,
          ),

          SizedBox(height: 8.h),

          Text(
            title,
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 4.h),

          Text(
            value,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case "Delivered":
        return Colors.green;

      case "Processing":
        return Colors.blue;

      case "Cancelled":
        return Colors.red;

      case "Shipped":
        return Colors.purple;

      default:
        return Colors.orange;
    }
  }
}