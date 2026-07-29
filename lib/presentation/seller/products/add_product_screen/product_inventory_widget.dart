import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widgets/custom_text_form_field_widget.dart';

class ProductInventoryWidget extends StatefulWidget {
  const ProductInventoryWidget({super.key});

  @override
  State<ProductInventoryWidget> createState() =>
      _ProductInventoryWidgetState();
}

class _ProductInventoryWidgetState
    extends State<ProductInventoryWidget> {

  bool trackInventory = true;

  bool inStock = true;

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
            "Inventory",
            style: AppTextStyles.titleMedium,
          ),

          SizedBox(height: 5.h),

          Text(
            "Manage product stock and inventory.",
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 25.h),

          /// Stock Quantity
          Text(
            "Stock Quantity",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          CustomTextFormFieldWidget(
            hintText: "Enter quantity",
            keyboardType: TextInputType.number,
            prefixIcon: Icon(
              Iconsax.box,
              color: AppColors.primaryColor,
            ),
          ),

          SizedBox(height: 18.h),

          /// Minimum Stock Alert
          Text(
            "Low Stock Alert",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          CustomTextFormFieldWidget(
            hintText: "Example: 10",
            keyboardType: TextInputType.number,
            prefixIcon: Icon(
              Iconsax.warning_2,
              color: Colors.orange,
            ),
          ),

          SizedBox(height: 18.h),

          /// Barcode
          Text(
            "Barcode / SKU",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          CustomTextFormFieldWidget(
            hintText: "Enter barcode",
            prefixIcon: Icon(
              Iconsax.barcode,
              color: AppColors.primaryColor,
            ),
          ),

          SizedBox(height: 18.h),

          /// Warehouse
          Text(
            "Warehouse Location",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          CustomTextFormFieldWidget(
            hintText: "Warehouse A",
            prefixIcon: Icon(
              Iconsax.location,
              color: AppColors.primaryColor,
            ),
          ),

          SizedBox(height: 25.h),

          /// Track Inventory
          Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Track Inventory",
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        "Automatically track product stock.",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                Switch(
                  value: trackInventory,
                  activeColor: AppColors.primaryColor,
                  onChanged: (value) {
                    setState(() {
                      trackInventory = value;
                    });
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: 18.h),

          /// Stock Status
          Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Stock Status",
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        inStock
                            ? "Product is available"
                            : "Product is out of stock",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                Switch(
                  value: inStock,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      inStock = value;
                    });
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: 22.h),

          /// Inventory Summary
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.08),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [

                _summaryRow(
                  "Current Stock",
                  "245 Units",
                ),

                SizedBox(height: 10.h),

                _summaryRow(
                  "Reserved",
                  "18 Units",
                ),

                SizedBox(height: 10.h),

                _summaryRow(
                  "Available",
                  "227 Units",
                  isHighlight: true,
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
        bool isHighlight = false,
      }) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [

        Text(title),

        Text(
          value,
          style: TextStyle(
            color: isHighlight
                ? Colors.green
                : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}