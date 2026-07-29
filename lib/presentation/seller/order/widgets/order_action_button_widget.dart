import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class OrderActionButtonsWidget extends StatelessWidget {
  final VoidCallback? onCallCustomer;
  final VoidCallback? onChatCustomer;
  final VoidCallback? onAssignRider;
  final VoidCallback? onDownloadInvoice;
  final VoidCallback? onPrintInvoice;
  final VoidCallback? onCancelOrder;
  final VoidCallback? onRefundOrder;

  const OrderActionButtonsWidget({
    super.key,
    this.onCallCustomer,
    this.onChatCustomer,
    this.onAssignRider,
    this.onDownloadInvoice,
    this.onPrintInvoice,
    this.onCancelOrder,
    this.onRefundOrder,
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

          Row(
            children: [

              Icon(
                Iconsax.flash,
                color: AppColors.primaryColor,
              ),

              SizedBox(width: 10.w),

              Text(
                "Quick Actions",
                style: AppTextStyles.titleMedium,
              ),
            ],
          ),

          SizedBox(height: 24.h),

          /// First Row
          Row(
            children: [

              Expanded(
                child: _actionButton(
                  title: "Call",
                  icon: Iconsax.call,
                  color: Colors.green,
                  onTap: onCallCustomer,
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: _actionButton(
                  title: "Chat",
                  icon: Iconsax.message,
                  color: Colors.blue,
                  onTap: onChatCustomer,
                ),
              ),
            ],
          ),

          SizedBox(height: 14.h),

          /// Second Row
          Row(
            children: [

              Expanded(
                child: _actionButton(
                  title: "Assign Rider",
                  icon: Iconsax.truck_fast,
                  color: Colors.orange,
                  onTap: onAssignRider,
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: _actionButton(
                  title: "Invoice",
                  icon: Iconsax.document_download,
                  color: Colors.deepPurple,
                  onTap: onDownloadInvoice,
                ),
              ),
            ],
          ),

          SizedBox(height: 14.h),

          /// Third Row
          Row(
            children: [

              Expanded(
                child: _actionButton(
                  title: "Print",
                  icon: Iconsax.printer,
                  color: Colors.teal,
                  onTap: onPrintInvoice,
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: _actionButton(
                  title: "Refund",
                  icon: Iconsax.money_send,
                  color: Colors.redAccent,
                  onTap: onRefundOrder,
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          SizedBox(
            width: double.infinity,
            height: 55.h,
            child: ElevatedButton.icon(
              onPressed: onCancelOrder,
              icon: const Icon(Iconsax.close_circle),
              label: const Text("Cancel Order"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
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
    );
  }

  Widget _actionButton({
    required String title,
    required IconData icon,
    required Color color,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(.08),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          children: [

            CircleAvatar(
              radius: 22.r,
              backgroundColor: color,
              child: Icon(
                icon,
                color: Colors.white,
                size: 20.sp,
              ),
            ),

            SizedBox(height: 10.h),

            Text(
              title,
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}