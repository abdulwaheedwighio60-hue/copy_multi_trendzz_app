import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/presentation/seller/products/add_product_screen/product_inventory_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/add_product_screen/widgets/product_image_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/add_product_screen/widgets/product_status_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/add_product_screen/widgets/product_variant_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/add_product_screen/widgets/publish_button_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/add_product_screen/widgets/shipping_info_widget.dart';
import 'widgets/product_basic_info_widget.dart';
import 'widgets/product_pricing_widget.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,

        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),

        title: Text(
          "Add Product",
          style: AppTextStyles.titleMedium,
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Images
            const ProductImagesWidget(),

            SizedBox(height: 25.h),

            /// Basic Info
            const ProductBasicInfoWidget(),

            SizedBox(height: 25.h),

            /// Pricing
            const ProductPricingWidget(),

            SizedBox(height: 25.h),

            /// Inventory
            const ProductInventoryWidget(),

            SizedBox(height: 25.h),

            /// Variants
            const ProductVariantWidget(),

            SizedBox(height: 25.h),

            /// Shipping
            const ShippingInfoWidget(),

            SizedBox(height: 25.h),

            /// Product Status
            const ProductStatusWidget(),

            SizedBox(height: 35.h),

            /// Publish Button
            const PublishButtonWidget(),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}