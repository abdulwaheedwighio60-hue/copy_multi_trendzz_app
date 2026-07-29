import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class TopSellingProductsWidget extends StatelessWidget {
  const TopSellingProductsWidget({super.key});

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
        children: [

          /// Header
          Row(
            children: [

              Text(
                "Top Selling Products",
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

          const _ProductTile(
            image:
            "https://images.unsplash.com/photo-1542291026-7eec264c27ff",
            name: "Nike Air Max",
            category: "Fashion",
            sold: "420 Sold",
            revenue: "\$18,450",
            rating: "4.9",
            growth: "+18%",
          ),

          SizedBox(height: 18.h),

          const _ProductTile(
            image:
            "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
            name: "iPhone 16 Pro",
            category: "Electronics",
            sold: "185 Sold",
            revenue: "\$42,180",
            rating: "4.8",
            growth: "+12%",
          ),

          SizedBox(height: 18.h),

          const _ProductTile(
            image:
            "https://images.unsplash.com/photo-1523275335684-37898b6baf30",
            name: "Smart Watch",
            category: "Accessories",
            sold: "278 Sold",
            revenue: "\$14,620",
            rating: "4.7",
            growth: "+15%",
          ),

          SizedBox(height: 18.h),

          const _ProductTile(
            image:
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e",
            name: "Wireless Headphones",
            category: "Electronics",
            sold: "312 Sold",
            revenue: "\$21,500",
            rating: "4.9",
            growth: "+22%",
          ),
        ],
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  final String image;
  final String name;
  final String category;
  final String sold;
  final String revenue;
  final String rating;
  final String growth;

  const _ProductTile({
    required this.image,
    required this.name,
    required this.category,
    required this.sold,
    required this.revenue,
    required this.rating,
    required this.growth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(14.r),
          child: Image.network(
            image,
            width: 70.w,
            height: 70.w,
            fit: BoxFit.cover,
          ),
        ),

        SizedBox(width: 14.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 5.h),

              Text(
                category,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey,
                ),
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
                    rating,
                    style: AppTextStyles.bodySmall,
                  ),

                  SizedBox(width: 12.w),

                  Icon(
                    Iconsax.shopping_bag,
                    color: AppColors.primaryColor,
                    size: 16.sp,
                  ),

                  SizedBox(width: 4.w),

                  Text(
                    sold,
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 5.h,
              ),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(.12),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                growth,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
            ),

            SizedBox(height: 12.h),

            Text(
              revenue,
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}