import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class OrderCardWidget extends StatelessWidget {
  final String orderId;
  final String customerName;
  final String customerImage;
  final String orderDate;
  final int totalItems;
  final double totalAmount;
  final String paymentStatus;
  final String orderStatus;

  final VoidCallback? onView;
  final VoidCallback? onCall;
  final VoidCallback? onChat;

  const OrderCardWidget({
    super.key,
    this.orderId = "ORD-10245",
    this.customerName = "John Smith",
    this.customerImage = "https://i.pravatar.cc/300",
    this.orderDate = "29 Jul 2026",
    this.totalItems = 3,
    this.totalAmount = 240,
    this.paymentStatus = "Paid",
    this.orderStatus = "Pending",
    this.onView,
    this.onCall,
    this.onChat,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        context.push(AppRoutes.orderDetailScreen);
      },
      child: Container(

        margin: EdgeInsets.only(bottom: 16.h),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius: BorderRadius.circular(18.r),

          boxShadow: [

            BoxShadow(

              color: Colors.black.withOpacity(.05),

              blurRadius: 10,

              offset: const Offset(0,4),

            )

          ],
        ),

        child: Column(

          children: [

            Padding(

              padding: EdgeInsets.all(16.w),

              child: Column(

                children: [

                  Row(

                    children: [

                      CircleAvatar(

                        radius: 26.r,

                        backgroundImage:
                        NetworkImage(customerImage),

                      ),

                      SizedBox(width:12.w),

                      Expanded(

                        child: Column(

                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            Text(

                              customerName,

                              style: AppTextStyles.bodyLarge.copyWith(
                                fontWeight: FontWeight.bold,
                              ),

                            ),

                            SizedBox(height:4.h),

                            Text(

                              "Order #$orderId",

                              style: AppTextStyles.bodySmall.copyWith(
                                color: Colors.grey,
                              ),

                            ),

                          ],
                        ),
                      ),

                      _statusBadge(orderStatus),

                    ],
                  ),

                  SizedBox(height:16.h),

                  Row(

                    children: [

                      Icon(
                        Iconsax.calendar,
                        size:18.sp,
                        color: Colors.grey,
                      ),

                      SizedBox(width:6.w),

                      Text(orderDate),

                    ],
                  ),

                  SizedBox(height:14.h),

                  Row(

                    children: [

                      Expanded(
                        child: _infoTile(
                          Iconsax.box,
                          "$totalItems Items",
                        ),
                      ),

                      Expanded(
                        child: _infoTile(
                          Iconsax.wallet_money,
                          "\$${totalAmount.toStringAsFixed(2)}",
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height:14.h),

                  Row(

                    children: [

                      Icon(
                        paymentStatus=="Paid"
                            ? Iconsax.tick_circle
                            : Iconsax.close_circle,
                        color: paymentStatus=="Paid"
                            ? Colors.green
                            : Colors.red,
                        size:18.sp,
                      ),

                      SizedBox(width:6.w),

                      Text(
                        paymentStatus,
                        style: TextStyle(
                          color: paymentStatus=="Paid"
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),

            Divider(height:1),

            IntrinsicHeight(

              child: Row(

                children: [

                  _actionButton(
                    Iconsax.call,
                    "Call",
                    onCall,
                  ),

                  VerticalDivider(width:1),

                  _actionButton(
                    Iconsax.message,
                    "Chat",
                    onChat,
                  ),

                  VerticalDivider(width:1),

                  _actionButton(
                    Iconsax.eye,
                    "View",
                    onView,
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _statusBadge(String status){

    Color color = Colors.orange;

    if(status=="Delivered"){
      color=Colors.green;
    }else if(status=="Cancelled"){
      color=Colors.red;
    }else if(status=="Processing"){
      color=Colors.blue;
    }else if(status=="Shipped"){
      color=Colors.purple;
    }

    return Container(

      padding: EdgeInsets.symmetric(
        horizontal:10.w,
        vertical:6.h,
      ),

      decoration: BoxDecoration(

        color: color.withOpacity(.12),

        borderRadius: BorderRadius.circular(30.r),

      ),

      child: Text(

        status,

        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 11.sp,
        ),

      ),
    );
  }

  Widget _infoTile(
      IconData icon,
      String value,
      ){

    return Row(

      children: [

        Icon(
          icon,
          color: AppColors.primaryColor,
          size:18.sp,
        ),

        SizedBox(width:6.w),

        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
          ),
        ),

      ],
    );
  }

  Widget _actionButton(
      IconData icon,
      String title,
      VoidCallback? onTap,
      ){

    return Expanded(

      child: InkWell(

        onTap: onTap,

        child: Padding(

          padding: EdgeInsets.symmetric(
            vertical:14.h,
          ),

          child: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              Icon(
                icon,
                color: AppColors.primaryColor,
                size:20.sp,
              ),

              SizedBox(height:6.h),

              Text(
                title,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}