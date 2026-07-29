import 'package:multi_trendzz/core/model/cart_item_model.dart';
import 'package:multi_trendzz/core/model/shipping_model.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/constants/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/data/cart_dummy_data.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/proceed_to_check_out_screen/widgets/change_button_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/proceed_to_check_out_screen/widgets/check_out_order_item_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/proceed_to_check_out_screen/widgets/circle_icon.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/proceed_to_check_out_screen/widgets/selection_tile_widget.dart';



class ProceedToCheckOutScreen extends StatefulWidget {
  const ProceedToCheckOutScreen({super.key});

  @override
  State<ProceedToCheckOutScreen> createState() =>
      _ProceedToCheckOutScreenState();
}

class _ProceedToCheckOutScreenState extends State<ProceedToCheckOutScreen> {
  int selectedAddressIndex = 0;
  int selectedShippingIndex = 0;

  final List<ShippingAddressModel> addresses = [
    ShippingAddressModel(
      title: 'Home',
      address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
    ),
    ShippingAddressModel(
      title: 'Office',
      address: '4517 Washington Ave. Manchester, Kentucky 39495',
    ),
    ShippingAddressModel(
      title: 'Apartment',
      address: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
    ),
  ];

  final List<ShippingTypeModel> shippingTypes = [
    ShippingTypeModel(
      title: 'Economy',
      subtitle: 'Estimated Arrival',
      date: '25 September 2023',
      price: 5.00,
    ),
    ShippingTypeModel(
      title: 'Regular',
      subtitle: 'Estimated Arrival',
      date: '20 September 2023',
      price: 10.00,
    ),
    ShippingTypeModel(
      title: 'Express',
      subtitle: 'Estimated Arrival',
      date: '18 September 2023',
      price: 18.00,
    ),
  ];

  List<CartItemModel> get orderItems => CartDummyData.cartItems;

  ShippingAddressModel get selectedAddress => addresses[selectedAddressIndex];

  ShippingTypeModel get selectedShipping => shippingTypes[selectedShippingIndex];

  void _showAddressSheet() {
    _showSelectionSheet(
      title: 'Change Shipping Address',
      itemCount: addresses.length,
      selectedIndex: selectedAddressIndex,
      itemBuilder: (index) {
        final item = addresses[index];

        return SelectionTile(
          icon: Iconsax.location,
          title: item.title,
          subtitle: item.address,
          isSelected: selectedAddressIndex == index,
          onTap: () {
            setState(() {
              selectedAddressIndex = index;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _showShippingTypeSheet() {
    _showSelectionSheet(
      title: 'Choose Shipping Type',
      itemCount: shippingTypes.length,
      selectedIndex: selectedShippingIndex,
      itemBuilder: (index) {
        final item = shippingTypes[index];

        return SelectionTile(
          icon: Iconsax.box,
          title: item.title,
          subtitle: '${item.subtitle}  ${item.date}',
          trailingText: '\$${item.price.toStringAsFixed(2)}',
          isSelected: selectedShippingIndex == index,
          onTap: () {
            setState(() {
              selectedShippingIndex = index;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _showSelectionSheet({
    required String title,
    required int itemCount,
    required int selectedIndex,
    required Widget Function(int index) itemBuilder,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
      ),
      builder: (context) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 45.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),

                SizedBox(height: 18.h),

                Text(
                  title,
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: 16.h),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: itemCount,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  },
                  itemBuilder: (context, index) {
                    return itemBuilder(index);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _continueToPayment() {
    debugPrint('Selected Address: ${selectedAddress.title}');
    debugPrint('Selected Shipping: ${selectedShipping.title}');

    // TODO: Navigate payment screen
    context.go(AppRoutes.paymentMethodScreen);
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
          leading: Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              top: 8.h,
              bottom: 8.h,
            ),
            child: CustomBackButtonWidget(
              onTap: () {
                context.go(AppRoutes.rootScreen);
              },
            ),
          ),
          title: Text(
            'Checkout',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  20.w,
                  10.h,
                  20.w,
                  110.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Shipping Address'),

                    SizedBox(height: 14.h),

                    _buildAddressCard(),

                    SizedBox(height: 22.h),

                    Divider(
                      color: AppColors.borderColor,
                      thickness: 1.h,
                    ),

                    SizedBox(height: 20.h),

                    _buildSectionTitle('Choose Shipping Type'),

                    SizedBox(height: 14.h),

                    _buildShippingTypeCard(),

                    SizedBox(height: 22.h),

                    Divider(
                      color: AppColors.borderColor,
                      thickness: 1.h,
                    ),

                    SizedBox(height: 20.h),

                    _buildSectionTitle('Order List'),

                    SizedBox(height: 16.h),

                    ValueListenableBuilder<List<CartItemModel>>(
                      valueListenable: CartDummyData.cartNotifier,
                      builder: (context, cartItems, child) {
                        if (cartItems.isEmpty) {
                          return _buildEmptyCheckoutCart();
                        }

                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cartItems.length,
                          separatorBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              child: Divider(
                                color: AppColors.borderColor,
                                thickness: 1.h,
                              ),
                            );
                          },
                          itemBuilder: (context, index) {
                            final CartItemModel item = cartItems[index];

                            return CheckoutOrderItemWidget(
                              item: CheckoutOrderItemModel(
                                imagePath: item.imagePath,
                                title: item.title,
                                category: item.category,
                                price: item.totalPrice,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            _buildBottomButton(),
          ],
        ),
      ),
    );
  }
  Widget _buildEmptyCheckoutCart() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 28.h),
      child: Center(
        child: Column(
          children: [
            Icon(
              Iconsax.shopping_cart,
              color: AppColors.textHint,
              size: 62.sp,
            ),

            SizedBox(height: 14.h),

            Text(
              'No items in checkout',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textPrimary,
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
              ),
            ),

            SizedBox(height: 6.h),

            Text(
              'Please add products to cart before checkout.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontSize: 13.sp,
                height: 1.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.textPrimary,
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildAddressCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleIcon(icon: Iconsax.location),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedAddress.title,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 4.h),

              Text(
                selectedAddress.address,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 13.sp,
                  height: 1.25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: 10.w),

        ChangeButton(onTap: _showAddressSheet),
      ],
    );
  }

  Widget _buildShippingTypeCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleIcon(icon: Iconsax.box),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedShipping.title,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 4.h),

              RichText(
                text: TextSpan(
                  text: '${selectedShipping.subtitle}  ',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: selectedShipping.date,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: 10.w),

        ChangeButton(onTap: _showShippingTypeSheet),
      ],
    );
  }

  Widget _buildBottomButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20.w,
        12.h,
        20.w,
        24.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.r),
          topRight: Radius.circular(18.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 20.r,
            offset: Offset(0, -8.h),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: _continueToPayment,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            child: Text(
              'Continue to Payment',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}