import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class CustomerReviewsWidget extends StatelessWidget {
  const CustomerReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final reviews = [
      {
        "product":
        "Nike Air Max Shoes",
        "image":
        "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500",
        "rating": 5,
        "review":
        "Excellent quality. Fast delivery and premium packaging. Highly recommended!",
        "date":
        "20 Jul 2026",
        "helpful":
        18,
      },
      {
        "product":
        "Apple Watch Ultra",
        "image":
        "https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=500",
        "rating": 4,
        "review":
        "Very satisfied with the product. Battery life is amazing.",
        "date":
        "15 Jul 2026",
        "helpful":
        12,
      },
      {
        "product":
        "Sony WH-1000XM5",
        "image":
        "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500",
        "rating": 5,
        "review":
        "Sound quality is outstanding. Worth every penny.",
        "date":
        "08 Jul 2026",
        "helpful":
        25,
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Customer Reviews",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 16.h),

          ListView.builder(
            itemCount: reviews.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {

              final review = reviews[index];

              return _ReviewCard(
                productName: review["product"] as String,
                image: review["image"] as String,
                rating: review["rating"] as int,
                review: review["review"] as String,
                date: review["date"] as String,
                helpful: review["helpful"] as int,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {

  final String productName;
  final String image;
  final int rating;
  final String review;
  final String date;
  final int helpful;

  const _ReviewCard({
    required this.productName,
    required this.image,
    required this.rating,
    required this.review,
    required this.date,
    required this.helpful,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
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

          Row(
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  image,
                  width: 70.w,
                  height: 70.w,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      width: 70.w,
                      height: 70.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                        BorderRadius.circular(12.r),
                      ),
                      child: const Icon(Icons.image),
                    );
                  },
                ),
              ),

              SizedBox(width: 15.w),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      productName,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Row(
                      children: List.generate(
                        5,
                            (index) => Icon(
                          Icons.star,
                          size: 18.sp,
                          color: index < rating
                              ? Colors.amber
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      date,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.grey,
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),

          SizedBox(height: 15.h),

          Text(
            review,
            style: AppTextStyles.bodyMedium,
          ),

          SizedBox(height: 15.h),

          Row(
            children: [

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 7.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor
                      .withOpacity(.10),
                  borderRadius:
                  BorderRadius.circular(25.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    const Icon(
                      Iconsax.like_1,
                      size: 16,
                      color: AppColors.primaryColor,
                    ),

                    SizedBox(width: 6.w),

                    Text(
                      "$helpful Helpful",
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}