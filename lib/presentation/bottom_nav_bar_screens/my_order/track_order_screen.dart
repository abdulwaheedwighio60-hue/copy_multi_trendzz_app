import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/model/track_order_model.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/my_order/widget/tracking_step_widget.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({
    super.key,
    this.order,
  });

  final TrackOrderModel? order;

  TrackOrderModel get orderData {
    return order ?? TrackOrderModel.dummy();
  }

  @override
  Widget build(BuildContext context) {
    final TrackOrderModel currentOrder = orderData;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leadingWidth: 65.w,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              top: 6.h,
              bottom: 6.h,
            ),
            child: CustomBackButtonWidget(
              onTap: () {
                if (Navigator.canPop(context)) {
                  context.pop();
                }
              },
            ),
          ),
          title: Text(
            'Track Order',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontSize: 17.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(
            20.w,
            14.h,
            20.w,
            30.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOrderSummary(currentOrder),

              SizedBox(height: 22.h),

              _buildDivider(),

              SizedBox(height: 20.h),

              _buildOrderDetails(currentOrder),

              SizedBox(height: 22.h),

              _buildDivider(),

              SizedBox(height: 20.h),

              Text(
                'Order Status',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 18.h),

              _buildTrackingTimeline(currentOrder.statuses),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummary(TrackOrderModel order) {
    return Row(
      children: [
        Container(
          width: 88.w,
          height: 88.w,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: AppColors.borderColor.withOpacity(0.7),
              width: 1.w,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            order.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Iconsax.gallery,
                color: AppColors.textHint,
                size: 30.sp,
              );
            },
          ),
        ),

        SizedBox(width: 14.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.productName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 4.h),

              Text(
                '${order.category} | Qty. : ${order.quantity.toString().padLeft(2, '0')} pcs',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                '\$${order.price.toStringAsFixed(2)}',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOrderDetails(TrackOrderModel order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Details',
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
          ),
        ),

        SizedBox(height: 14.h),

        _buildDetailRow(
          title: 'Expected Delivery Date',
          value: order.expectedDeliveryDate,
        ),

        SizedBox(height: 12.h),

        _buildDetailRow(
          title: 'Tracking ID',
          value: order.trackingId,
        ),
      ],
    );
  }

  Widget _buildDetailRow({
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        SizedBox(width: 12.w),

        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textPrimary,
            fontSize: 13.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildTrackingTimeline(List<OrderStatusModel> statuses) {
    return ListView.builder(
      itemCount: statuses.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final OrderStatusModel status = statuses[index];
        final bool isFirst = index == 0;
        final bool isLast = index == statuses.length - 1;

        return TrackingStepWidget(
          status: status,
          isFirst: isFirst,
          isLast: isLast,
        );
      },
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: AppColors.borderColor.withOpacity(0.65),
      thickness: 1.w,
      height: 1.h,
    );
  }
}