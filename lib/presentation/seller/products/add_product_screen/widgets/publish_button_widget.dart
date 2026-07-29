import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';


class PublishButtonWidget extends StatefulWidget {
  const PublishButtonWidget({super.key});

  @override
  State<PublishButtonWidget> createState() =>
      _PublishButtonWidgetState();
}

class _PublishButtonWidgetState
    extends State<PublishButtonWidget> {

  bool isPublishing = false;

  Future<void> _publishProduct() async {

    setState(() {
      isPublishing = true;
    });

    /// TODO
    /// Call Add Product API Here

    await Future.delayed(
      const Duration(seconds: 2),
    );

    setState(() {
      isPublishing = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        /// Preview & Draft

        Row(

          children: [

            Expanded(

              child: OutlinedButton.icon(

                onPressed: () {},

                icon: const Icon(Iconsax.eye),

                label: const Text("Preview"),

                style: OutlinedButton.styleFrom(

                  minimumSize: Size(
                    double.infinity,
                    55.h,
                  ),

                  foregroundColor:
                  AppColors.primaryColor,

                  side: BorderSide(
                    color: AppColors.primaryColor,
                  ),

                  shape: RoundedRectangleBorder(

                    borderRadius:
                    BorderRadius.circular(14.r),

                  ),
                ),
              ),
            ),

            SizedBox(width: 14.w),

            Expanded(

              child: OutlinedButton.icon(

                onPressed: () {},

                icon: const Icon(Iconsax.document),

                label: const Text("Save Draft"),

                style: OutlinedButton.styleFrom(

                  minimumSize: Size(
                    double.infinity,
                    55.h,
                  ),

                  foregroundColor: Colors.orange,

                  side: const BorderSide(
                    color: Colors.orange,
                  ),

                  shape: RoundedRectangleBorder(

                    borderRadius:
                    BorderRadius.circular(14.r),

                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 18.h),

        /// Publish Button

        SizedBox(

          width: double.infinity,

          height: 58.h,

          child: ElevatedButton(

            onPressed: isPublishing
                ? null
                : _publishProduct,

            style: ElevatedButton.styleFrom(

              elevation: 0,

              backgroundColor:
              AppColors.primaryColor,

              shape: RoundedRectangleBorder(

                borderRadius:
                BorderRadius.circular(16.r),

              ),
            ),

            child: isPublishing

                ? SizedBox(

              width: 24.w,

              height: 24.w,

              child:
              const CircularProgressIndicator(

                strokeWidth: 2.5,

                color: Colors.white,

              ),
            )

                : Row(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [

                Icon(
                  Iconsax.send_2,
                  color: Colors.white,
                  size: 22.sp,
                ),

                SizedBox(width: 10.w),

                Text(

                  "Publish Product",

                  style:
                  AppTextStyles.bodyLarge.copyWith(

                    color: Colors.white,

                    fontWeight: FontWeight.bold,

                    fontSize: 16.sp,

                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 15.h),

        Text(

          "Review all product information before publishing.",

          textAlign: TextAlign.center,

          style: AppTextStyles.bodySmall.copyWith(

            color: Colors.grey,

          ),
        ),
      ],
    );
  }
}