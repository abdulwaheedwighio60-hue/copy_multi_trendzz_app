import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';


class ProductBasicInfoWidget extends StatelessWidget {
  const ProductBasicInfoWidget({super.key});

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
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Heading
          Text(
            "Basic Information",
            style: AppTextStyles.titleMedium,
          ),

          SizedBox(height: 5.h),

          Text(
            "Enter your product details.",
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 22.h),

          /// Product Name
          Text(
            "Product Name",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          CustomTextFormFieldWidget(
            hintText: "Enter product name",
            prefixIcon: Icon(
              Iconsax.box,
              color: AppColors.primaryColor,
            ),
          ),

          SizedBox(height: 18.h),

          /// SKU
          Text(
            "Product SKU",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          CustomTextFormFieldWidget(
            hintText: "e.g. NK-1001",
            prefixIcon: Icon(
              Iconsax.barcode,
              color: AppColors.primaryColor,
            ),
          ),

          SizedBox(height: 18.h),

          /// Short Description
          Text(
            "Short Description",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          TextFormField(
            maxLines: 2,
            decoration: InputDecoration(
              hintText: "Write a short description",
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          SizedBox(height: 18.h),

          /// Full Description
          Text(
            "Full Description",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Write detailed product description...",
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          SizedBox(height: 20.h),

          /// Category
          Text(
            "Category",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide.none,
              ),
            ),
            hint: const Text("Select Category"),
            items: const [

              DropdownMenuItem(
                value: "Fashion",
                child: Text("Fashion"),
              ),

              DropdownMenuItem(
                value: "Electronics",
                child: Text("Electronics"),
              ),

              DropdownMenuItem(
                value: "Beauty",
                child: Text("Beauty"),
              ),

              DropdownMenuItem(
                value: "Sports",
                child: Text("Sports"),
              ),
            ],
            onChanged: (value) {},
          ),

          SizedBox(height: 20.h),

          /// Brand
          Text(
            "Brand",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide.none,
              ),
            ),
            hint: const Text("Select Brand"),
            items: const [

              DropdownMenuItem(
                value: "Nike",
                child: Text("Nike"),
              ),

              DropdownMenuItem(
                value: "Apple",
                child: Text("Apple"),
              ),

              DropdownMenuItem(
                value: "Samsung",
                child: Text("Samsung"),
              ),

              DropdownMenuItem(
                value: "Adidas",
                child: Text("Adidas"),
              ),
            ],
            onChanged: (value) {},
          ),

          SizedBox(height: 20.h),

          /// Product Condition
          Text(
            "Product Condition",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 12.h),

          Wrap(
            spacing: 10.w,
            children: [

              ChoiceChip(
                label: const Text("New"),
                selected: true,
                selectedColor: AppColors.primaryColor,
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
                onSelected: (value) {},
              ),

              ChoiceChip(
                label: const Text("Used"),
                selected: false,
                onSelected: (value) {},
              ),

              ChoiceChip(
                label: const Text("Refurbished"),
                selected: false,
                onSelected: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}