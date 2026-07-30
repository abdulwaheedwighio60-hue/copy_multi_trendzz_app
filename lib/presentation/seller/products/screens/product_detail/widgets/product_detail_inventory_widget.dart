import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';


class ProductDetailInventoryWidget extends StatelessWidget {
  final int stock;
  final double weight;
  final double length;
  final double width;
  final double height;
  final bool isActive;
  final bool isFeatured;
  final String createdAt;
  final String updatedAt;

  const ProductDetailInventoryWidget({
    super.key,
    required this.stock,
    required this.weight,
    required this.length,
    required this.width,
    required this.height,
    required this.isActive,
    required this.isFeatured,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(18.w),
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

          Text(
            "Inventory Details",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20.h),

          _infoTile(
            icon: Iconsax.box,
            title: "Available Stock",
            value: "$stock Items",
            color: Colors.blue,
          ),

          SizedBox(height: 16.h),

          _infoTile(
            icon: Iconsax.weight,
            title: "Weight",
            value: "$weight kg",
            color: Colors.orange,
          ),

          SizedBox(height: 16.h),

          _infoTile(
            icon: Iconsax.ruler,
            title: "Dimensions",
            value: "$length × $width × $height cm",
            color: Colors.purple,
          ),

          SizedBox(height: 20.h),

          Row(
            children: [

              Expanded(
                child: _statusCard(
                  title: "Status",
                  value: isActive ? "Active" : "Inactive",
                  color: isActive
                      ? Colors.green
                      : Colors.red,
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: _statusCard(
                  title: "Featured",
                  value: isFeatured ? "Yes" : "No",
                  color: isFeatured
                      ? Colors.orange
                      : Colors.grey,
                ),
              ),

            ],
          ),

          SizedBox(height: 20.h),

          Divider(),

          SizedBox(height: 16.h),

          _infoTile(
            icon: Iconsax.calendar,
            title: "Created",
            value: createdAt,
            color: Colors.teal,
          ),

          SizedBox(height: 16.h),

          _infoTile(
            icon: Iconsax.refresh,
            title: "Last Updated",
            value: updatedAt,
            color: Colors.indigo,
          ),

        ],
      ),
    );
  }

  Widget _infoTile({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [

        Container(
          width: 44.w,
          height: 44.w,
          decoration: BoxDecoration(
            color: color.withOpacity(.12),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            icon,
            color: color,
            size: 22.sp,
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
          ),
        ),

      ],
    );
  }

  Widget _statusCard({
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        children: [

          Text(
            title,
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 8.h),

          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
            ),
          ),

        ],
      ),
    );
  }
}