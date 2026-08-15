import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class ProductBasicInfoWidget extends StatelessWidget {
  final TextEditingController productNameController;
  final TextEditingController skuController;

  final String? selectedBrand;
  final ValueChanged<String?> onBrandChanged;

  const ProductBasicInfoWidget({
    super.key,
    required this.productNameController,
    required this.skuController,
    required this.selectedBrand,
    required this.onBrandChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _card(
      title: 'Basic Information',
      subtitle: 'Add the basic details of your product.',
      icon: Icons.info_outline,
      child: Column(
        children: [
          _field(
            controller: productNameController,
            label: 'Product Name *',
            hint: 'Enter product name',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Product name is required';
              }
              return null;
            },
          ),

          SizedBox(height: 12.h),

          Container(
            padding: EdgeInsets.all(11.w),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(.07),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.orange,
                  size: 18.sp,
                ),
                SizedBox(width: 7.w),
                Expanded(
                  child: Text(
                    'For better search results, use English product names.',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.orange.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 14.h),

          _field(
            controller: skuController,
            label: 'SKU',
            hint: 'Example: CAM-001',
          ),

          SizedBox(height: 12.h),

          _dropdown(
            label: 'Brand',
            hint: 'Select brand',
            value: selectedBrand,
            items: const [
              'Sony',
              'Canon',
              'Nikon',
              'Samsung',
              'Apple',
              'Other',
            ],
            onChanged: onBrandChanged,
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
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.025),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          _header(title, subtitle, icon),
          SizedBox(height: 18.h),
          child,
        ],
      ),
    );
  }

  Widget _header(
      String title,
      String subtitle,
      IconData icon,
      ) {
    return Row(
      children: [
        Container(
          width: 38.w,
          height: 38.w,
          decoration: BoxDecoration(
            color:
            AppColors.primaryColor.withOpacity(.10),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
            size: 20.sp,
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
                style:
                AppTextStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 2.h),
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
      ],
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: _decoration(
        label: label,
        hint: hint,
      ),
    );
  }

  Widget _dropdown({
    required String label,
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      decoration: _decoration(
        label: label,
        hint: hint,
      ),
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }

  InputDecoration _decoration({
    required String label,
    required String hint,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: const Color(0xffF8F9FB),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 14.h,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 1.3,
        ),
      ),
    );
  }
}