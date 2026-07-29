import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/flash_sale_product_card_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/flash_sale_header_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/category_button_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/dashboard_header_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/flash_sale_chip_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/home_banner_slider.dart';
import 'package:multi_trendzz/core/model/product_color_model.dart';
import 'package:multi_trendzz/core/model/product_detail_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_texts.dart';
import 'package:multi_trendzz/core/model/category_item.dart';
import 'package:multi_trendzz/core/model/product_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/data/product_dummy_data.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  ProductDetailModel convertToProductDetail(ProductItem product) {
    final double productPrice = double.tryParse(
      product.price.replaceAll('\$', '').trim(),
    ) ??
        0.0;

    final double productRating = double.tryParse(product.rating) ?? 0.0;

    return ProductDetailModel(
      category: product.category,
      title: product.productName,
      rating: productRating,
      totalPrice: productPrice,
      sellerName: product.sellerName,
      sellerRole: product.sellerRole,
      sellerImage: product.sellerImage,
      description: product.description,
      isFavorite: product.isFavorite,
      images: [
        product.imagePath,
        product.imagePath,
        product.imagePath,
        product.imagePath,
        product.imagePath,
      ],
      colors: [
        ProductColorModel(
          name: 'Black',
          color: const Color(0xFF222222),
        ),
        ProductColorModel(
          name: 'Red',
          color: AppColors.primaryColor,
        ),
        ProductColorModel(
          name: 'Grey',
          color: const Color(0xFF9E9E9E),
        ),
      ],
    );
  }

  final List<CategoryItem> categories = [
    CategoryItem(
      title: 'Clothes',
      icon: FontAwesomeIcons.shirt,
    ),
    CategoryItem(
      title: 'Shoes',
      icon: FontAwesomeIcons.shoePrints,
    ),
    CategoryItem(
      title: 'Watch',
      icon: FontAwesomeIcons.clock,
    ),
    CategoryItem(
      title: 'Bags',
      icon: FontAwesomeIcons.bagShopping,
    ),
    CategoryItem(
      title: 'Electronics',
      icon: FontAwesomeIcons.mobileScreen,
    ),
  ];

  final List<CategoryItem> allCategories = [
    CategoryItem(
      title: 'Clothes',
      icon: FontAwesomeIcons.shirt,
    ),
    CategoryItem(
      title: 'Electronics',
      icon: FontAwesomeIcons.mobileScreen,
    ),
    CategoryItem(
      title: 'Shoes',
      icon: FontAwesomeIcons.shoePrints,
    ),
    CategoryItem(
      title: 'Watch',
      icon: FontAwesomeIcons.clock,
    ),
    CategoryItem(
      title: 'Bags',
      icon: FontAwesomeIcons.bagShopping,
    ),
    CategoryItem(
      title: 'Furniture',
      icon: FontAwesomeIcons.couch,
    ),
    CategoryItem(
      title: 'Toys',
      icon: FontAwesomeIcons.horse,
    ),
    CategoryItem(
      title: 'Kitchen',
      icon: FontAwesomeIcons.utensils,
    ),
    CategoryItem(
      title: 'Glasses',
      icon: FontAwesomeIcons.glasses,
    ),
    CategoryItem(
      title: 'Jewelry',
      icon: FontAwesomeIcons.gem,
    ),
    CategoryItem(
      title: 'Laptops',
      icon: FontAwesomeIcons.laptop,
    ),
    CategoryItem(
      title: 'Mobile',
      icon: FontAwesomeIcons.mobile,
    ),
    CategoryItem(
      title: 'Camera',
      icon: FontAwesomeIcons.camera,
    ),
    CategoryItem(
      title: 'Pet Food',
      icon: FontAwesomeIcons.paw,
    ),
    CategoryItem(
      title: 'Skin Care',
      icon: FontAwesomeIcons.bottleDroplet,
    ),
    CategoryItem(
      title: 'Fitness',
      icon: FontAwesomeIcons.dumbbell,
    ),
    CategoryItem(
      title: 'Security',
      icon: FontAwesomeIcons.video,
    ),
    CategoryItem(
      title: 'Hardware',
      icon: FontAwesomeIcons.screwdriverWrench,
    ),
    CategoryItem(
      title: 'Gifts',
      icon: FontAwesomeIcons.gift,
    ),
    CategoryItem(
      title: 'Other',
      icon: FontAwesomeIcons.grip,
    ),
  ];

  final List<String> flashSaleChips = [
    'All',
    'Newest',
    'Popular',
    'Clothes',
    'Shoes',
  ];

  int selectedFlashSaleIndex = 0;
  bool isProductsLoading = false;
  String selectedCategoryTitle = 'All';

  List<ProductItem> displayedProducts = [];

  @override
  void initState() {
    super.initState();
    displayedProducts = ProductDummyData.products;
  }

  Future<void> filterProductsByCategory(String categoryTitle) async {
    setState(() {
      isProductsLoading = true;
      selectedCategoryTitle = categoryTitle;
      selectedFlashSaleIndex = 0;
    });

    await Future.delayed(const Duration(milliseconds: 850));

    if (!mounted) return;

    setState(() {
      if (categoryTitle.toLowerCase() == 'all') {
        displayedProducts = ProductDummyData.products;
      } else {
        displayedProducts =
            ProductDummyData.getProductsByCategory(categoryTitle);
      }

      isProductsLoading = false;
    });
  }

  Future<void> filterProductsByChip(int index) async {
    final String selectedChip = flashSaleChips[index];

    setState(() {
      selectedFlashSaleIndex = index;
      selectedCategoryTitle = selectedChip;
      isProductsLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 850));

    if (!mounted) return;

    setState(() {
      if (selectedChip.toLowerCase() == 'all') {
        displayedProducts = ProductDummyData.products;
      } else {
        displayedProducts =
            ProductDummyData.getProductsByCategory(selectedChip);
      }

      isProductsLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            const DashboardHeaderWidget(),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 110.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 14.h),

                    _buildSectionHeader(
                      title: AppStrings.specialOfferForYou,
                      showSeeAll: false,
                    ),

                    SizedBox(height: 8.h),

                    const HomeBannerSlider(),

                    SizedBox(height: 18.h),

                    _buildSectionHeader(
                      title: AppStrings.category,
                      showSeeAll: true,
                    ),

                    SizedBox(height: 12.h),

                    SizedBox(
                      height: 110.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: categories.length,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemBuilder: (context, index) {
                          final CategoryItem category = categories[index];

                          return Padding(
                            padding: EdgeInsets.only(right: 14.w),
                            child: CategoryButtonWidget(
                              title: category.title,
                              icon: category.icon,
                              onTap: () {
                                filterProductsByCategory(category.title);
                              },
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 10.h),

                    FlashSaleHeaderWidget(
                      initialDuration: const Duration(
                        hours: 2,
                        minutes: 12,
                        seconds: 56,
                      ),
                      onTimerFinished: () {
                        debugPrint('Flash sale finished');
                      },
                    ),

                    SizedBox(height: 8.h),

                    SizedBox(
                      height: 42.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        itemCount: flashSaleChips.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10.w);
                        },
                        itemBuilder: (context, index) {
                          return FlashSaleChipWidget(
                            title: flashSaleChips[index],
                            isSelected: selectedFlashSaleIndex == index,
                            onTap: () {
                              filterProductsByChip(index);
                            },
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 16.h),

                    _buildSelectedCategoryInfo(),

                    SizedBox(height: 12.h),

                    if (isProductsLoading)
                      _buildProductGridShimmer()
                    else if (displayedProducts.isEmpty)
                      _buildEmptyWishlist()
                    else
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.fromLTRB(
                          14.w,
                          0,
                          14.w,
                          20.h,
                        ),
                        itemCount: displayedProducts.length,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 0.80,
                        ),
                        itemBuilder: (context, index) {
                          final ProductItem product =
                          displayedProducts[index];

                          return FlashSaleProductCardWidget(
                            imagePath: product.imagePath,
                            productName: product.productName,
                            price: product.price,
                            rating: product.rating,
                            isFavorite: product.isFavorite,
                            onTap: () {
                              final ProductDetailModel detailProduct =
                              convertToProductDetail(product);

                              context.push(
                                AppRoutes.productDetailScreen,
                                extra: detailProduct,
                              );
                            },
                            // onTap: () {
                            //   debugPrint(
                            //     'Product clicked: ${product.productName}',
                            //   );
                            //   context.push(AppRoutes.productDetailScreen);
                            // },
                            onFavoriteTap: () {
                              debugPrint(
                                'Favorite clicked: ${product.productName}',
                              );
                            },
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedCategoryInfo() {
    if (selectedCategoryTitle == 'All') {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.18),
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Showing $selectedCategoryTitle products',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                filterProductsByCategory('All');
              },
              borderRadius: BorderRadius.circular(100.r),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Text(
                  'Clear',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGridShimmer() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(
        14.w,
        0,
        14.w,
        20.h,
      ),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.80,
      ),
      itemBuilder: (context, index) {
        return _buildProductShimmerCard();
      },
    );
  }

  Widget _buildProductShimmerCard() {
    return Shimmer.fromColors(
      baseColor: AppColors.borderColor.withOpacity(0.45),
      highlightColor: AppColors.white.withOpacity(0.95),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 115.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Container(
                    width: 75.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  Row(
                    children: [
                      Container(
                        width: 58.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),

                      const Spacer(),

                      Container(
                        width: 42.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                    ],
                  ),
                ],
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
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 40.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
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
              'There are no products available in this category.',
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

  Widget _buildSectionHeader({
    required String title,
    bool showSeeAll = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),

          if (showSeeAll)
            InkWell(
              onTap: () {
                showCategoryBottomSheet();
              },
              borderRadius: BorderRadius.circular(6.r),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 4.h,
                ),
                child: Text(
                  AppStrings.seeAll,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void showCategoryBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.transparent,
      isScrollControlled: true,
      builder: (BuildContext bottomSheetContext) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.82,
          padding: EdgeInsets.fromLTRB(
            20.w,
            14.h,
            20.w,
            24.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26.r),
              topRight: Radius.circular(26.r),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                Container(
                  width: 42.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),

                SizedBox(height: 18.h),

                Row(
                  children: [
                    SizedBox(width: 34.w),

                    Expanded(
                      child: Text(
                        'Category',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.of(bottomSheetContext).pop();
                      },
                      borderRadius: BorderRadius.circular(100.r),
                      child: Container(
                        width: 34.w,
                        height: 34.w,
                        decoration: BoxDecoration(
                          color: AppColors.lightColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close_rounded,
                          color: AppColors.textPrimary,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 22.h),

                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: allCategories.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 24.h,
                      crossAxisSpacing: 14.w,
                      childAspectRatio: 0.78,
                    ),
                    itemBuilder: (context, index) {
                      final CategoryItem category = allCategories[index];

                      return _buildBottomSheetCategoryItem(
                        category: category,
                        onTap: () {
                          Navigator.of(bottomSheetContext).pop();

                          filterProductsByCategory(category.title);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetCategoryItem({
    required CategoryItem category,
    required VoidCallback onTap,
  }) {
    final bool isSelected =
        selectedCategoryTitle.toLowerCase() == category.title.toLowerCase();

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 62.w,
            height: 62.w,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: FaIcon(
                category.icon,
                color: isSelected
                    ? AppColors.white
                    : AppColors.primaryColor,
                size: 25.sp,
              ),
            ),
          ),

          SizedBox(height: 9.h),

          Text(
            category.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall.copyWith(
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.textPrimary,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }


}