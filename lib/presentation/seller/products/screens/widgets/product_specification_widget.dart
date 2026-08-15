import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class ProductSpecificationWidget
    extends StatelessWidget {
  final String? selectedBrand;
  final String? selectedResolution;

  final ValueChanged<String?> onBrandChanged;
  final ValueChanged<String?> onResolutionChanged;

  const ProductSpecificationWidget({
    super.key,
    required this.selectedBrand,
    required this.selectedResolution,
    required this.onBrandChanged,
    required this.onResolutionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _card(
      title: 'Product Specifications',
      subtitle:
      'Add important specifications of your product.',
      icon: Icons.settings_outlined,
      child: Column(
        children: [

          _dropdown(
            label: 'Brand *',
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

          SizedBox(height: 12.h),

          _dropdown(
            label: 'Video Capture Resolution',
            hint: 'Select resolution',
            value: selectedResolution,
            items: const [
              '720p',
              '1080p',
              '2K',
              '4K',
              '8K',
            ],
            onChanged: onResolutionChanged,
          ),

          SizedBox(height: 5.h),

          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 18,
              ),
              label: const Text('Show More'),
              style: TextButton.styleFrom(
                foregroundColor:
                AppColors.primaryColor,
              ),
            ),
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
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: const Color(0xffF8F9FB),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 4.h,
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
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}