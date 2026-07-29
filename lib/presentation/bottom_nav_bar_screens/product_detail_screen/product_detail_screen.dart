import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_images.dart';
import 'package:multi_trendzz/core/constants/app_texts.dart';
import 'package:multi_trendzz/core/model/cart_item_model.dart';
import 'package:multi_trendzz/core/model/product_color_model.dart';
import 'package:multi_trendzz/core/model/product_detail_item.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';
import 'package:multi_trendzz/data/cart_dummy_data.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    this.product,
  });

  final ProductDetailModel? product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ProductDetailModel product;

  int selectedImageIndex = 0;
  int selectedColorIndex = 0;
  bool isFavorite = false;
  bool isExpanded = false;
  bool isAddedToCart = false;

  @override
  void initState() {
    super.initState();

    product = widget.product ??
        ProductDetailModel(
          category: 'Furniture',
          title: 'Modern Sofa Chair',
          rating: 4.5,
          totalPrice: 120.00,
          sellerName: 'Joshua Doe',
          sellerRole: 'Manager',
          sellerImage: AppImages.userImage1,
          description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          images: [
            AppImages.shoesImage1,
            AppImages.shoesImage1,
            AppImages.shoesImage1,
            AppImages.shoesImage1,
            AppImages.shoesImage1,
          ],
          colors: [
            ProductColorModel(
              name: 'Brown',
              color: const Color(0xFF8B5A2B),
            ),
            ProductColorModel(
              name: 'Black',
              color: const Color(0xFF222222),
            ),
            ProductColorModel(
              name: 'Grey',
              color: const Color(0xFF9E9E9E),
            ),
          ],
        );

    isFavorite = product.isFavorite;
    isAddedToCart = CartDummyData.isProductInCart(product.title);
  }


  void addProductToCart() {
    if (isAddedToCart) {
      context.push(AppRoutes.cartScreen);
      return;
    }

    CartDummyData.addToCart(
      CartItemModel(
        imagePath: product.images.first,
        title: product.title,
        category: product.category,
        price: product.totalPrice,
        quantity: 1,
      ),
    );

    setState(() {
      isAddedToCart = true;
    });

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('${product.title} added to cart'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.primaryColor,
        ),
      );
  }


  @override
  Widget build(BuildContext context) {
    final ProductColorModel selectedColor =
    product.colors[selectedColorIndex];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightColor,
        appBar: AppBar(
          backgroundColor: AppColors.lightColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leadingWidth: 60.w,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              top: 8.h,
              bottom: 8.h,
            ),
            child: CustomBackButtonWidget(
              onTap: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go(AppRoutes.rootScreen);
                }
              },
            ),
          ),
          title: Text(
            AppStrings.productDetail,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 14.w,
                top: 8.h,
                bottom: 8.h,
              ),
              child: CustomBackButtonWidget(
                icon: isFavorite ? Iconsax.heart5 : Iconsax.heart,
                iconColor: isFavorite
                    ? AppColors.primaryColor
                    : AppColors.textPrimary,
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 110.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductImageSection(),

                    _buildDetailContent(selectedColor),
                  ],
                ),
              ),
            ),

            _buildBottomCartBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImageSection() {
    return Container(
      width: double.infinity,
      color: AppColors.lightColor,
      child: Column(
        children: [
          SizedBox(height: 10.h),

          SizedBox(
            height: 235.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 22.h,
                  child: Container(
                    width: 230.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1.3.w,
                      ),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 28.h,
                  child: Container(
                    width: 26.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.swap_horiz_rounded,
                        color: AppColors.white,
                        size: 12.sp,
                      ),
                    ),
                  ),
                ),

                _buildImageWithShimmer(
                  imagePath: product.images[selectedImageIndex],
                  width: 210.w,
                  height: 210.h,
                  fit: BoxFit.contain,
                  borderRadius: 18.r,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 58.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              itemCount: product.images.length + 1,
              separatorBuilder: (context, index) {
                return SizedBox(width: 8.w);
              },
              itemBuilder: (context, index) {
                if (index == product.images.length) {
                  return _buildMoreImageBox();
                }

                return _buildThumbnailItem(index);
              },
            ),
          ),

          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildThumbnailItem(int index) {
    final bool isSelected = selectedImageIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImageIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 48.w,
        height: 52.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.borderColor,
            width: isSelected ? 1.4.w : 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.04),
              blurRadius: 8.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: _buildImageWithShimmer(
            imagePath: product.images[index],
            width: 48.w,
            height: 52.h,
            fit: BoxFit.cover,
            borderRadius: 8.r,
          ),
        ),
      ),
    );
  }

  Widget _buildImageWithShimmer({
    required String imagePath,
    required double width,
    required double height,
    required BoxFit fit,
    required double borderRadius,
  }) {
    final bool isNetworkImage = imagePath.startsWith('http');

    if (isNetworkImage) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.network(
          imagePath,
          width: width,
          height: height,
          fit: fit,
          loadingBuilder: (
              BuildContext context,
              Widget child,
              ImageChunkEvent? loadingProgress,
              ) {
            if (loadingProgress == null) {
              return child;
            }

            return _buildImageShimmer(
              width: width,
              height: height,
              borderRadius: borderRadius,
            );
          },
          errorBuilder: (
              BuildContext context,
              Object error,
              StackTrace? stackTrace,
              ) {
            return _buildImageErrorBox(
              width: width,
              height: height,
              borderRadius: borderRadius,
            );
          },
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }

  Widget _buildImageShimmer({
    required double width,
    required double height,
    required double borderRadius,
  }) {
    return Shimmer.fromColors(
      baseColor: AppColors.borderColor.withOpacity(0.45),
      highlightColor: AppColors.white.withOpacity(0.95),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  Widget _buildImageErrorBox({
    required double width,
    required double height,
    required double borderRadius,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: AppColors.textHint,
          size: 34.sp,
        ),
      ),
    );
  }

  Widget _buildMoreImageBox() {
    return Container(
      width: 48.w,
      height: 52.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      alignment: Alignment.center,
      child: Text(
        '+10',
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildDetailContent(ProductColorModel selectedColor) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        16.w,
        24.h,
        16.w,
        20.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(2.r),
          topRight: Radius.circular(2.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryAndRating(),

          SizedBox(height: 12.h),

          Text(
            product.title,
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.textPrimary,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 20.h),

          _buildSellerSection(),

          SizedBox(height: 18.h),

          Text(
            'Product Details',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 8.h),

          _buildDescription(),

          SizedBox(height: 14.h),

          Divider(
            color: AppColors.borderColor,
            thickness: 1.h,
          ),

          SizedBox(height: 10.h),

          Row(
            children: [
              Text(
                'Select Color : ',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                selectedColor.name,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          _buildColorSelector(),
        ],
      ),
    );
  }

  Widget _buildCategoryAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          product.category,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textHint,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),

        Row(
          children: [
            Icon(
              Icons.star_rounded,
              color: const Color(0xFFFFB800),
              size: 22.sp,
            ),

            SizedBox(width: 4.w),

            Text(
              product.rating.toStringAsFixed(1),
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSellerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Seller',
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 10.h),

        Row(
          children: [
            CircleAvatar(
              radius: 26.r,
              backgroundColor: AppColors.primaryLight,
              backgroundImage: _getSellerImageProvider(product.sellerImage),
            ),

            SizedBox(width: 10.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.sellerName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(height: 2.h),

                  Text(
                    product.sellerRole,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            _buildSellerActionButton(
              icon: Iconsax.message,
              onTap: () {},
            ),

            SizedBox(width: 12.w),

            _buildSellerActionButton(
              icon: Iconsax.call,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  ImageProvider _getSellerImageProvider(String imagePath) {
    if (imagePath.startsWith('http')) {
      return NetworkImage(imagePath);
    }

    return AssetImage(imagePath);
  }

  Widget _buildSellerActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 44.w,
        height: 44.w,
        decoration: BoxDecoration(
          color: AppColors.greyColor.withOpacity(0.08),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: AppColors.primaryColor,
          size: 20.sp,
        ),
      ),
    );
  }

  Widget _buildDescription() {
    final String description = product.description;

    return RichText(
      text: TextSpan(
        text: isExpanded || description.length <= 115
            ? description
            : '${description.substring(0, 115)} ',
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textSecondary,
          fontSize: 14.sp,
          height: 1.3,
          fontWeight: FontWeight.w500,
        ),
        children: [
          if (description.length > 115)
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? ' Read less' : 'Read more',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildColorSelector() {
    return Row(
      children: List.generate(
        product.colors.length,
            (index) {
          final ProductColorModel item = product.colors[index];
          final bool isSelected = selectedColorIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedColorIndex = index;
              });
            },
            child: Container(
              width: 34.w,
              height: 34.w,
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                color: item.color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.borderColor,
                  width: isSelected ? 3.w : 1.w,
                ),
              ),
              child: isSelected
                  ? Icon(
                Icons.check,
                color: AppColors.white,
                size: 17.sp,
              )
                  : null,
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomCartBar() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        16.w,
        12.h,
        16.w,
        18.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 18.r,
            offset: Offset(0, -6.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total Price',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 2.h),

                Text(
                  '\$${product.totalPrice.toStringAsFixed(2)}',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 14.w),

          Expanded(
            flex: 2,
            child: SizedBox(
              height: 54.h,
              child: ElevatedButton(
                onPressed: addProductToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isAddedToCart
                      ? AppColors.success
                      : AppColors.primaryColor,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isAddedToCart ? Icons.check_rounded : Iconsax.bag_2,
                      color: AppColors.white,
                      size: 20.sp,
                    ),

                    SizedBox(width: 10.w),

                    Text(
                      isAddedToCart ? 'Added' : 'Add to Cart',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}