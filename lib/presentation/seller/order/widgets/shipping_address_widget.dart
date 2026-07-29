import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class ShippingAddressWidget extends StatelessWidget {
  final String recipientName;
  final String phoneNumber;
  final String address;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final String deliveryNote;

  final VoidCallback? onOpenMap;

  const ShippingAddressWidget({
    super.key,
    this.recipientName = "John Smith",
    this.phoneNumber = "+92 300 1234567",
    this.address = "House #15, Street 10, Gulshan-e-Iqbal",
    this.city = "Karachi",
    this.state = "Sindh",
    this.country = "Pakistan",
    this.postalCode = "75300",
    this.deliveryNote =
    "Please call before delivery.",
    this.onOpenMap,
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
                Iconsax.location,
                color: AppColors.primaryColor,
              ),

              SizedBox(width: 10.w),

              Text(
                "Shipping Address",
                style: AppTextStyles.titleMedium,
              ),
            ],
          ),

          SizedBox(height: 22.h),

          /// Recipient
          Row(
            children: [

              CircleAvatar(
                radius: 24.r,
                backgroundColor:
                AppColors.primaryColor.withOpacity(.1),
                child: Icon(
                  Iconsax.profile_circle,
                  color: AppColors.primaryColor,
                ),
              ),

              SizedBox(width: 14.w),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      recipientName,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 3.h),

                    Text(
                      phoneNumber,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 22.h),

          _addressTile(
            Iconsax.location,
            "Street Address",
            address,
          ),

          SizedBox(height: 14.h),

          Row(
            children: [

              Expanded(
                child: _smallInfoCard(
                  "City",
                  city,
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: _smallInfoCard(
                  "State",
                  state,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          Row(
            children: [

              Expanded(
                child: _smallInfoCard(
                  "Country",
                  country,
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: _smallInfoCard(
                  "ZIP Code",
                  postalCode,
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(.08),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Icon(
                  Iconsax.note,
                  color: Colors.orange,
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Delivery Instructions",
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        deliveryNote,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 22.h),

          /// Buttons
          Row(
            children: [

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {

                    Clipboard.setData(
                      ClipboardData(
                        text:
                        "$address, $city, $state, $country",
                      ),
                    );

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content:
                        Text("Address Copied"),
                      ),
                    );
                  },
                  icon: const Icon(Iconsax.copy),
                  label: const Text("Copy"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor:
                    AppColors.primaryColor,
                    minimumSize:
                    Size(double.infinity, 50.h),
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
                  onPressed: onOpenMap,
                  icon: const Icon(Iconsax.map),
                  label: const Text("Open Map"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    minimumSize:
                    Size(double.infinity, 50.h),
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

  Widget _addressTile(
      IconData icon,
      String title,
      String value,
      ) {
    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        CircleAvatar(
          radius: 18.r,
          backgroundColor:
          AppColors.primaryColor.withOpacity(.08),
          child: Icon(
            icon,
            size: 18.sp,
            color: AppColors.primaryColor,
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

              SizedBox(height: 4.h),

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

  Widget _smallInfoCard(
      String title,
      String value,
      ) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [

          Text(
            title,
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 6.h),

          Text(
            value,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}