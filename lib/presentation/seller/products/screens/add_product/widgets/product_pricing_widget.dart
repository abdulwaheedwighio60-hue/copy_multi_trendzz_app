import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';


class ProductPricingWidget extends StatelessWidget {
  final TextEditingController sellingPriceController;
  final TextEditingController discountPriceController;
  final TextEditingController costPriceController;
  final TextEditingController taxController;

  const ProductPricingWidget({
    super.key,
    required this.sellingPriceController,
    required this.discountPriceController,
    required this.costPriceController,
    required this.taxController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
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
            "Pricing",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20.h),

          _buildField(
            controller: sellingPriceController,
            label: "Selling Price",
            hint: "\$0.00",
          ),

          SizedBox(height: 16.h),

          _buildField(
            controller: discountPriceController,
            label: "Discount Price",
            hint: "\$0.00",
          ),

          SizedBox(height: 16.h),

          _buildField(
            controller: costPriceController,
            label: "Cost Price",
            hint: "\$0.00",
          ),

          SizedBox(height: 16.h),

          _buildField(
            controller: taxController,
            label: "Tax (%)",
            hint: "0%",
          ),

        ],
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}