import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/theme/app_text_style.dart';

class StockActivityWidget extends StatelessWidget {
  const StockActivityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),

      padding: EdgeInsets.all(18.w),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(20.r),

        boxShadow: [

          BoxShadow(

            color: Colors.black.withOpacity(.05),

            blurRadius: 12,

            offset: const Offset(0,4),

          ),

        ],

      ),

      child: Column(

        children: [

          Row(

            children: [

              Text(

                "Recent Stock Activity",

                style:
                AppTextStyles.titleMedium,

              ),

              const Spacer(),

              TextButton(

                onPressed: () {},

                child:
                const Text("View All"),

              ),

            ],

          ),

          SizedBox(height:18.h),

          const _ActivityTile(

            title: "Stock Added",

            product: "Nike Air Max",

            quantity: "+50 Units",

            date: "Today, 09:45 AM",

            by: "Seller",

            type: ActivityType.add,

          ),

          SizedBox(height:14.h),

          const _ActivityTile(

            title: "Product Sold",

            product: "iPhone 15 Pro",

            quantity: "-2 Units",

            date: "Today, 08:20 AM",

            by: "Customer Order",

            type: ActivityType.sale,

          ),

          SizedBox(height:14.h),

          const _ActivityTile(

            title: "Stock Updated",

            product: "Sony Headphones",

            quantity: "+15 Units",

            date: "Yesterday",

            by: "Seller",

            type: ActivityType.update,

          ),

          SizedBox(height:14.h),

          const _ActivityTile(

            title: "Stock Removed",

            product: "Samsung A55",

            quantity: "-10 Units",

            date: "Yesterday",

            by: "System",

            type: ActivityType.remove,

          ),

        ],

      ),

    );

  }
}

enum ActivityType{
  add,
  remove,
  sale,
  update,
}

class _ActivityTile extends StatelessWidget{

  final String title;
  final String product;
  final String quantity;
  final String date;
  final String by;
  final ActivityType type;

  const _ActivityTile({

    required this.title,
    required this.product,
    required this.quantity,
    required this.date,
    required this.by,
    required this.type,

  });

  IconData get icon{

    switch(type){

      case ActivityType.add:
        return Iconsax.add_circle;

      case ActivityType.remove:
        return Iconsax.minus_cirlce;

      case ActivityType.sale:
        return Iconsax.shopping_cart;

      case ActivityType.update:
        return Iconsax.refresh;
    }

  }

  Color get color{

    switch(type){

      case ActivityType.add:
        return Colors.green;

      case ActivityType.remove:
        return Colors.red;

      case ActivityType.sale:
        return Colors.orange;

      case ActivityType.update:
        return Colors.blue;
    }

  }

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: EdgeInsets.all(14.w),

      decoration: BoxDecoration(

        color: Colors.grey.shade50,

        borderRadius:
        BorderRadius.circular(16.r),

      ),

      child: Row(

        children: [

          Container(

            width:55.w,

            height:55.w,

            decoration: BoxDecoration(

              color:
              color.withOpacity(.12),

              borderRadius:
              BorderRadius.circular(14.r),

            ),

            child: Icon(

              icon,

              color: color,

              size:28.sp,

            ),

          ),

          SizedBox(width:14.w),

          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(

                  title,

                  style:
                  AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),

                ),

                SizedBox(height:4.h),

                Text(

                  product,

                  style:
                  AppTextStyles.bodyMedium,

                ),

                SizedBox(height:6.h),

                Text(

                  "$date • $by",

                  style:
                  AppTextStyles.bodySmall.copyWith(
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

                quantity,

                style: TextStyle(

                  color: color,

                  fontWeight: FontWeight.bold,

                  fontSize: 15.sp,

                ),

              ),

              SizedBox(height:6.h),

              Container(

                padding: EdgeInsets.symmetric(
                  horizontal:8.w,
                  vertical:4.h,
                ),

                decoration: BoxDecoration(

                  color:
                  color.withOpacity(.12),

                  borderRadius:
                  BorderRadius.circular(20.r),

                ),

                child: Text(

                  title,

                  style: TextStyle(

                    color: color,

                    fontWeight: FontWeight.bold,

                    fontSize:11.sp,

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