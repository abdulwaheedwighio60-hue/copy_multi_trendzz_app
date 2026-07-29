import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class CustomerRecentOrdersWidget extends StatelessWidget {
  const CustomerRecentOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      {
        "orderId": "#ORD-1001",
        "date": "18 Jul 2026",
        "amount": "\$245",
        "payment": "Paid",
        "status": "Delivered",
      },
      {
        "orderId": "#ORD-1002",
        "date": "15 Jul 2026",
        "amount": "\$120",
        "payment": "Paid",
        "status": "Shipped",
      },
      {
        "orderId": "#ORD-1003",
        "date": "11 Jul 2026",
        "amount": "\$89",
        "payment": "Pending",
        "status": "Processing",
      },
      {
        "orderId": "#ORD-1004",
        "date": "08 Jul 2026",
        "amount": "\$410",
        "payment": "Paid",
        "status": "Delivered",
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Recent Orders",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 15.h),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orders.length,
            itemBuilder: (context, index) {

              final order = orders[index];

              return _OrderCard(
                orderId: order["orderId"]!,
                date: order["date"]!,
                amount: order["amount"]!,
                payment: order["payment"]!,
                status: order["status"]!,
              );
            },
          ),

        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {

  final String orderId;
  final String date;
  final String amount;
  final String payment;
  final String status;

  const _OrderCard({
    required this.orderId,
    required this.date,
    required this.amount,
    required this.payment,
    required this.status,
  });

  Color getStatusColor() {
    switch (status) {
      case "Delivered":
        return Colors.green;

      case "Shipped":
        return Colors.blue;

      case "Processing":
        return Colors.orange;

      default:
        return Colors.grey;
    }
  }

  Color getPaymentColor() {
    return payment == "Paid"
        ? Colors.green
        : Colors.red;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(16.w),
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
        children: [

          Row(
            children: [

              Container(
                width: 55.w,
                height: 55.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(.10),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: const Icon(
                  Iconsax.box,
                  color: AppColors.primaryColor,
                ),
              ),

              SizedBox(width: 15.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      orderId,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5.h),

                    Text(
                      date,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.grey,
                      ),
                    ),

                  ],
                ),
              ),

              Text(
                amount,
                style: AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),

            ],
          ),

          SizedBox(height: 18.h),

          Row(
            children: [

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: getPaymentColor().withOpacity(.12),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      payment,
                      style: TextStyle(
                        color: getPaymentColor(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: getStatusColor().withOpacity(.12),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      status,
                      style: TextStyle(
                        color: getStatusColor(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),

          SizedBox(height: 15.h),

          SizedBox(
            width: double.infinity,
            height: 45.h,
            child: OutlinedButton.icon(
              onPressed: () {
                // Navigate Order Detail
              },
              icon: const Icon(Iconsax.eye),
              label: const Text("View Order"),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                side: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(14.r),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}