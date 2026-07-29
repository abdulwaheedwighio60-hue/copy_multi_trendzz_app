import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/presentation/seller/order/widgets/order_card_widget.dart';
import 'package:multi_trendzz/presentation/seller/order/widgets/order_summary_card_widget.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),

        title: Text(
          "Orders",
          style: AppTextStyles.titleMedium,
        ),

        actions: [

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.notification,
              color: Colors.black,
            ),
          ),

          SizedBox(width: 8.w),
        ],
      ),

      body: Column(
        children: [

          /// Search
          Padding(
            padding: EdgeInsets.fromLTRB(
              20.w,
              20.h,
              20.w,
              10.h,
            ),
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    decoration: InputDecoration(

                      hintText: "Search Orders",

                      prefixIcon: const Icon(
                        CupertinoIcons.search,
                      ),

                      filled: true,

                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(15.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                Container(
                  width: 52.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius:
                    BorderRadius.circular(14.r),
                  ),
                  child: const Icon(
                    Iconsax.setting_4,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          /// Status Chips
          SizedBox(
            height: 45.h,
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              scrollDirection: Axis.horizontal,
              children: [

                _chip("All", true),

                _chip("Pending", false),

                _chip("Processing", false),

                _chip("Shipped", false),

                _chip("Delivered", false),

                _chip("Cancelled", false),

              ],
            ),
          ),

          SizedBox(height: 20.h),

          /// Summary Cards

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Row(
              children: [

                Expanded(
                  child: OrderSummaryCardWidget(
                    title: "Pending",
                    value: "24",
                    icon: Iconsax.clock,
                    color: Colors.orange,
                  ),
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: OrderSummaryCardWidget(
                    title: "Processing",
                    value: "18",
                    icon: Iconsax.box,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Row(
              children: [

                Expanded(
                  child: OrderSummaryCardWidget(
                    title: "Delivered",
                    value: "152",
                    icon: Iconsax.tick_circle,
                    color: Colors.green,
                  ),
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: OrderSummaryCardWidget(
                    title: "Cancelled",
                    value: "5",
                    icon: Iconsax.close_circle,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),

          /// Orders

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              itemCount: 10,
              itemBuilder: (_, index) {

                return const OrderCardWidget();

              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(
      String title,
      bool selected,
      ) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      child: Chip(
        label: Text(title),
        backgroundColor: selected
            ? AppColors.primaryColor
            : Colors.white,
        labelStyle: TextStyle(
          color: selected
              ? Colors.white
              : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}