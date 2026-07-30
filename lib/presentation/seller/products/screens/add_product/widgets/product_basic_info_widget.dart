import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class ProductBasicInfoWidget extends StatelessWidget {
  final TextEditingController productNameController;
  final TextEditingController brandController;
  final TextEditingController skuController;

  const ProductBasicInfoWidget({
    super.key,
    required this.productNameController,
    required this.brandController,
    required this.skuController,
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
            "Basic Information",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20.h),

          _buildTextField(
            controller: productNameController,
            label: "Product Name",
            hint: "Enter product name",
          ),

          SizedBox(height: 16.h),

          DropdownButtonFormField<String>(
            decoration: _decoration(
              "Category",
            ),
            items: const [

              DropdownMenuItem(
                value: "Electronics",
                child: Text("Electronics"),
              ),

              DropdownMenuItem(
                value: "Fashion",
                child: Text("Fashion"),
              ),

              DropdownMenuItem(
                value: "Footwear",
                child: Text("Footwear"),
              ),

              DropdownMenuItem(
                value: "Home & Kitchen",
                child: Text("Home & Kitchen"),
              ),

              DropdownMenuItem(
                value: "Beauty",
                child: Text("Beauty"),
              ),

            ],
            onChanged: (value) {},
          ),

          SizedBox(height: 16.h),

          _buildTextField(
            controller: brandController,
            label: "Brand",
            hint: "Enter brand name",
          ),

          SizedBox(height: 16.h),

          _buildTextField(
            controller: skuController,
            label: "SKU",
            hint: "Enter SKU",
          ),

        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return TextFormField(
      controller: controller,
      decoration: _decoration(
        label,
        hint,
      ),
    );
  }

  InputDecoration _decoration(
      String label, [
        String? hint,
      ]) {
    return InputDecoration(
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
    );
  }
}