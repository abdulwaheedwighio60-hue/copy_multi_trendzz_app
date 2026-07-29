import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class SellerRecentTransactionsWidget extends StatelessWidget {
  const SellerRecentTransactionsWidget({super.key});

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
                "Recent Transactions",
                style: AppTextStyles.bodyLarge.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextButton(
                onPressed: () {},
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

          SizedBox(height: 12.h),

          _transactionCard(
            orderId: "#MT1001",
            amount: "\$120.00",
            status: "Completed",
            type: "Payment Received",
            date: "Today • 10:30 AM",
            isCompleted: true,
          ),

          SizedBox(height: 12.h),

          _transactionCard(
            orderId: "#MT1002",
            amount: "\$85.00",
            status: "Pending",
            type: "Payment Pending",
            date: "Yesterday • 04:15 PM",
            isCompleted: false,
          ),

          SizedBox(height: 12.h),

          _transactionCard(
            orderId: "#MT1003",
            amount: "\$240.00",
            status: "Completed",
            type: "Payment Received",
            date: "21 Jul • 09:40 AM",
            isCompleted: true,
          ),
        ],
      ),
    );
  }

  Widget _transactionCard({
    required String orderId,
    required String amount,
    required String status,
    required String type,
    required String date,
    required bool isCompleted,
  }) {

    final Color statusColor =
    isCompleted ? Colors.green : Colors.orange;

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
            color: Colors.black.withOpacity(.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [

          /// Transaction Icon
          Container(
            width: 54.w,
            height: 54.w,
            decoration: BoxDecoration(
              color: statusColor.withOpacity(.10),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(
              Iconsax.card,
              color: statusColor,
              size: 28.sp,
            ),
          ),

          SizedBox(width: 14.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  orderId,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  type,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: Colors.grey.shade600,
                    fontSize: 13.sp,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  date,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Text(
                amount,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),

              SizedBox(height: 10.h),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(.10),
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
            ],
          ),
        ],
      ),
    );
  }
}