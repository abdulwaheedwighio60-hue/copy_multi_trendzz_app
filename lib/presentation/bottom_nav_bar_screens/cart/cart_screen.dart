import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_images.dart';
import 'package:multi_trendzz/core/model/cart_item_model.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';
import 'package:multi_trendzz/data/cart_dummy_data.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/cart/widgets/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController promoCodeController = TextEditingController();

  double deliveryFee = 25.00;
  double discount = 35.00;

  // final List<CartItemModel> cartItems = [
  //   CartItemModel(
  //     imagePath: AppImages.shoesImage1,
  //     title: 'Light Brown Coat',
  //     category: 'Clothes',
  //     price: 120.00,
  //     quantity: 1,
  //   ),
  //   CartItemModel(
  //     imagePath: AppImages.shoesImage1,
  //     title: 'Nike Pegasus 39',
  //     category: 'Shoes',
  //     price: 90.00,
  //     quantity: 1,
  //   ),
  //   CartItemModel(
  //     imagePath: AppImages.shoesImage1,
  //     title: 'Nike Pegasus',
  //     category: 'Shoes',
  //     price: 85.00,
  //     quantity: 1,
  //   ),
  //   CartItemModel(
  //     imagePath: AppImages.shoesImage1,
  //     title: 'Grey Chair',
  //     category: 'Furniture',
  //     price: 120.00,
  //     quantity: 1,
  //   ),
  // ];

  List<CartItemModel> get cartItems => CartDummyData.cartItems;
  double get subTotal {
    return cartItems.fold(
      0,
          (sum, item) => sum + item.totalPrice,
    );
  }

  double get totalCost {
    return subTotal + deliveryFee - discount;
  }

  void increaseQuantity(int index) {
    setState(() {
      CartDummyData.increaseQuantity(index);
    });
  }


  void decreaseQuantity(int index) {
    setState(() {
      CartDummyData.decreaseQuantity(index);
    });
  }

  void removeItem(int index) {
    setState(() {
      CartDummyData.removeAt(index);
    });
  }

  void applyPromoCode() {
    final String promoCode = promoCodeController.text.trim();

    if (promoCode.isEmpty) {
      _showMessage('Please enter promo code');
      return;
    }

    setState(() {
      discount = 35.00;
    });

    _showMessage('Promo code applied successfully');
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.primaryColor,
        ),
      );
  }

  @override
  void dispose() {
    promoCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

          title: Text(
            'My Cart',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: cartItems.isEmpty
            ? _buildEmptyCart()
            : Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  20.w,
                  10.h,
                  20.w,
                  20.h,
                ),
                itemCount: cartItems.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 24.h,
                    color: AppColors.borderColor,
                  );
                },
                itemBuilder: (context, index) {
                  final CartItemModel item = cartItems[index];

                  return CartItemWidget(
                    item: item,
                    onIncrease: () => increaseQuantity(index),
                    onDecrease: () => decreaseQuantity(index),
                    onRemove: () => removeItem(index),
                  );
                },
              ),
            ),

            _buildCartSummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildCartSummary() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20.w,
        18.h,
        20.w,
        24.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 22.r,
            offset: Offset(0, -8.h),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPromoCodeField(),

            SizedBox(height: 20.h),

            _buildPriceRow(
              title: 'Sub-Total',
              value: subTotal,
            ),

            SizedBox(height: 10.h),

            _buildPriceRow(
              title: 'Delivery Fee',
              value: deliveryFee,
            ),

            SizedBox(height: 10.h),

            _buildPriceRow(
              title: 'Discount',
              value: -discount,
            ),

            SizedBox(height: 14.h),

            Divider(
              color: AppColors.borderColor,
              thickness: 1.h,
            ),

            SizedBox(height: 12.h),

            _buildPriceRow(
              title: 'Total Cost',
              value: totalCost,
              isTotal: true,
            ),

            SizedBox(height: 22.h),

            SizedBox(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint('Proceed to checkout');
                  context.go(AppRoutes.proceedToCheckOutScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
                child: Text(
                  'Proceed to Checkout',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.white,
                    fontSize: 16.sp,
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

  Widget _buildPromoCodeField() {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: promoCodeController,
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                hintText: 'Promo Code',
                hintStyle: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textHint,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: SizedBox(
              height: 42.h,
              child: ElevatedButton(
                onPressed: applyPromoCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
                child: Text(
                  'Apply',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow({
    required String title,
    required double value,
    bool isTotal = false,
  }) {
    final bool isNegative = value < 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            fontSize: isTotal ? 15.sp : 14.sp,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
        Text(
          '${isNegative ? '-\$' : '\$'}${value.abs().toStringAsFixed(2)}',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textPrimary,
            fontSize: isTotal ? 15.sp : 14.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Iconsax.shopping_cart,
              color: AppColors.textHint,
              size: 80.sp,
            ),
            SizedBox(height: 18.h),
            Text(
              'Your cart is empty',
              style: AppTextStyles.headlineMedium.copyWith(
                color: AppColors.textPrimary,
                fontSize: 22.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Add products to your cart and they will appear here.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14.sp,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}