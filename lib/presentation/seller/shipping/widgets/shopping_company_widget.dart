import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class ShippingCompanyWidget extends StatelessWidget {
  final String companyName;
  final String logoUrl;
  final String contactNumber;
  final String website;
  final String deliveryTime;
  final double rating;
  final bool isActive;

  const ShippingCompanyWidget({
    super.key,
    required this.companyName,
    required this.logoUrl,
    required this.contactNumber,
    required this.website,
    required this.deliveryTime,
    required this.rating,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Courier Company",
              style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 18.h),

            Row(
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: Image.network(
                    logoUrl,
                    width: 65.w,
                    height: 65.w,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return Container(
                        width: 65.w,
                        height: 65.w,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius:
                          BorderRadius.circular(14.r),
                        ),
                        child: Icon(
                          Icons.local_shipping,
                          color: AppColors.primaryColor,
                          size: 30.sp,
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(width: 16.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        companyName,
                        style: AppTextStyles.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 6.h),

                      Row(
                        children: [

                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18.sp,
                          ),

                          SizedBox(width: 4.w),

                          Text(
                            rating.toString(),
                            style: AppTextStyles.bodyMedium,
                          ),

                        ],
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
                    color: isActive
                        ? Colors.green.withOpacity(.12)
                        : Colors.red.withOpacity(.12),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    isActive ? "Active" : "Inactive",
                    style: AppTextStyles.bodySmall.copyWith(
                      color: isActive
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(height: 20.h),

            _InfoTile(
              icon: Iconsax.call,
              title: "Contact",
              value: contactNumber,
            ),

            SizedBox(height: 14.h),

            _InfoTile(
              icon: Iconsax.global,
              title: "Website",
              value: website,
            ),

            SizedBox(height: 14.h),

            _InfoTile(
              icon: Iconsax.clock,
              title: "Estimated Delivery",
              value: deliveryTime,
            ),

          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Container(
          width: 42.w,
          height: 42.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(.10),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
            size: 20.sp,
          ),
        ),

        SizedBox(width: 14.w),

        Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 3.h),

              Text(
                value,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

            ],
          ),
        ),

      ],
    );
  }
}