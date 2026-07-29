import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class TopCategoriesWidget extends StatelessWidget {
  const TopCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Text(
                "Top Categories",
                style: AppTextStyles.titleMedium,
              ),

              const Spacer(),

              TextButton(
                onPressed: () {},
                child: const Text("View All"),
              ),
            ],
          ),

          SizedBox(height: 18.h),

          const _CategoryTile(
            icon: Iconsax.shop,
            title: "Fashion",
            products: 145,
            revenue: "\$18,250",
            progress: .92,
            color: Colors.deepPurple,
          ),

          SizedBox(height: 16.h),

          const _CategoryTile(
            icon: Iconsax.mobile,
            title: "Electronics",
            products: 98,
            revenue: "\$15,820",
            progress: .80,
            color: Colors.blue,
          ),

          SizedBox(height: 16.h),

          const _CategoryTile(
            icon: Iconsax.bag,
            title: "Accessories",
            products: 76,
            revenue: "\$9,430",
            progress: .62,
            color: Colors.orange,
          ),

          SizedBox(height: 16.h),

          const _CategoryTile(
            icon: Iconsax.house,
            title: "Home & Living",
            products: 54,
            revenue: "\$6,540",
            progress: .45,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {

  final IconData icon;
  final String title;
  final int products;
  final String revenue;
  final double progress;
  final Color color;

  const _CategoryTile({
    required this.icon,
    required this.title,
    required this.products,
    required this.revenue,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Row(
          children: [

            Container(
              width: 54.w,
              height: 54.w,
              decoration: BoxDecoration(
                color: color.withOpacity(.12),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Icon(
                icon,
                color: color,
                size: 26.sp,
              ),
            ),

            SizedBox(width: 14.w),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    "$products Products",
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment:
              CrossAxisAlignment.end,
              children: [

                Text(
                  revenue,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  "${(progress * 100).toInt()}%",
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: 12.h),

        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8.h,
            backgroundColor: Colors.grey.shade200,
            valueColor:
            AlwaysStoppedAnimation(color),
          ),
        ),
      ],
    );
  }
}