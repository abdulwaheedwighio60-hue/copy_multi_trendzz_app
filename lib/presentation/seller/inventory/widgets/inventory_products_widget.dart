import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class InventoryProductsWidget extends StatelessWidget {
  const InventoryProductsWidget({
    super.key,
  });

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
                "Inventory Products",
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

          const _InventoryProductTile(
            productName: "Nike Air Max",
            category: "Shoes",
            price: "\$180",
            stock: 58,
            status: ProductStockStatus.inStock,
            icon: Iconsax.shopping_bag,
          ),

          SizedBox(height: 14.h),

          const _InventoryProductTile(
            productName: "iPhone 15 Pro",
            category: "Mobiles",
            price: "\$1,250",
            stock: 6,
            status: ProductStockStatus.lowStock,
            icon: Iconsax.mobile,
          ),

          SizedBox(height: 14.h),

          const _InventoryProductTile(
            productName: "Sony Headphones",
            category: "Electronics",
            price: "\$220",
            stock: 0,
            status: ProductStockStatus.outOfStock,
            icon: Iconsax.headphone,
          ),

        ],
      ),
    );
  }
}

enum ProductStockStatus {
  inStock,
  lowStock,
  outOfStock,
}

class _InventoryProductTile extends StatelessWidget {

  final String productName;
  final String category;
  final String price;
  final int stock;
  final ProductStockStatus status;
  final IconData icon;

  const _InventoryProductTile({
    required this.productName,
    required this.category,
    required this.price,
    required this.stock,
    required this.status,
    required this.icon,
  });

  Color get statusColor {
    switch (status) {
      case ProductStockStatus.inStock:
        return Colors.green;

      case ProductStockStatus.lowStock:
        return Colors.orange;

      case ProductStockStatus.outOfStock:
        return Colors.red;
    }
  }

  String get statusText {
    switch (status) {
      case ProductStockStatus.inStock:
        return "In Stock";

      case ProductStockStatus.lowStock:
        return "Low Stock";

      case ProductStockStatus.outOfStock:
        return "Out of Stock";
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [

          Row(
            children: [

              Container(
                width: 70.w,
                height: 70.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(.10),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(
                  icon,
                  size: 34.sp,
                  color: AppColors.primaryColor,
                ),
              ),

              SizedBox(width: 14.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      productName,
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

                    SizedBox(height: 10.h),

                    Row(
                      children: [

                        Icon(
                          Iconsax.box,
                          size: 16.sp,
                          color: Colors.grey,
                        ),

                        SizedBox(width: 4.w),

                        Text(
                          "Stock : $stock",
                          style: AppTextStyles.bodySmall,
                        ),

                        SizedBox(width: 12.w),

                        Icon(
                          Iconsax.money_3,
                          size: 16.sp,
                          color: Colors.grey,
                        ),

                        SizedBox(width: 4.w),

                        Text(
                          price,
                          style: AppTextStyles.bodySmall,
                        ),

                      ],
                    ),

                    SizedBox(height: 10.h),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(.12),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        statusText,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp,
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),

          SizedBox(height: 16.h),

          Row(
            children: [

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Iconsax.eye),
                  label: const Text("View"),
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Iconsax.edit),
                  label: const Text("Edit"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
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
}