import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';


class RecentUsersWidget extends StatelessWidget {
  const RecentUsersWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final users = [

      {
        "name": "Ali Ahmed",
        "role": "Buyer",
        "status": "Active",
        "image": "https://i.pravatar.cc/300?img=11",
      },

      {
        "name": "Sarah Khan",
        "role": "Seller",
        "status": "Pending",
        "image": "https://i.pravatar.cc/300?img=5",
      },

      {
        "name": "John Smith",
        "role": "Buyer",
        "status": "Blocked",
        "image": "https://i.pravatar.cc/300?img=15",
      },

      {
        "name": "Emma Watson",
        "role": "Seller",
        "status": "Active",
        "image": "https://i.pravatar.cc/300?img=21",
      },

      {
        "name": "Ahmed Raza",
        "role": "Buyer",
        "status": "Active",
        "image": "https://i.pravatar.cc/300?img=18",
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
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Users",
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
              ),
            ],
          ),
          SizedBox(height: 15.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: users.length,
            separatorBuilder: (_, __) => Divider(height: 24.h),
            itemBuilder: (_, index) {
              final user = users[index];
              return Row(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundImage:
                    NetworkImage(user["image"]!),
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user["name"]!,
                          style: AppTextStyles.titleMedium,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          user["role"]!,
                          style: AppTextStyles.bodySmall,
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
                      color: _statusColor(user["status"]!,).withOpacity(.12),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      user["status"]!,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: _statusColor(user["status"]!,),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case "Active":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      case "Blocked":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}