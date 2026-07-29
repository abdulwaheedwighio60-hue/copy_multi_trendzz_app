import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';


class ProductVariantWidget extends StatefulWidget {
  const ProductVariantWidget({super.key});

  @override
  State<ProductVariantWidget> createState() =>
      _ProductVariantWidgetState();
}

class _ProductVariantWidgetState
    extends State<ProductVariantWidget> {

  final List<String> colors = [
    "Red",
    "Blue",
    "Black",
    "White",
    "Green"
  ];

  final List<String> sizes = [
    "XS",
    "S",
    "M",
    "L",
    "XL"
  ];

  int selectedColor = 0;
  int selectedSize = 2;

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
            "Product Variants",
            style: AppTextStyles.titleMedium,
          ),

          SizedBox(height: 5.h),

          Text(
            "Create different colors and sizes.",
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 25.h),

          /// Colors

          Text(
            "Available Colors",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 12.h),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              colors.length,
                  (index) {

                bool selected = selectedColor == index;

                return ChoiceChip(

                  label: Text(colors[index]),

                  selected: selected,

                  selectedColor: AppColors.primaryColor,

                  labelStyle: TextStyle(
                    color: selected
                        ? Colors.white
                        : Colors.black,
                  ),

                  onSelected: (_) {

                    setState(() {

                      selectedColor = index;

                    });

                  },
                );
              },
            ),
          ),

          SizedBox(height: 25.h),

          /// Sizes

          Text(
            "Available Sizes",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 12.h),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              sizes.length,
                  (index) {

                bool selected = selectedSize == index;

                return ChoiceChip(

                  label: Text(sizes[index]),

                  selected: selected,

                  selectedColor: AppColors.primaryColor,

                  labelStyle: TextStyle(
                    color: selected
                        ? Colors.white
                        : Colors.black,
                  ),

                  onSelected: (_) {

                    setState(() {

                      selectedSize = index;

                    });

                  },
                );
              },
            ),
          ),

          SizedBox(height: 25.h),

          /// Variant Price

          Text(
            "Variant Price",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          CustomTextFormFieldWidget(

            hintText: "Enter Variant Price",

            keyboardType: TextInputType.number,

            prefixIcon: Icon(
              Iconsax.wallet_money,
              color: AppColors.primaryColor,
            ),
          ),

          SizedBox(height: 20.h),

          /// Variant Stock

          Text(
            "Variant Stock",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          CustomTextFormFieldWidget(

            hintText: "Enter Variant Stock",

            keyboardType: TextInputType.number,

            prefixIcon: Icon(
              Iconsax.box,
              color: AppColors.primaryColor,
            ),
          ),

          SizedBox(height: 22.h),

          /// Variant Image

          Text(
            "Variant Image",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 12.h),

          InkWell(

            onTap: () {},

            borderRadius: BorderRadius.circular(16.r),

            child: Container(

              height: 120.h,

              width: double.infinity,

              decoration: BoxDecoration(

                color: Colors.grey.shade100,

                borderRadius:
                BorderRadius.circular(16.r),

                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),

              child: Column(

                mainAxisAlignment:
                MainAxisAlignment.center,

                children: [

                  Icon(
                    Iconsax.gallery_add,
                    size: 34.sp,
                    color: AppColors.primaryColor,
                  ),

                  SizedBox(height: 10.h),

                  Text(
                    "Upload Variant Image",
                    style: AppTextStyles.bodyMedium,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 25.h),

          /// Add Variant Button

          SizedBox(

            width: double.infinity,

            height: 52.h,

            child: ElevatedButton.icon(

              onPressed: () {},

              icon: const Icon(Icons.add),

              label: const Text("Add Variant"),

              style: ElevatedButton.styleFrom(

                backgroundColor:
                AppColors.primaryColor,

                foregroundColor: Colors.white,

                shape: RoundedRectangleBorder(

                  borderRadius:
                  BorderRadius.circular(14.r),

                ),
              ),
            ),
          ),

          SizedBox(height: 20.h),

          /// Added Variants

          Container(

            padding: EdgeInsets.all(15.w),

            decoration: BoxDecoration(

              color: Colors.grey.shade50,

              borderRadius:
              BorderRadius.circular(15.r),

            ),

            child: Row(

              children: [

                CircleAvatar(
                  radius: 22.r,
                  backgroundColor:
                  AppColors.primaryColor.withOpacity(.15),
                  child: Icon(
                    Iconsax.box,
                    color: AppColors.primaryColor,
                  ),
                ),

                SizedBox(width: 12.w),

                Expanded(

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Text(
                        "Black • Size M",
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        "\$120 • Stock: 25",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.edit,
                    color: Colors.blue,
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.trash,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}