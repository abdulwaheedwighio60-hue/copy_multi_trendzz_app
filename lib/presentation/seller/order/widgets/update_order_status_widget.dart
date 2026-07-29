import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class UpdateOrderStatusWidget extends StatefulWidget {
  final String currentStatus;
  final VoidCallback? onUpdate;

  const UpdateOrderStatusWidget({
    super.key,
    this.currentStatus = "Shipped",
    this.onUpdate,
  });

  @override
  State<UpdateOrderStatusWidget> createState() =>
      _UpdateOrderStatusWidgetState();
}

class _UpdateOrderStatusWidgetState
    extends State<UpdateOrderStatusWidget> {

  late String selectedStatus;

  final List<String> statusList = [

    "Pending",

    "Confirmed",

    "Packed",

    "Shipped",

    "Out For Delivery",

    "Delivered",

    "Cancelled",

  ];

  @override
  void initState() {
    super.initState();

    selectedStatus = widget.currentStatus;
  }

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

            offset: const Offset(0,4),

          )

        ],
      ),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          /// Heading

          Row(

            children: [

              Icon(
                Iconsax.refresh,
                color: AppColors.primaryColor,
              ),

              SizedBox(width:10.w),

              Text(
                "Update Order Status",
                style: AppTextStyles.titleMedium,
              ),

            ],
          ),

          SizedBox(height:22.h),

          Text(
            "Current Status",
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey,
            ),
          ),

          SizedBox(height:8.h),

          Container(

            width: double.infinity,

            padding: EdgeInsets.symmetric(
              horizontal:16.w,
            ),

            decoration: BoxDecoration(

              color: Colors.grey.shade100,

              borderRadius: BorderRadius.circular(14.r),

            ),

            child: DropdownButtonHideUnderline(

              child: DropdownButton<String>(

                value: selectedStatus,

                isExpanded: true,

                borderRadius:
                BorderRadius.circular(12.r),

                items: statusList.map((status){

                  return DropdownMenuItem(

                    value: status,

                    child: Row(

                      children: [

                        Icon(
                          _icon(status),
                          color: _color(status),
                          size:18.sp,
                        ),

                        SizedBox(width:10.w),

                        Text(status),

                      ],
                    ),
                  );

                }).toList(),

                onChanged: (value){

                  if(value==null) return;

                  setState(() {

                    selectedStatus=value;

                  });

                },

              ),
            ),
          ),

          SizedBox(height:22.h),

          Container(

            padding: EdgeInsets.all(14.w),

            decoration: BoxDecoration(

              color: _color(selectedStatus).withOpacity(.08),

              borderRadius: BorderRadius.circular(14.r),

            ),

            child: Row(

              children: [

                Icon(
                  _icon(selectedStatus),
                  color: _color(selectedStatus),
                ),

                SizedBox(width:10.w),

                Expanded(

                  child: Text(

                    "Selected Status : $selectedStatus",

                    style: AppTextStyles.bodyMedium.copyWith(

                      color: _color(selectedStatus),

                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height:24.h),

          SizedBox(

            width: double.infinity,

            height: 54.h,

            child: ElevatedButton.icon(

              onPressed: widget.onUpdate,

              icon: const Icon(Iconsax.tick_circle),

              label: const Text("Update Status"),

              style: ElevatedButton.styleFrom(

                backgroundColor:
                AppColors.primaryColor,

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

  IconData _icon(String status){

    switch(status){

      case "Pending":
        return Iconsax.clock;

      case "Confirmed":
        return Iconsax.tick_circle;

      case "Packed":
        return Iconsax.box;

      case "Shipped":
        return Iconsax.truck_fast;

      case "Out For Delivery":
        return Iconsax.location;

      case "Delivered":
        return Iconsax.verify;

      case "Cancelled":
        return Iconsax.close_circle;

      default:
        return Iconsax.box;

    }
  }

  Color _color(String status){

    switch(status){

      case "Pending":
        return Colors.orange;

      case "Confirmed":
        return Colors.blue;

      case "Packed":
        return Colors.deepPurple;

      case "Shipped":
        return Colors.indigo;

      case "Out For Delivery":
        return Colors.teal;

      case "Delivered":
        return Colors.green;

      case "Cancelled":
        return Colors.red;

      default:
        return AppColors.primaryColor;

    }
  }
}