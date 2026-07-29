import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class OrderedProductsWidget extends StatelessWidget {
  const OrderedProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Heading
          Row(
            children: [
              Icon(
                Iconsax.box,
                color: AppColors.primaryColor,
              ),
              SizedBox(width: 10.w),
              Text(
                "Ordered Products",
                style: AppTextStyles.titleMedium,
              ),
            ],
          ),

          SizedBox(height: 18.h),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (_, __) => SizedBox(height: 16.h),
            itemBuilder: (_, index) {
              return const _ProductCard();
            },
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: Image.network(
                  "https://picsum.photos/200",
                  width: 90.w,
                  height: 90.w,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: 14.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Nike Air Max 270",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      "Brand : Nike",
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Row(
                      children: [

                        _chip(
                          "Black",
                          Colors.black,
                        ),

                        SizedBox(width: 8.w),

                        _sizeChip("42"),
                      ],
                    ),

                    SizedBox(height: 8.h),

                    Row(
                      children: [

                        Icon(
                          Iconsax.star1,
                          color: Colors.amber,
                          size: 16.sp,
                        ),

                        SizedBox(width: 4.w),

                        Text(
                          "4.8",
                          style: AppTextStyles.bodySmall,
                        ),

                        SizedBox(width: 12.w),

                        Text(
                          "(254 Reviews)",
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          Divider(),

          SizedBox(height: 12.h),

          Row(
            children: [

              Expanded(
                child: _infoColumn(
                  "Quantity",
                  "2",
                ),
              ),

              Expanded(
                child: _infoColumn(
                  "Unit Price",
                  "\$120",
                ),
              ),

              Expanded(
                child: _infoColumn(
                  "Total",
                  "\$240",
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Iconsax.eye),
              label: const Text("View Product"),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                minimumSize: Size(
                  double.infinity,
                  48.h,
                ),
                side: BorderSide(
                  color: AppColors.primaryColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(
      String text,
      Color color,
      ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _sizeChip(String size) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.12),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        "Size $size",
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _infoColumn(
      String title,
      String value, {
        Color color = Colors.black,
      }) {
    return Column(
      children: [

        Text(
          title,
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.grey,
          ),
        ),

        SizedBox(height: 4.h),

        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}