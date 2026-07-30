import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            "Inventory",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20.h),

          _textField(
            controller: stockController,
            label: "Stock Quantity",
            hint: "Enter available stock",
          ),

          SizedBox(height: 16.h),

          _textField(
            controller: weightController,
            label: "Weight (kg)",
            hint: "Example: 0.50",
          ),

          SizedBox(height: 20.h),

          Text(
            "Dimensions (cm)",
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 12.h),

          Row(
            children: [

              Expanded(
                child: _textField(
                  controller: lengthController,
                  label: "Length",
                  hint: "0",
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: _textField(
                  controller: widthController,
                  label: "Width",
                  hint: "0",
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: _textField(
                  controller: heightController,
                  label: "Height",
                  hint: "0",
                ),
              ),

            ],
          ),

          SizedBox(height: 20.h),

          SwitchListTile(
            value: isActive,
            onChanged: onStatusChanged,
            activeColor: Colors.green,
            title: const Text("Product Active"),
            subtitle: const Text(
              "Enable to make this product visible to customers.",
            ),
          ),

          Divider(height: 20.h),

          SwitchListTile(
            value: isFeatured,
            onChanged: onFeaturedChanged,
            activeColor: Colors.orange,
            title: const Text("Featured Product"),
            subtitle: const Text(
              "Show this product in the featured products section.",
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField({
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