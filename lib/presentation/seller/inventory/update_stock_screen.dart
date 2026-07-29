import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

class UpdateStockScreen extends StatefulWidget {
  const UpdateStockScreen({super.key});

  @override
  State<UpdateStockScreen> createState() =>
      _UpdateStockScreenState();
}

class _UpdateStockScreenState
    extends State<UpdateStockScreen> {

  final TextEditingController stockController =
  TextEditingController();

  final TextEditingController reasonController =
  TextEditingController();

  bool isAddStock = true;

  @override
  void dispose() {
    stockController.dispose();
    reasonController.dispose();
    super.dispose();
  }

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
          "Update Stock",
          style: AppTextStyles.titleMedium,
        ),

      ),

      body: SingleChildScrollView(

        padding: EdgeInsets.all(20.w),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            /// Product Card

            Container(

              padding: EdgeInsets.all(18.w),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                BorderRadius.circular(18.r),

              ),

              child: Row(

                children: [

                  Container(

                    width: 80.w,

                    height: 80.w,

                    decoration: BoxDecoration(

                      color: AppColors.primaryColor
                          .withOpacity(.10),

                      borderRadius:
                      BorderRadius.circular(15.r),

                    ),

                    child: Icon(

                      Iconsax.shopping_bag,

                      color: AppColors.primaryColor,

                      size: 38.sp,

                    ),

                  ),

                  SizedBox(width: 16.w),

                  Expanded(

                    child: Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          "Nike Air Max",
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5.h),

                        Text(
                          "Shoes",
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.grey,
                          ),
                        ),

                        SizedBox(height: 12.h),

                        Text(
                          "Current Stock : 58 Units",
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ],

                    ),

                  ),

                ],

              ),

            ),

            SizedBox(height: 24.h),

            Text(
              "Update Type",
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 12.h),

            Row(

              children: [

                Expanded(
                  child: ChoiceChip(
                    label: const Text("Add Stock"),
                    selected: isAddStock,
                    onSelected: (_) {
                      setState(() {
                        isAddStock = true;
                      });
                    },
                  ),
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: ChoiceChip(
                    label: const Text("Remove Stock"),
                    selected: !isAddStock,
                    onSelected: (_) {
                      setState(() {
                        isAddStock = false;
                      });
                    },
                  ),
                ),

              ],

            ),

            SizedBox(height: 24.h),

            TextField(
              controller: stockController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Quantity",
                hintText: "Enter quantity",
                prefixIcon: const Icon(Iconsax.box),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(14.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            TextField(
              controller: reasonController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Reason",
                hintText:
                "Enter reason for stock update",
                alignLabelWithHint: true,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 70),
                  child: Icon(Iconsax.note),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(14.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 24.h),

            Container(

              width: double.infinity,

              padding: EdgeInsets.all(16.w),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(16.r),
              ),

              child: Row(

                children: [

                  const Icon(
                    Iconsax.calendar,
                    color: Colors.blue,
                  ),

                  SizedBox(width: 10.w),

                  Expanded(
                    child: Text(
                      "Last Updated : Today, 10:35 AM",
                      style: AppTextStyles.bodyMedium,
                    ),
                  ),

                ],

              ),

            ),

            SizedBox(height: 40.h),

            SizedBox(

              width: double.infinity,

              height: 55.h,

              child: ElevatedButton.icon(

                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(14.r),
                  ),
                ),

                icon: Icon(
                  isAddStock
                      ? Iconsax.add_circle
                      : Iconsax.minus_cirlce,
                ),

                label: Text(
                  isAddStock
                      ? "Add Stock"
                      : "Remove Stock",
                ),

              ),

            ),

            SizedBox(height: 30.h),

          ],

        ),

      ),

    );

  }

}