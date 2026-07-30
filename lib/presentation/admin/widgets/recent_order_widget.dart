import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';



class RecentOrdersWidget extends StatelessWidget {
  const RecentOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [

      {
        "id":"#ORD-1001",
        "buyer":"Ali Ahmed",
        "amount":"\$120",
        "status":"Completed",
        "image":"https://i.pravatar.cc/300?img=11",
      },

      {
        "id":"#ORD-1002",
        "buyer":"Sarah Khan",
        "amount":"\$250",
        "status":"Pending",
        "image":"https://i.pravatar.cc/300?img=5",
      },

      {
        "id":"#ORD-1003",
        "buyer":"John Smith",
        "amount":"\$90",
        "status":"Cancelled",
        "image":"https://i.pravatar.cc/300?img=15",
      },
      {
        "id":"#ORD-1004",
        "buyer":"Emma Watson",
        "amount":"\$430",
        "status":"Completed",
        "image":"https://i.pravatar.cc/300?img=21",
      },
    ];

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
            offset: const Offset(0,4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Orders",
                style: AppTextStyles.titleLarge,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 15.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orders.length,
            separatorBuilder: (_,__) => Divider(height:25.h),
            itemBuilder: (_,index){
              final order = orders[index];
              return Row(
                children: [
                  CircleAvatar(
                    radius:24.r,
                    backgroundImage: NetworkImage(order["image"]!),
                  ),
                  SizedBox(width:15.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order["buyer"]!,
                          style: AppTextStyles.titleMedium,
                        ),
                        SizedBox(height:4.h),
                        Text(
                          order["id"]!,
                          style: AppTextStyles.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        order["amount"]!,
                        style: AppTextStyles.titleMedium,
                      ),
                      SizedBox(height:6.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:10.w, vertical:5.h,),
                        decoration: BoxDecoration(
                          color: _statusColor(order["status"]!).withOpacity(.12),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          order["status"]!,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: _statusColor(order["status"]!),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Color _statusColor(String status){

    switch(status){
      case "Completed":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      case "Cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}