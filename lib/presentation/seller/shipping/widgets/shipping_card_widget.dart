import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

enum ShippingStatus {
  pending,
  packed,
  inTransit,
  delivered,
  returned,
}

class ShippingCardWidget extends StatelessWidget {
  final String trackingNumber;
  final String customerName;
  final String courierCompany;
  final String address;
  final String shippingCost;
  final String expectedDelivery;
  final ShippingStatus status;
  final VoidCallback? onTap;

  const ShippingCardWidget({
    super.key,
    required this.trackingNumber,
    required this.customerName,
    required this.courierCompany,
    required this.address,
    required this.shippingCost,
    required this.expectedDelivery,
    required this.status,
    this.onTap,
  });

  Color get statusColor {
    switch (status) {
      case ShippingStatus.pending:
        return Colors.orange;

      case ShippingStatus.packed:
        return Colors.deepPurple;

      case ShippingStatus.inTransit:
        return Colors.blue;

      case ShippingStatus.delivered:
        return Colors.green;

      case ShippingStatus.returned:
        return Colors.red;
    }
  }

  String get statusText {
    switch (status) {
      case ShippingStatus.pending:
        return "Pending";

      case ShippingStatus.packed:
        return "Packed";

      case ShippingStatus.inTransit:
        return "In Transit";

      case ShippingStatus.delivered:
        return "Delivered";

      case ShippingStatus.returned:
        return "Returned";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18.r),
      child: Container(
        margin: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: 16.h,
        ),
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

            /// Top Row
            Row(
              children: [

                Container(
                  width: 55.w,
                  height: 55.w,
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(.12),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Icon(
                    Icons.local_shipping_rounded,
                    color: statusColor,
                    size: 28.sp,
                  ),
                ),

                SizedBox(width: 15.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        trackingNumber,
                        style: AppTextStyles.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        courierCompany,
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
              icon: Iconsax.user,
              title: "Customer",
              value: customerName,
            ),

            SizedBox(height: 10.h),

            _InfoRow(
              icon: Iconsax.location,
              title: "Destination",
              value: address,
            ),

            SizedBox(height: 10.h),

            Row(
              children: [

                Expanded(
                  child: _InfoRow(
                    icon: Iconsax.wallet_money,
                    title: "Shipping",
                    value: shippingCost,
                  ),
                ),

                Expanded(
                  child: _InfoRow(
                    icon: Iconsax.calendar,
                    title: "Delivery",
                    value: expectedDelivery,
                  ),
                ),

              ],
            ),

            SizedBox(height: 18.h),

            SizedBox(
              width: double.infinity,
              height: 46.h,
              child: ElevatedButton.icon(
                onPressed: onTap,
                icon: const Icon(Iconsax.eye),
                label: const Text("View Details"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
              ),
            ),

          ],
        ),
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
          size: 18.sp,
          color: AppColors.primaryColor,
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