import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_trendzz/core/constants/app_colors.dart';
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
    return _card(
      title: 'Price, Stock & Variants',
      subtitle:
      'Set your product pricing information.',
      icon: Icons.sell_outlined,
      child: Column(
        children: [

          Row(
            children: [
              Expanded(
                child: _field(
                  controller: sellingPriceController,
                  label: 'Selling Price',
                  hint: '0.00',
                  prefix: 'Rs ',
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: _field(
                  controller: discountPriceController,
                  label: 'Discount',
                  hint: '0.00',
                  prefix: 'Rs ',
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          Row(
            children: [
              Expanded(
                child: _field(
                  controller: costPriceController,
                  label: 'Cost Price',
                  hint: '0.00',
                  prefix: 'Rs ',
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: _field(
                  controller: taxController,
                  label: 'Tax',
                  hint: '0',
                  suffix: '%',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _card({
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38.w,
                height: 38.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor
                      .withOpacity(.10),
                  borderRadius:
                  BorderRadius.circular(10.r),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.titleMedium
                          .copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodySmall
                          .copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          child,
        ],
      ),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? prefix,
    String? suffix,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType:
      const TextInputType.numberWithOptions(
        decimal: true,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixText: prefix,
        suffixText: suffix,
        filled: true,
        fillColor: const Color(0xffF8F9FB),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 14.h,
        ),
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1.3,
          ),
        ),
      ),
    );
  }
}