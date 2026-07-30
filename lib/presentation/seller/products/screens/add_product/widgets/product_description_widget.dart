import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';


class ProductDescriptionWidget extends StatelessWidget {
  final TextEditingController descriptionController;
  final TextEditingController tagsController;

  const ProductDescriptionWidget({
    super.key,
    required this.descriptionController,
    required this.tagsController,
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
            "Product Description",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20.h),

          TextFormField(
            controller: descriptionController,
            maxLines: 6,
            decoration: InputDecoration(
              labelText: "Description",
              hintText:
              "Write a detailed description of your product...",
              filled: true,
              fillColor: Colors.grey.shade100,
              alignLabelWithHint: true,
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
          ),

          SizedBox(height: 20.h),

          TextFormField(
            controller: tagsController,
            decoration: InputDecoration(
              labelText: "Product Tags",
              hintText: "Shoes, Nike, Sports, Men",
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
          ),

          SizedBox(height: 15.h),

          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [

                const Icon(
                  Icons.info_outline,
                  color: Colors.blue,
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: Text(
                    "Separate multiple tags with commas to improve product search.",
                    style: AppTextStyles.bodySmall,
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