import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/product_detail/widgets/product_detail_action_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/product_detail/widgets/product_detail_description_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/product_detail/widgets/product_detail_image_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/product_detail/widgets/product_detail_info_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/product_detail/widgets/product_detail_inventory_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/product_detail/widgets/product_detail_price_widget.dart';


class SellerProductDetailScreen extends StatefulWidget {
  const SellerProductDetailScreen({super.key});

  @override
  State<SellerProductDetailScreen> createState() =>
      _SellerProductDetailScreenState();
}

class _SellerProductDetailScreenState
    extends State<SellerProductDetailScreen> {

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(

      value: const SystemUiOverlayStyle(

        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,

      ),

      child: Scaffold(

        backgroundColor: const Color(0xffF5F6FA),

        appBar: AppBar(

          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,

          title: const Text(
            "Product Details",
          ),

        ),

        body: SingleChildScrollView(

          child: Column(

            children: [

              /// Images

              const ProductDetailImageWidget(),

              /// Product Info

              const ProductDetailInfoWidget(

                productName:
                "Nike Air Max Sneakers",

                category:
                "Footwear",

                brand:
                "Nike",

                sku:
                "NK-1001",

                rating:
                4.8,

                totalSold:
                325,

                isActive:
                true,

              ),

              const SizedBox(height: 18),

              /// Price

              const ProductDetailPriceWidget(

                sellingPrice:
                149.99,

                discountPrice:
                129.99,

                costPrice:
                90.00,

                taxPercentage:
                10,

              ),

              const SizedBox(height: 18),

              /// Inventory

              const ProductDetailInventoryWidget(

                stock:
                45,

                weight:
                0.85,

                length:
                30,

                width:
                18,

                height:
                12,

                isActive:
                true,

                isFeatured:
                true,

                createdAt:
                "12 Jul 2026",

                updatedAt:
                "28 Jul 2026",

              ),

              const SizedBox(height: 18),

              /// Description

              const ProductDetailDescriptionWidget(

                description:

                "Nike Air Max is designed with premium cushioning technology for maximum comfort. It features a breathable mesh upper, lightweight sole, durable rubber outsole and modern styling suitable for sports, running and casual everyday wear.",

                tags: [

                  "Nike",

                  "Shoes",

                  "Running",

                  "Sports",

                  "Men",

                  "Fashion",

                ],

              ),

              /// Action Buttons

              ProductDetailActionWidget(

                onEdit: () {

                  /// Navigate Edit Product

                  // Navigator.push(...);

                },

                onShare: () {

                  /// Share Product

                },

                onDelete: () {

                  /// Delete Product

                },

              ),

              const SizedBox(height: 25),

            ],

          ),

        ),

      ),

    );

  }

}