import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

enum ProductStatus {
  active,
  lowStock,
  outOfStock,
}

class ProductCardWidget extends StatelessWidget {
  final String image;
  final String productName;
  final String category;
  final String sku;
  final double price;
  final int stock;
  final double rating;
  final int sold;
  final ProductStatus status;

  final VoidCallback? onView;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ProductCardWidget({
    super.key,
    required this.image,
    required this.productName,
    required this.category,
    required this.sku,
    required this.price,
    required this.stock,
    required this.rating,
    required this.sold,
    required this.status,
    this.onView,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusText;

    switch (status) {
      case ProductStatus.active:
        statusColor = Colors.green;
        statusText = "Active";
        break;

      case ProductStatus.lowStock:
        statusColor = Colors.orange;
        statusText = "Low Stock";
        break;

      case ProductStatus.outOfStock:
        statusColor = Colors.red;
        statusText = "Out of Stock";
        break;
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 8.h,
      ),
      padding: EdgeInsets.all(14.w),
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
        children: [

          /// Image + Details
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: Image.network(
                  image,
                  width: 95.w,
                  height: 95.w,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: 14.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      productName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.titleMedium.copyWith(
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

                    SizedBox(height: 10.h),

                    Row(
                      children: [

                        Icon(
                          Iconsax.star1,
                          size: 16.sp,
                          color: Colors.amber,
                        ),

                        SizedBox(width: 5.w),

                        Text(
                          rating.toString(),
                          style: AppTextStyles.bodySmall,
                        ),

                        const Spacer(),

                        Text(
                          "\$${price.toStringAsFixed(2)}",
                          style: AppTextStyles.titleMedium.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),

          SizedBox(height: 15.h),

          /// SKU + Stock
          Row(
            children: [

              Expanded(
                child: _infoTile(
                  "SKU",
                  sku,
                ),
              ),

              Expanded(
                child: _infoTile(
                  "Stock",
                  "$stock pcs",
                ),
              ),

              Expanded(
                child: _infoTile(
                  "Sold",
                  "$sold",
                ),
              ),

            ],
          ),

          SizedBox(height: 15.h),

          /// Status
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 7.h,
              ),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(.12),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text(
                statusText,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(height: 18.h),

          /// Actions
          Row(
            children: [

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onView,
                  icon: const Icon(Iconsax.eye),
                  label: const Text("View"),
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Iconsax.edit),
                  label: const Text("Edit"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onDelete,
                  icon: const Icon(Iconsax.trash),
                  label: const Text("Delete"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }

  Widget _infoTile(String title, String value) {
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
            fontWeight: FontWeight.w600,
          ),
        ),

      ],
    );
  }
}