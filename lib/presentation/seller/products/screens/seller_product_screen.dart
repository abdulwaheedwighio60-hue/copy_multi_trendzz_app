import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import '../widgets/product_card_widget.dart';
import '../widgets/product_filter_widget.dart';
import '../widgets/product_header_widget.dart';
import '../widgets/product_summary_widget.dart';

class SellerProductScreen extends StatefulWidget {
  const SellerProductScreen({super.key});

  @override
  State<SellerProductScreen> createState() =>
      _SellerProductScreenState();
}

class _SellerProductScreenState
    extends State<SellerProductScreen> {

  int selectedFilter = 0;

  final List<Map<String, dynamic>> products = [

    {
      "image":
      "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600",
      "name":"Nike Air Max",
      "category":"Footwear",
      "sku":"NK-1001",
      "price":149.99,
      "stock":45,
      "rating":4.8,
      "sold":320,
      "status":ProductStatus.active,
    },

    {
      "image":
      "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600",
      "name":"Apple Watch",
      "category":"Electronics",
      "sku":"AW-2025",
      "price":399.99,
      "stock":10,
      "rating":4.9,
      "sold":180,
      "status":ProductStatus.lowStock,
    },

    {
      "image":
      "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600",
      "name":"iPhone 16 Pro",
      "category":"Mobile",
      "sku":"IP-16",
      "price":999.99,
      "stock":0,
      "rating":5.0,
      "sold":620,
      "status":ProductStatus.outOfStock,
    },

  ];

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(

      value: const SystemUiOverlayStyle(

        statusBarColor:
        AppColors.primaryColor,

        statusBarIconBrightness:
        Brightness.light,

      ),

      child: Scaffold(

        backgroundColor:
        const Color(0xffF7F8FA),

        body: SafeArea(

          child: Column(

            children: [

              ProductHeaderWidget(

                totalProducts:
                products.length,

                onAddProduct: () {

                  // Navigate Add Product

                },

                onSearch: () {},

                onFilter: () {},

              ),

              const SizedBox(height: 15),

              const ProductSummaryWidget(),

              const SizedBox(height: 15),

              ProductFilterWidget(

                selectedIndex:
                selectedFilter,

                onChanged: (index){

                  setState(() {

                    selectedFilter =
                        index;

                  });

                },

              ),

              const SizedBox(height: 10),

              Expanded(

                child: ListView.builder(

                  itemCount:
                  products.length,

                  padding:
                  const EdgeInsets.only(
                    bottom: 20,
                  ),

                  itemBuilder:
                      (context,index){

                    final product =
                    products[index];

                    return ProductCardWidget(

                      image:
                      product["image"],

                      productName:
                      product["name"],

                      category:
                      product["category"],

                      sku:
                      product["sku"],

                      price:
                      product["price"],

                      stock:
                      product["stock"],

                      rating:
                      product["rating"],

                      sold:
                      product["sold"],

                      status:
                      product["status"],

                      onView: (){

                        // Navigate Product Detail

                      },

                      onEdit: (){

                        // Navigate Edit Product

                      },

                      onDelete: (){

                        // Delete Product

                      },

                    );

                  },

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}