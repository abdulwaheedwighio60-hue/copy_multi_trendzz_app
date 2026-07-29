import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/theme/app_text_style.dart';

class CustomerInfoWidget extends StatelessWidget {
  const CustomerInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Customer Information",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20.h),

          _InfoTile(
            icon: Iconsax.sms,
            title: "Email",
            value: "abdulwaheed@gmail.com",
          ),

          Divider(height: 24.h),

          _InfoTile(
            icon: Iconsax.call,
            title: "Phone",
            value: "+92 300 1234567",
          ),

          Divider(height: 24.h),

          _InfoTile(
            icon: Iconsax.location,
            title: "Address",
            value: "Street 12, Gulshan-e-Iqbal",
          ),

          Divider(height: 24.h),

          _InfoTile(
            icon: Iconsax.building,
            title: "City",
            value: "Karachi",
          ),

          Divider(height: 24.h),

          _InfoTile(
            icon: Iconsax.global,
            title: "Country",
            value: "Pakistan",
          ),

          Divider(height: 24.h),

          _InfoTile(
            icon: Iconsax.calendar,
            title: "Member Since",
            value: "12 January 2025",
          ),

        ],
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          width: 48.w,
          height: 48.w,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Icon(
            icon,
            color: Colors.blue,
            size: 22.sp,
          ),
        ),

        SizedBox(width: 15.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                title,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 4.h),

              Text(
                value,
                style: AppTextStyles.bodyLarge.copyWith(
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