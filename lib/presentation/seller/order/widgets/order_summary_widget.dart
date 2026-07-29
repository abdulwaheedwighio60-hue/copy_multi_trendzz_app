import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class OrderSummaryWidget extends StatelessWidget {
  final int totalItems;
  final double subtotal;
  final double shippingFee;
  final double tax;
  final double discount;
  final double grandTotal;

  const OrderSummaryWidget({
    super.key,
    this.totalItems = 3,
    this.subtotal = 220,
    this.shippingFee = 10,
    this.tax = 5,
    this.discount = 15,
    this.grandTotal = 220,
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
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Heading
          Row(
            children: [

              Icon(
                Iconsax.receipt_2,
                color: AppColors.primaryColor,
              ),

              SizedBox(width: 10.w),

              Text(
                "Order Summary",
                style: AppTextStyles.titleMedium,
              ),

            ],
          ),

          SizedBox(height: 24.h),

          _summaryRow(
            title: "Total Items",
            value: "$totalItems Products",
            icon: Iconsax.box,
          ),

          Divider(height: 28.h),

          _summaryRow(
            title: "Subtotal",
            value: "\$${subtotal.toStringAsFixed(2)}",
            icon: Iconsax.wallet_2,
          ),

          SizedBox(height: 12.h),

          _summaryRow(
            title: "Shipping Fee",
            value: "\$${shippingFee.toStringAsFixed(2)}",
            icon: Iconsax.truck_fast,
          ),

          SizedBox(height: 12.h),

          _summaryRow(
            title: "Tax",
            value: "\$${tax.toStringAsFixed(2)}",
            icon: Iconsax.receipt_item,
          ),

          SizedBox(height: 12.h),

          _summaryRow(
            title: "Discount",
            value: "- \$${discount.toStringAsFixed(2)}",
            icon: Iconsax.discount_shape,
            valueColor: Colors.green,
          ),

          Divider(height: 30.h),

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
                    Iconsax.money_recive,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),

                SizedBox(width: 14.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Grand Total",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey,
                        ),
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        "\$${grandTotal.toStringAsFixed(2)}",
                        style: AppTextStyles.headlineMedium.copyWith(
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

  Widget _summaryRow({
    required String title,
    required String value,
    required IconData icon,
    Color valueColor = Colors.black,
  }) {
    return Row(
      children: [

        Icon(
          icon,
          size: 20.sp,
          color: AppColors.primaryColor,
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodyMedium,
          ),
        ),

        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}