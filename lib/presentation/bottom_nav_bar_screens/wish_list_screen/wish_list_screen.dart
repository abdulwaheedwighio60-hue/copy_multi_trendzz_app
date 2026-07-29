import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_images.dart';
import 'package:multi_trendzz/core/model/product_item.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/flash_sale_chip_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/flash_sale_product_card_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int selectedWishlistIndex = 0;

  final List<String> wishlistChips = [
    'All',
    'Newest',
    'Popular',
    'Clothes',
    'Shoes',
  ];

  final List<ProductItem> allProducts = [
    ProductItem(
      imagePath: AppImages.shoesImage1,
      productName: 'Nike Pegasus 39',
      price: '\$90.00',
      rating: '4.9',
      category: 'Shoes',
      isFavorite: true,
    ),
    ProductItem(
      imagePath: AppImages.shoesImage1,
      productName: 'Nike Air Max',
      price: '\$120.00',
      rating: '4.8',
      category: 'Shoes',
      isFavorite: true,
    ),
    ProductItem(
      imagePath: AppImages.shoesImage1,
      productName: 'Men Shirt',
      price: '\$35.00',
      rating: '4.7',
      category: 'Clothes',
      isFavorite: true,
    ),
    ProductItem(
      imagePath: AppImages.shoesImage1,
      productName: 'Smart Watch',
      price: '\$55.00',
      rating: '4.6',
      category: 'Popular',
      isFavorite: true,
    ),
    ProductItem(
      imagePath: AppImages.shoesImage1,
      productName: 'Leather Bag',
      price: '\$70.00',
      rating: '4.5',
      category: 'Newest',
      isFavorite: true,
    ),
    ProductItem(
      imagePath: AppImages.shoesImage1,
      productName: 'Running Shoes',
      price: '\$85.00',
      rating: '4.7',
      category: 'Newest',
      isFavorite: true,
    ),
  ];

  List<ProductItem> get filteredProducts {
    final String selectedChip = wishlistChips[selectedWishlistIndex];

    if (selectedChip == 'All') {
      return allProducts;
    }

    return allProducts.where((product) {
      return product.category.toLowerCase() == selectedChip.toLowerCase();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leadingWidth: 65.w,
          title: Text(
            'My Wishlist',
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.textPrimary,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              top: 6.h,
              bottom: 6.h,
            ),
            child: CustomBackButtonWidget(
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),

            /// Static Chips Section
            SizedBox(
              height: 42.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                itemCount: wishlistChips.length,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10.w);
                },
                itemBuilder: (context, index) {
                  return FlashSaleChipWidget(
                    title: wishlistChips[index],
                    isSelected: selectedWishlistIndex == index,
                    onTap: () {
                      setState(() {
                        selectedWishlistIndex = index;
                      });

                      debugPrint(
                        'Selected Wishlist Chip: ${wishlistChips[index]}',
                      );
                    },
                  );
                },
              ),
            ),

            SizedBox(height: 16.h),

            /// Scrollable Grid Section Only
            Expanded(
              child: filteredProducts.isEmpty
                  ? _buildEmptyWishlist()
                  : GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  14.w,
                  0,
                  14.w,
                  110.h,
                ),
                itemCount: filteredProducts.length,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.80,
                ),
                itemBuilder: (context, index) {
                  final ProductItem product =
                  filteredProducts[index];

                  return FlashSaleProductCardWidget(
                    imagePath: product.imagePath,
                    productName: product.productName,
                    price: product.price,
                    rating: product.rating,
                    isFavorite: product.isFavorite,
                    onTap: () {
                      debugPrint(
                        'Wishlist product clicked: ${product.productName}',
                      );
                    },
                    onFavoriteTap: () {
                      debugPrint(
                        'Remove from wishlist: ${product.productName}',
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

  Widget _buildEmptyWishlist() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border_rounded,
              color: AppColors.textHint,
              size: 70.sp,
            ),

            SizedBox(height: 16.h),

            Text(
              'No products found',
              textAlign: TextAlign.center,
              style: AppTextStyles.headlineMedium.copyWith(
                color: AppColors.textPrimary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 8.h),

            Text(
              'There are no wishlist items available in this category.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14.sp,
                height: 1.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}