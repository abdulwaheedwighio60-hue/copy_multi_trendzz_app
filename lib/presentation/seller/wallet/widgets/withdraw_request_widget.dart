import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class WithdrawRequestsWidget extends StatelessWidget {
  const WithdrawRequestsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Withdraw Requests",
                style: AppTextStyles.titleMedium,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text("View All"),
              ),
            ],
          ),

          SizedBox(height: 18.h),

          const _WithdrawRequestTile(
            requestId: "#WD-10025",
            amount: "\$2,500",
            bank: "HBL Bank",
            account: "****4582",
            date: "29 July 2026",
            status: "Approved",
            note: "Transferred successfully",
          ),

          SizedBox(height: 14.h),

          const _WithdrawRequestTile(
            requestId: "#WD-10024",
            amount: "\$1,250",
            bank: "Meezan Bank",
            account: "****8834",
            date: "27 July 2026",
            status: "Pending",
            note: "Waiting for finance approval",
          ),

          SizedBox(height: 14.h),

          const _WithdrawRequestTile(
            requestId: "#WD-10023",
            amount: "\$850",
            bank: "UBL Bank",
            account: "****2251",
            date: "25 July 2026",
            status: "Rejected",
            note: "Incorrect account details",
          ),
        ],
      ),
    );
  }
}

class _WithdrawRequestTile extends StatelessWidget {
  final String requestId;
  final String amount;
  final String bank;
  final String account;
  final String date;
  final String status;
  final String note;

  const _WithdrawRequestTile({
    required this.requestId,
    required this.amount,
    required this.bank,
    required this.account,
    required this.date,
    required this.status,
    required this.note,
  });

  Color get statusColor {
    switch (status) {
      case "Approved":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      case "Rejected":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData get statusIcon {
    switch (status) {
      case "Approved":
        return Iconsax.tick_circle;
      case "Pending":
        return Iconsax.clock;
      case "Rejected":
        return Iconsax.close_circle;
      default:
        return Iconsax.info_circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(.12),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Icon(
                  statusIcon,
                  color: statusColor,
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      amount,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      requestId,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 5.h,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(.12),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          Row(
            children: [
              const Icon(Iconsax.bank, size: 18),

              SizedBox(width: 8.w),

              Expanded(
                child: Text(
                  "$bank ($account)",
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          Row(
            children: [
              const Icon(Iconsax.calendar, size: 18),

              SizedBox(width: 8.w),

              Expanded(
                child: Text(
                  date,
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Iconsax.message_text, size: 18),

              SizedBox(width: 8.w),

              Expanded(
                child: Text(
                  note,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Iconsax.eye),
              label: const Text("View Details"),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                side: BorderSide(
                  color: AppColors.primaryColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}