import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

enum CouponStatus {
  active,
  scheduled,
  expired,
}

enum CouponType {
  percentage,
  flat,
}

class CouponCardWidget extends StatelessWidget {
  final String couponCode;
  final CouponType couponType;
  final String discount;
  final String validFrom;
  final String validTo;
  final String minimumOrder;
  final int usedCount;
  final CouponStatus status;

  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onView;

  const CouponCardWidget({
    super.key,
    required this.couponCode,
    required this.couponType,
    required this.discount,
    required this.validFrom,
    required this.validTo,
    required this.minimumOrder,
    required this.usedCount,
    required this.status,
    this.onEdit,
    this.onDelete,
    this.onView,
  });

  Color get statusColor {
    switch (status) {
      case CouponStatus.active:
        return Colors.green;

      case CouponStatus.scheduled:
        return Colors.orange;

      case CouponStatus.expired:
        return Colors.red;
    }
  }

  String get statusText {
    switch (status) {
      case CouponStatus.active:
        return "Active";

      case CouponStatus.scheduled:
        return "Scheduled";

      case CouponStatus.expired:
        return "Expired";
    }
  }

  String get couponTypeText {
    switch (couponType) {
      case CouponType.percentage:
        return "Percentage";

      case CouponType.flat:
        return "Flat Discount";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: 18.h,
      ),
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
        children: [

          /// Top Row
          Row(
            children: [

              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(.12),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(
                  Iconsax.ticket_discount,
                  color: AppColors.primaryColor,
                  size: 30.sp,
                ),
              ),

              SizedBox(width: 15.w),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      couponCode,
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      couponTypeText,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),

                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(.12),
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Text(
                  statusText,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            ],
          ),

          SizedBox(height: 18.h),

          _InfoRow(
            icon: Iconsax.discount_shape,
            title: "Discount",
            value: discount,
          ),

          SizedBox(height: 10.h),

          _InfoRow(
            icon: Iconsax.calendar,
            title: "Valid",
            value: "$validFrom - $validTo",
          ),

          SizedBox(height: 10.h),

          _InfoRow(
            icon: Iconsax.wallet_money,
            title: "Minimum Order",
            value: minimumOrder,
          ),

          SizedBox(height: 10.h),

          _InfoRow(
            icon: Iconsax.chart,
            title: "Used",
            value: "$usedCount Times",
          ),

          SizedBox(height: 18.h),

          Row(
            children: [

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Iconsax.edit),
                  label: const Text("Edit"),
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onDelete,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  icon: const Icon(Iconsax.trash),
                  label: const Text("Delete"),
                ),
              ),

            ],
          ),

          SizedBox(height: 12.h),

          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton.icon(
              onPressed: onView,
              icon: const Icon(Iconsax.eye),
              label: const Text("View Details"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
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

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Icon(
          icon,
          color: AppColors.primaryColor,
          size: 18.sp,
        ),

        SizedBox(width: 8.w),

        Text(
          "$title: ",
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.grey.shade600,
          ),
        ),

        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

      ],
    );
  }
}