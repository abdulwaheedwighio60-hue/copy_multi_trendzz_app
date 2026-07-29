import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class CustomerHeaderWidget extends StatelessWidget {
  final ValueChanged<String>? onSearch;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onFilterTap;
  final VoidCallback? onAddCustomerTap;

  const CustomerHeaderWidget({
    super.key,
    this.onSearch,
    this.onNotificationTap,
    this.onFilterTap,
    this.onAddCustomerTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20.w,
        18.h,
        20.w,
        20.h,
      ),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [

            /// Top Row
            Row(
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Customer Management",
                        style: AppTextStyles.headlineMedium.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 5.h),

                      Text(
                        "Manage your customers professionally",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.white70,
                        ),
                      ),

                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.15),
                    borderRadius:
                    BorderRadius.circular(14.r),
                  ),
                  child: IconButton(
                    onPressed: onNotificationTap,
                    icon: const Icon(
                      Iconsax.notification,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 22.h),

            /// Search + Filter
            Row(
              children: [

                Expanded(
                  child: Container(
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(16.r),
                    ),
                    child: TextField(
                      onChanged: onSearch,
                      decoration: const InputDecoration(
                        hintText: "Search customer...",
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                        ),
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                InkWell(
                  onTap: onFilterTap,
                  borderRadius:
                  BorderRadius.circular(16.r),
                  child: Container(
                    width: 55.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(16.r),
                    ),
                    child: const Icon(
                      Iconsax.setting_4,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(height: 20.h),

            /// Add Customer Button
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton.icon(
                onPressed: onAddCustomerTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor:
                  AppColors.primaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(16.r),
                  ),
                ),
                icon: const Icon(Iconsax.add),
                label: const Text(
                  "Add New Customer",
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}