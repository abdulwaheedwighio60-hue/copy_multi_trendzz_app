import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';


class ProductStatusWidget extends StatefulWidget {
  const ProductStatusWidget({super.key});

  @override
  State<ProductStatusWidget> createState() =>
      _ProductStatusWidgetState();
}

class _ProductStatusWidgetState
    extends State<ProductStatusWidget> {

  String selectedStatus = "Active";

  bool featured = false;
  bool allowReviews = true;
  bool visible = true;

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: EdgeInsets.all(18.w),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(20.r),

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

          /// Heading

          Text(
            "Product Status",
            style: AppTextStyles.titleMedium,
          ),

          SizedBox(height: 5.h),

          Text(
            "Manage publishing and visibility settings.",
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 25.h),

          /// Status

          Text(
            "Publishing Status",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 10.h),

          DropdownButtonFormField<String>(

            value: selectedStatus,

            decoration: InputDecoration(

              filled: true,

              fillColor: Colors.grey.shade50,

              border: OutlineInputBorder(

                borderRadius:
                BorderRadius.circular(14.r),

                borderSide: BorderSide.none,

              ),
            ),

            items: const [

              DropdownMenuItem(
                value: "Active",
                child: Text("Active"),
              ),

              DropdownMenuItem(
                value: "Draft",
                child: Text("Draft"),
              ),

              DropdownMenuItem(
                value: "Archived",
                child: Text("Archived"),
              ),

            ],

            onChanged: (value){

              setState(() {

                selectedStatus=value!;

              });

            },
          ),

          SizedBox(height: 25.h),

          /// Featured Product

          _switchTile(

            title: "Featured Product",

            subtitle:
            "Show this product in featured products.",

            value: featured,

            onChanged: (value){

              setState(() {

                featured=value;

              });

            },
          ),

          SizedBox(height: 12.h),

          /// Visibility

          _switchTile(

            title: "Public Visibility",

            subtitle:
            "Visible to customers in your store.",

            value: visible,

            onChanged: (value){

              setState(() {

                visible=value;

              });

            },
          ),

          SizedBox(height: 12.h),

          /// Reviews

          _switchTile(

            title: "Allow Reviews",

            subtitle:
            "Customers can submit ratings and reviews.",

            value: allowReviews,

            onChanged: (value){

              setState(() {

                allowReviews=value;

              });

            },
          ),

          SizedBox(height: 25.h),

          /// Publish Date

          Text(
            "Schedule Publish",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 10.h),

          InkWell(

            onTap: (){

              // showDatePicker()

            },

            borderRadius: BorderRadius.circular(14.r),

            child: Container(

              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 16.h,
              ),

              decoration: BoxDecoration(

                color: Colors.grey.shade50,

                borderRadius:
                BorderRadius.circular(14.r),

              ),

              child: Row(

                children: [

                  Icon(
                    Iconsax.calendar,
                    color: AppColors.primaryColor,
                  ),

                  SizedBox(width: 12.w),

                  Expanded(

                    child: Text(
                      "Select Publish Date",
                      style: AppTextStyles.bodyMedium,
                    ),

                  ),

                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.sp,
                  ),

                ],
              ),
            ),
          ),

          SizedBox(height: 25.h),

          /// Preview Card

          Container(

            padding: EdgeInsets.all(16.w),

            decoration: BoxDecoration(

              color: AppColors.primaryColor
                  .withOpacity(.08),

              borderRadius:
              BorderRadius.circular(15.r),

            ),

            child: Row(

              children: [

                CircleAvatar(

                  radius: 24.r,

                  backgroundColor:
                  AppColors.primaryColor,

                  child: Icon(
                    Iconsax.eye,
                    color: Colors.white,
                  ),

                ),

                SizedBox(width: 14.w),

                Expanded(

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(
                        "Ready to Publish",
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        "Review your product information before publishing.",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey,
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _switchTile({

    required String title,

    required String subtitle,

    required bool value,

    required ValueChanged<bool> onChanged,

  }){

    return Container(

      padding: EdgeInsets.all(15.w),

      decoration: BoxDecoration(

        color: Colors.grey.shade50,

        borderRadius:
        BorderRadius.circular(14.r),

      ),

      child: Row(

        children: [

          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(

                  title,

                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),

                ),

                SizedBox(height:4.h),

                Text(

                  subtitle,

                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.grey,
                  ),

                ),

              ],
            ),
          ),

          Switch(

            value: value,

            activeColor: AppColors.primaryColor,

            onChanged: onChanged,

          ),

        ],
      ),
    );
  }
}