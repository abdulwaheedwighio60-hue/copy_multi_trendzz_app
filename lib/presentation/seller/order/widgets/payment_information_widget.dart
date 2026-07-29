import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class PaymentInformationWidget extends StatelessWidget {
  final String paymentStatus;
  final String paymentMethod;
  final String transactionId;
  final String paymentDate;

  final double subtotal;
  final double shippingFee;
  final double tax;
  final double discount;
  final double total;

  const PaymentInformationWidget({
    super.key,
    this.paymentStatus = "Paid",
    this.paymentMethod = "Visa Card",
    this.transactionId = "TXN-987654321",
    this.paymentDate = "29 Jul 2026",

    this.subtotal = 220,
    this.shippingFee = 10,
    this.tax = 5,
    this.discount = 15,
    this.total = 220,
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
                Iconsax.wallet_money,
                color: AppColors.primaryColor,
              ),

              SizedBox(width: 10.w),

              Text(
                "Payment Information",
                style: AppTextStyles.titleMedium,
              ),
            ],
          ),

          SizedBox(height: 22.h),

          Row(
            children: [

              Expanded(
                child: _infoTile(
                  Iconsax.card,
                  "Payment Method",
                  paymentMethod,
                ),
              ),

              SizedBox(width: 10.w),

              _paymentBadge(),
            ],
          ),

          SizedBox(height: 18.h),

          _detailTile(
            Iconsax.receipt_item,
            "Transaction ID",
            transactionId,
          ),

          SizedBox(height: 14.h),

          _detailTile(
            Iconsax.calendar,
            "Payment Date",
            paymentDate,
          ),

          SizedBox(height: 22.h),

          Divider(),

          SizedBox(height: 12.h),

          _priceRow(
            "Subtotal",
            "\$${subtotal.toStringAsFixed(2)}",
          ),

          SizedBox(height: 10.h),

          _priceRow(
            "Shipping Fee",
            "\$${shippingFee.toStringAsFixed(2)}",
          ),

          SizedBox(height: 10.h),

          _priceRow(
            "Tax",
            "\$${tax.toStringAsFixed(2)}",
          ),

          SizedBox(height: 10.h),

          _priceRow(
            "Discount",
            "- \$${discount.toStringAsFixed(2)}",
            valueColor: Colors.green,
          ),

          SizedBox(height: 14.h),

          Divider(),

          SizedBox(height: 14.h),

          _priceRow(
            "Grand Total",
            "\$${total.toStringAsFixed(2)}",
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _paymentBadge() {
    final bool paid = paymentStatus == "Paid";

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: (paid ? Colors.green : Colors.red).withOpacity(.12),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Text(
        paymentStatus,
        style: TextStyle(
          color: paid ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
        ),
      ),
    );
  }

  Widget _infoTile(
      IconData icon,
      String title,
      String value,
      ) {
    return Row(
      children: [

        CircleAvatar(
          radius: 20.r,
          backgroundColor:
          AppColors.primaryColor.withOpacity(.10),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
            size: 20.sp,
          ),
        ),

        SizedBox(width: 10.w),

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 3.h),

              Text(
                value,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _detailTile(
      IconData icon,
      String title,
      String value,
      ) {
    return Row(
      children: [

        Icon(
          icon,
          color: AppColors.primaryColor,
          size: 20.sp,
        ),

        SizedBox(width: 10.w),

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
          ),
        ),
      ],
    );
  }

  Widget _priceRow(
      String title,
      String value, {
        bool isTotal = false,
        Color valueColor = Colors.black,
      }) {
    return Row(
      children: [

        Text(
          title,
          style: isTotal
              ? AppTextStyles.bodyLarge.copyWith(
            fontWeight: FontWeight.bold,
          )
              : AppTextStyles.bodyMedium,
        ),

        const Spacer(),

        Text(
          value,
          style: (isTotal
              ? AppTextStyles.titleMedium
              : AppTextStyles.bodyMedium)
              .copyWith(
            color: isTotal
                ? AppColors.primaryColor
                : valueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}