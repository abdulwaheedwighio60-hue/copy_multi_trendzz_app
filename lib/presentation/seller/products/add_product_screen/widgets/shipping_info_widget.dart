import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';


class ShippingInfoWidget extends StatefulWidget {
  const ShippingInfoWidget({super.key});

  @override
  State<ShippingInfoWidget> createState() =>
      _ShippingInfoWidgetState();
}

class _ShippingInfoWidgetState
    extends State<ShippingInfoWidget> {

  bool freeShipping = false;
  bool cashOnDelivery = true;
  bool expressDelivery = false;

  String selectedRegion = "Pakistan";

  final List<String> regions = [
    "Pakistan",
    "UAE",
    "Saudi Arabia",
    "Qatar",
    "Worldwide",
  ];

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
            "Shipping Information",
            style: AppTextStyles.titleMedium,
          ),

          SizedBox(height: 5.h),

          Text(
            "Configure shipping and delivery settings.",
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 25.h),

          /// Weight

          Text(
            "Product Weight",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          CustomTextFormFieldWidget(
            hintText: "1.5 KG",
            keyboardType: TextInputType.number,
            prefixIcon: Icon(
              Iconsax.weight,
              color: AppColors.primaryColor,
            ),
          ),

          SizedBox(height: 20.h),

          /// Dimensions

          Text(
            "Package Dimensions",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 10.h),

          Row(
            children: [

              Expanded(
                child: CustomTextFormFieldWidget(
                  hintText: "Length",
                  keyboardType: TextInputType.number,
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: CustomTextFormFieldWidget(
                  hintText: "Width",
                  keyboardType: TextInputType.number,
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: CustomTextFormFieldWidget(
                  hintText: "Height",
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          /// Shipping Fee

          Text(
            "Shipping Fee",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          CustomTextFormFieldWidget(
            hintText: "\$10",
            keyboardType: TextInputType.number,
            prefixIcon: Icon(
              Iconsax.money,
              color: AppColors.primaryColor,
            ),
          ),

          SizedBox(height: 20.h),

          /// Delivery Time

          Text(
            "Estimated Delivery",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          DropdownButtonFormField<String>(
            value: "3 - 5 Days",
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(14.r),
                borderSide: BorderSide.none,
              ),
            ),
            items: const [

              DropdownMenuItem(
                value: "1 - 2 Days",
                child: Text("1 - 2 Days"),
              ),

              DropdownMenuItem(
                value: "3 - 5 Days",
                child: Text("3 - 5 Days"),
              ),

              DropdownMenuItem(
                value: "5 - 7 Days",
                child: Text("5 - 7 Days"),
              ),

              DropdownMenuItem(
                value: "7 - 10 Days",
                child: Text("7 - 10 Days"),
              ),
            ],
            onChanged: (_) {},
          ),

          SizedBox(height: 20.h),

          /// Shipping Region

          Text(
            "Shipping Region",
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8.h),

          DropdownButtonFormField<String>(
            value: selectedRegion,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade50,
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(14.r),
                borderSide: BorderSide.none,
              ),
            ),
            items: regions
                .map(
                  (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedRegion = value!;
              });
            },
          ),

          SizedBox(height: 25.h),

          /// Free Shipping

          _switchTile(
            title: "Free Shipping",
            subtitle:
            "Enable free delivery for this product.",
            value: freeShipping,
            onChanged: (v) {
              setState(() {
                freeShipping = v;
              });
            },
          ),

          SizedBox(height: 12.h),

          /// COD

          _switchTile(
            title: "Cash on Delivery",
            subtitle: "Allow COD payments.",
            value: cashOnDelivery,
            onChanged: (v) {
              setState(() {
                cashOnDelivery = v;
              });
            },
          ),

          SizedBox(height: 12.h),

          /// Express

          _switchTile(
            title: "Express Delivery",
            subtitle: "Enable fast delivery option.",
            value: expressDelivery,
            onChanged: (v) {
              setState(() {
                expressDelivery = v;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _switchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  subtitle,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          Switch(
            value: value,
            activeColor: AppColors.primaryColor,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}