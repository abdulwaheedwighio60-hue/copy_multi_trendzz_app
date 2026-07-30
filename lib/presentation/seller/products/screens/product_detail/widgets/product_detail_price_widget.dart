import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';


class ProductDetailPriceWidget extends StatelessWidget {
  final double sellingPrice;
  final double discountPrice;
  final double costPrice;
  final double taxPercentage;

  const ProductDetailPriceWidget({
    super.key,
    required this.sellingPrice,
    required this.discountPrice,
    required this.costPrice,
    required this.taxPercentage,
  });

  @override
  Widget build(BuildContext context) {
    final double profit = sellingPrice - costPrice;
    final double profitPercentage =
    costPrice == 0 ? 0 : (profit / costPrice) * 100;

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
            "Pricing Details",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20.h),

          _priceTile(
            icon: Iconsax.money_recive,
            title: "Selling Price",
            value: "\$${sellingPrice.toStringAsFixed(2)}",
            color: Colors.green,
          ),

          SizedBox(height: 14.h),

          _priceTile(
            icon: Iconsax.discount_shape,
            title: "Discount Price",
            value: "\$${discountPrice.toStringAsFixed(2)}",
            color: Colors.orange,
          ),

          SizedBox(height: 14.h),

          _priceTile(
            icon: Iconsax.wallet_2,
            title: "Cost Price",
            value: "\$${costPrice.toStringAsFixed(2)}",
            color: Colors.blue,
          ),

          SizedBox(height: 14.h),

          _priceTile(
            icon: Iconsax.receipt_discount,
            title: "Tax",
            value: "${taxPercentage.toStringAsFixed(1)} %",
            color: Colors.purple,
          ),

          SizedBox(height: 20.h),

          Divider(),

          SizedBox(height: 18.h),

          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(.08),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              children: [

                Icon(
                  Iconsax.chart_success,
                  color: Colors.green,
                  size: 28.sp,
                ),

                SizedBox(width: 14.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Estimated Profit",
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey.shade700,
                        ),
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        "\$${profit.toStringAsFixed(2)}",
                        style: AppTextStyles.titleLarge.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "${profitPercentage.toStringAsFixed(1)}%",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _priceTile({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [

        Container(
          width: 42.w,
          height: 42.w,
          decoration: BoxDecoration(
            color: color.withOpacity(.12),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            icon,
            color: color,
            size: 20.sp,
          ),
        ),

        SizedBox(width: 14.w),

        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodyMedium,
          ),
        ),

        Text(
          value,
          style: AppTextStyles.titleMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    );
  }
}