import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class SellerLatestReviewsWidget extends StatelessWidget {
  const SellerLatestReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [

          /// Heading
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "Latest Customer Reviews",
                style: AppTextStyles.bodyLarge.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          _reviewCard(
            customerName: "Ali Ahmed",
            productName: "Nike Air Max",
            review:
            "Excellent quality and fast delivery. Highly recommended.",
            rating: 5,
            time: "2 days ago",
          ),

          SizedBox(height: 12.h),

          _reviewCard(
            customerName: "Sara Khan",
            productName: "Apple Watch Series 10",
            review:
            "Product is good but packaging could be improved.",
            rating: 4,
            time: "5 days ago",
          ),

          SizedBox(height: 12.h),

          _reviewCard(
            customerName: "Hassan Ali",
            productName: "Wireless Headphones",
            review: "Amazing sound quality. Worth the price.",
            rating: 5,
            time: "1 week ago",
          ),
        ],
      ),
    );
  }

  Widget _reviewCard({
    required String customerName,
    required String productName,
    required String review,
    required int rating,
    required String time,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [

          /// Top Row
          Row(
            children: [

              CircleAvatar(
                radius: 24.r,
                backgroundColor:
                AppColors.primaryColor.withOpacity(.1),
                child: Icon(
                  Iconsax.user,
                  color: AppColors.primaryColor,
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      customerName,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),

                    SizedBox(height: 3.h),

                    Text(
                      productName,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: List.generate(
                  5,
                      (index) => Icon(
                    index < rating
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    color: Colors.amber,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 14.h),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              review,
              style: AppTextStyles.bodyLarge.copyWith(
                fontSize: 13.sp,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
          ),

          SizedBox(height: 14.h),

          Row(
            children: [

              Icon(
                Iconsax.calendar_1,
                size: 16.sp,
                color: Colors.grey,
              ),

              SizedBox(width: 6.w),

              Text(
                time,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}