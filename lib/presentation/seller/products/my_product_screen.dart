import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/flash_sale_chip_widget.dart';
import 'package:multi_trendzz/presentation/seller/products/widgets/product_card_widgets.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

class MyProductsScreen extends StatefulWidget {
  const MyProductsScreen({super.key});

  @override
  State<MyProductsScreen> createState() => _MyProductsScreenState();
}

class _MyProductsScreenState extends State<MyProductsScreen> {


  final List<String> filters = [
    "All",
    "Active",
    "Draft",
    "Pending",
    "Out of Stock",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          "Add Product",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [

            ///===========================
            /// App Bar
            ///===========================

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 15.h,
              ),
              child: Row(
                children: [

                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),

                  SizedBox(width: 15.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Text(
                          "My Products",
                          style: AppTextStyles.headlineMedium,
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          "Manage your products",
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: 45.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: const Icon(Iconsax.notification),
                  )
                ],
              ),
            ),

            ///===========================
            /// Search
            ///===========================

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Products",

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

            SizedBox(height: 18.h),

            ///===========================
            /// Filter Chips
            ///===========================

            SizedBox(
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: filters.length,
                separatorBuilder: (_, __) => SizedBox(width: 10.w),
                itemBuilder: (context, index) {
                  return FlashSaleChipWidget(
                    title: filters[index],
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
            ),

            SizedBox(height: 20.h),

            ///===========================
            /// Statistics
            ///===========================

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [

                  Expanded(
                    child: _statCard(
                      "245",
                      "Products",
                      Iconsax.box,
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: _statCard(
                      "212",
                      "Active",
                      Iconsax.tick_circle,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [

                  Expanded(
                    child: _statCard(
                      "12",
                      "Low Stock",
                      Iconsax.warning_2,
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: _statCard(
                      "05",
                      "Out Stock",
                      Iconsax.close_circle,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            ///===========================
            /// Product List
            ///===========================

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ProductCardWidget(
                    image:
                    "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500",
                    productName: "Nike Air Max Sneakers",
                    sku: "SKU-100${index + 1}",
                    price: 129.99,
                    stock: 25,
                    sold: 120,
                    rating: 4.8,
                    isActive: index % 2 == 0,

                    onView: () {
                      // TODO: Navigate to Product Details
                      // context.push(AppRoutes.productDetailsScreen);
                    },

                    onEdit: () {
                      // TODO: Navigate to Edit Product
                      // context.push(AppRoutes.editProductScreen);
                    },

                    onDelete: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Delete Product"),
                          content: const Text(
                            "Are you sure you want to delete this product?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {
                                Navigator.pop(context);

                                // TODO: Delete Product API
                              },
                              child: const Text(
                                "Delete",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String text, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Chip(
        label: Text(text),
        backgroundColor: selected
            ? AppColors.primaryColor
            : Colors.white,
        labelStyle: TextStyle(
          color: selected
              ? Colors.white
              : Colors.black,
        ),
      ),
    );
  }

  Widget _statCard(
      String value,
      String title,
      IconData icon,
      ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(18.r),
      ),
      child: Column(
        children: [

          Icon(
            icon,
            color: AppColors.primaryColor,
          ),

          SizedBox(height: 10.h),

          Text(
            value,
            style: AppTextStyles.headlineMedium,
          ),

          SizedBox(height: 5.h),

          Text(title),
        ],
      ),
    );
  }
}