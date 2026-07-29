import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class CustomerCardWidget extends StatelessWidget {
  final String image;
  final String name;
  final String email;
  final String phone;
  final int totalOrders;
  final double totalSpent;
  final bool isPremium;
  final VoidCallback? onTap;

  const CustomerCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
    required this.totalOrders,
    required this.totalSpent,
    required this.isPremium,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
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
        children: [

          Row(
            children: [

              /// Profile Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(
                  image,
                  width: 70.w,
                  height: 70.w,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      width: 70.w,
                      height: 70.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 35.sp,
                      ),
                    );
                  },
                ),
              ),

              SizedBox(width: 15.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [

                        Expanded(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.bodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        if (isPremium)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade100,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                Icon(
                                  Iconsax.crown,
                                  size: 14.sp,
                                  color: Colors.orange,
                                ),

                                SizedBox(width: 4.w),

                                Text(
                                  "Premium",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                              ],
                            ),
                          ),
                      ],
                    ),

                    SizedBox(height: 8.h),

                    Row(
                      children: [

                        Icon(
                          Iconsax.sms,
                          size: 16.sp,
                          color: Colors.grey,
                        ),

                        SizedBox(width: 6.w),

                        Expanded(
                          child: Text(
                            email,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.bodySmall,
                          ),
                        ),

                      ],
                    ),

                    SizedBox(height: 6.h),

                    Row(
                      children: [

                        Icon(
                          Iconsax.call,
                          size: 16.sp,
                          color: Colors.grey,
                        ),

                        SizedBox(width: 6.w),

                        Text(
                          phone,
                          style: AppTextStyles.bodySmall,
                        ),

                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),

          SizedBox(height: 18.h),

          Row(
            children: [

              Expanded(
                child: _InfoItem(
                  title: "Orders",
                  value: totalOrders.toString(),
                  icon: Iconsax.box,
                ),
              ),

              Expanded(
                child: _InfoItem(
                  title: "Spent",
                  value: "\$${totalSpent.toStringAsFixed(0)}",
                  icon: Iconsax.wallet_money,
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
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              icon: const Icon(Iconsax.eye),
              label: const Text("View Details"),
            ),
          ),

        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _InfoItem({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [

          Icon(
            icon,
            color: AppColors.primaryColor,
          ),

          SizedBox(height: 8.h),

          Text(
            value,
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 4.h),

          Text(
            title,
            style: AppTextStyles.bodySmall,
          ),

        ],
      ),
    );
  }
}