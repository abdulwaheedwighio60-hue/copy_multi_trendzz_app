import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class ProductInventoryWidget extends StatelessWidget {
  final TextEditingController stockController;
  final TextEditingController weightController;
  final TextEditingController lengthController;
  final TextEditingController widthController;
  final TextEditingController heightController;

  final bool isFeatured;
  final bool isActive;

  final ValueChanged<bool> onFeaturedChanged;
  final ValueChanged<bool> onStatusChanged;

  const ProductInventoryWidget({
    super.key,
    required this.stockController,
    required this.weightController,
    required this.lengthController,
    required this.widthController,
    required this.heightController,
    required this.isFeatured,
    required this.isActive,
    required this.onFeaturedChanged,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _card(
      title: 'Inventory & Shipping',
      subtitle:
      'Manage stock, weight and dimensions.',
      icon: Icons.inventory_2_outlined,
      child: Column(
        children: [

          _field(
            controller: stockController,
            label: 'Stock Quantity',
            hint: 'Enter available stock',
          ),

          SizedBox(height: 12.h),

          _field(
            controller: weightController,
            label: 'Weight',
            hint: 'Example: 0.50',
            suffix: 'kg',
          ),

          SizedBox(height: 18.h),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Dimensions',
              style:
              AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          SizedBox(height: 10.h),

          Row(
            children: [
              Expanded(
                child: _field(
                  controller: lengthController,
                  label: 'Length',
                  hint: '0',
                  suffix: 'cm',
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _field(
                  controller: widthController,
                  label: 'Width',
                  hint: '0',
                  suffix: 'cm',
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _field(
                  controller: heightController,
                  label: 'Height',
                  hint: '0',
                  suffix: 'cm',
                ),
              ),
            ],
          ),

          SizedBox(height: 15.h),

          _switch(
            title: 'Product Active',
            subtitle:
            'Make this product visible to customers.',
            value: isActive,
            onChanged: onStatusChanged,
          ),

          Divider(
            color: Colors.grey.shade200,
          ),

          _switch(
            title: 'Featured Product',
            subtitle:
            'Show this product in featured products.',
            value: isFeatured,
            onChanged: onFeaturedChanged,
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

  Widget _switch({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                  AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  subtitle,
                  style:
                  AppTextStyles.bodySmall.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            activeColor: AppColors.primaryColor,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}