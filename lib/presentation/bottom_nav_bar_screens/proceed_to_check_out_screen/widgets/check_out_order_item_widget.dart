import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/model/shipping_model.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:shimmer/shimmer.dart';

class CheckoutOrderItemWidget extends StatelessWidget {
  const CheckoutOrderItemWidget({
    required this.item,
  });

  final CheckoutOrderItemModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            color: AppColors.greyColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: _buildCheckoutProductImage(item.imagePath),
          ),
        ),
        SizedBox(width: 14.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 5.h),

              Text(
                item.category,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 7.h),

              Text(
                '\$${item.price.toStringAsFixed(2)}',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildCheckoutProductImage(String imagePath) {
    final bool isNetworkImage = imagePath.startsWith('http');

    if (isNetworkImage) {
      return Image.network(
        imagePath,
        fit: BoxFit.cover,
        loadingBuilder: (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
            ) {
          if (loadingProgress == null) {
            return child;
          }

          return _buildImageShimmer();
        },
        errorBuilder: (
            BuildContext context,
            Object error,
            StackTrace? stackTrace,
            ) {
          return Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              color: AppColors.textHint,
              size: 28.sp,
            ),
          );
        },
      );
    }

    return Image.asset(
      imagePath,
      fit: BoxFit.contain,
    );
  }

  Widget _buildImageShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColors.borderColor.withOpacity(0.45),
      highlightColor: AppColors.white.withOpacity(0.95),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.white,
      ),
    );
  }
}