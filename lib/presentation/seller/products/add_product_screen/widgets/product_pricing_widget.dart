import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';


class ProductPricingWidget extends StatelessWidget {
  const ProductPricingWidget({super.key});

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
            "Pricing",
            style: AppTextStyles.titleMedium,
          ),

          SizedBox(height: 5.h),

          Text(
            "Configure your product pricing.",
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 22.h),

          /// Regular Price
          Text(
            "Regular Price",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          CustomTextFormFieldWidget(
            hintText: "Enter regular price",
            keyboardType: TextInputType.number,
            prefixIcon: Icon(
              Iconsax.wallet_money,
              color: AppColors.primaryColor,
            ),
          ),

          SizedBox(height: 18.h),

          /// Sale Price
          Text(
            "Sale Price",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          CustomTextFormFieldWidget(
            hintText: "Enter sale price",
            keyboardType: TextInputType.number,
            prefixIcon: Icon(
              Iconsax.discount_shape,
              color: AppColors.primaryColor,
            ),
          ),

          SizedBox(height: 18.h),

          /// Discount & Tax
          Row(
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Discount %",
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    CustomTextFormFieldWidget(
                      hintText: "10",
                      keyboardType: TextInputType.number,
                      prefixIcon: Icon(
                        Iconsax.percentage_circle,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 14.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Tax %",
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    CustomTextFormFieldWidget(
                      hintText: "5",
                      keyboardType: TextInputType.number,
                      prefixIcon: Icon(
                        Iconsax.receipt,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 18.h),

          /// Shipping Cost
          Text(
            "Shipping Cost",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          CustomTextFormFieldWidget(
            hintText: "Enter shipping cost",
            keyboardType: TextInputType.number,
            prefixIcon: Icon(
              Iconsax.truck_fast,
              color: AppColors.primaryColor,
            ),
          ),

          SizedBox(height: 25.h),

          /// Pricing Summary
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.08),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [

                _summaryRow(
                  "Regular Price",
                  "\$120.00",
                ),

                SizedBox(height: 10.h),

                _summaryRow(
                  "Sale Price",
                  "\$99.00",
                ),

                SizedBox(height: 10.h),

                _summaryRow(
                  "Discount",
                  "18%",
                ),

                Divider(),

                SizedBox(height: 5.h),

                _summaryRow(
                  "Estimated Profit",
                  "\$82.50",
                  isProfit: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
      String title,
      String value, {
        bool isProfit = false,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Text(
          title,
          style: AppTextStyles.bodyMedium,
        ),

        Text(
          value,
          style: AppTextStyles.bodyLarge.copyWith(
            color: isProfit
                ? Colors.green
                : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}