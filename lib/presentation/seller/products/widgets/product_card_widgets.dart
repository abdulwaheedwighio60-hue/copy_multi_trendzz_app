import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';


class ProductCardWidget extends StatelessWidget {
  final String image;
  final String productName;
  final String sku;
  final double price;
  final int stock;
  final int sold;
  final double rating;
  final bool isActive;

  final VoidCallback onView;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProductCardWidget({
    super.key,
    required this.image,
    required this.productName,
    required this.sku,
    required this.price,
    required this.stock,
    required this.sold,
    required this.rating,
    required this.isActive,
    required this.onView,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Product Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.r),
            ),
            child: Image.network(
              image,
              width: double.infinity,
              height: 140.h,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  height: 140.h,
                  color: Colors.grey.shade100,
                  child: Center(
                    child: Icon(
                      Iconsax.gallery,
                      size: 45.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Status + Rating
                Row(
                  children: [

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: isActive
                            ? Colors.green.withOpacity(.12)
                            : Colors.red.withOpacity(.12),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        isActive ? "Active" : "Inactive",
                        style: TextStyle(
                          color:
                          isActive ? Colors.green : Colors.red,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const Spacer(),

                    Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 18.sp,
                    ),

                    SizedBox(width: 4.w),

                    Text(
                      rating.toString(),
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                /// Product Name
                Text(
                  productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5.h),

                /// SKU
                Text(
                  "SKU : $sku",
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),

                SizedBox(height: 10.h),

                /// Price
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),

                SizedBox(height: 14.h),

                /// Stock & Sold
                Wrap(
                  spacing: 10.w,
                  runSpacing: 8.h,
                  children: [

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(.08),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Icon(
                            Iconsax.box,
                            size: 15.sp,
                            color: AppColors.primaryColor,
                          ),

                          SizedBox(width: 5.w),

                          Text(
                            "Stock: $stock",
                            style: AppTextStyles.bodySmall.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(.10),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Icon(
                            Iconsax.shopping_bag,
                            size: 15.sp,
                            color: Colors.orange,
                          ),

                          SizedBox(width: 5.w),

                          Text(
                            "Sold: $sold",
                            style: AppTextStyles.bodySmall.copyWith(
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
          ),

          Divider(
            height: 1,
            color: Colors.grey.shade200,
          ),

          IntrinsicHeight(
            child: Row(
              children: [

                _actionButton(
                  icon: Iconsax.eye,
                  title: "View",
                  onTap: onView,
                ),

                VerticalDivider(
                  width: 1,
                  color: Colors.grey.shade200,
                ),

                _actionButton(
                  icon: Iconsax.edit,
                  title: "Edit",
                  onTap: onEdit,
                ),

                VerticalDivider(
                  width: 1,
                  color: Colors.grey.shade200,
                ),

                _actionButton(
                  icon: Iconsax.trash,
                  title: "Delete",
                  color: Colors.red,
                  onTap: onDelete,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.black87,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(
                icon,
                size: 18.sp,
                color: color,
              ),

              SizedBox(width: 6.w),

              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}