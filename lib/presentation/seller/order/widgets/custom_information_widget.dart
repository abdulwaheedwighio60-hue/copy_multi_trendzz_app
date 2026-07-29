import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class CustomerInformationWidget extends StatelessWidget {
  final String customerId;
  final String customerName;
  final String customerEmail;
  final String customerPhone;
  final String customerAddress;
  final String customerImage;

  final VoidCallback? onCall;
  final VoidCallback? onChat;

  const CustomerInformationWidget({
    super.key,
    this.customerId = "CUS-10025",
    this.customerName = "John Smith",
    this.customerEmail = "johnsmith@gmail.com",
    this.customerPhone = "+92 300 1234567",
    this.customerAddress = "Gulshan-e-Iqbal, Karachi, Pakistan",
    this.customerImage = "https://i.pravatar.cc/300",
    this.onCall,
    this.onChat,
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

          /// Heading
          Row(
            children: [
              Icon(
                Iconsax.profile_2user,
                color: AppColors.primaryColor,
              ),

              SizedBox(width: 10.w),

              Text(
                "Customer Information",
                style: AppTextStyles.titleMedium,
              ),
            ],
          ),

          SizedBox(height: 20.h),

          /// Profile
          Row(
            children: [

              CircleAvatar(
                radius: 34.r,
                backgroundImage: NetworkImage(customerImage),
              ),

              SizedBox(width: 15.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      customerName,
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5.h),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(.08),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        customerId,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              IconButton(
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(text: customerId),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Customer ID Copied"),
                    ),
                  );
                },
                icon: const Icon(Iconsax.copy),
              ),
            ],
          ),

          SizedBox(height: 22.h),

          _infoTile(
            Iconsax.sms,
            "Email",
            customerEmail,
          ),

          SizedBox(height: 14.h),

          _infoTile(
            Iconsax.call,
            "Phone",
            customerPhone,
          ),

          SizedBox(height: 14.h),

          _infoTile(
            Iconsax.location,
            "Address",
            customerAddress,
          ),

          SizedBox(height: 22.h),

          /// Action Buttons
          Row(
            children: [

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onCall,
                  icon: const Icon(Iconsax.call),
                  label: const Text("Call"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: Size(
                      double.infinity,
                      50.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(14.r),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onChat,
                  icon: const Icon(Iconsax.message),
                  label: const Text("Chat"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    minimumSize: Size(
                      double.infinity,
                      50.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(14.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoTile(
      IconData icon,
      String title,
      String value,
      ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CircleAvatar(
          radius: 18.r,
          backgroundColor:
          AppColors.primaryColor.withOpacity(.08),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
            size: 18.sp,
          ),
        ),

        SizedBox(width: 12.w),

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