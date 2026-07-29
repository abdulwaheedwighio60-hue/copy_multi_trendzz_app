import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';


class InventorySummaryCardsWidget extends StatelessWidget {
  const InventorySummaryCardsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 14.w,
        mainAxisSpacing: 14.h,
        childAspectRatio: 1.20,
        children: const [
          _InventoryCard(
            title: "Total Products",
            value: "245",
            subtitle: "+12 This Week",
            icon: Iconsax.box,
            color: Colors.blue,
          ),

          _InventoryCard(
            title: "Total Stock",
            value: "12,540",
            subtitle: "Units Available",
            icon: Iconsax.archive,
            color: Colors.green,
          ),

          _InventoryCard(
            title: "Low Stock",
            value: "18",
            subtitle: "Need Restock",
            icon: Iconsax.warning_2,
            color: Colors.orange,
          ),

          _InventoryCard(
            title: "Out of Stock",
            value: "07",
            subtitle: "Unavailable",
            icon: Iconsax.close_circle,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

class _InventoryCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _InventoryCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
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

              Container(
                width: 46.w,
                height: 46.w,
                decoration: BoxDecoration(
                  color: color.withOpacity(.12),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24.sp,
                ),
              ),

              const Spacer(),

              Icon(
                Iconsax.arrow_up_1,
                color: color,
                size: 18.sp,
              ),
            ],
          ),

          const Spacer(),

          Text(
            value,
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 6.h),

          Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 4.h),

          Text(
            subtitle,
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}