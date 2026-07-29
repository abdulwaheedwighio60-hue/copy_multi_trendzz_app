import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_images.dart';
import 'package:multi_trendzz/core/model/payment_option_model.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';
import 'package:multi_trendzz/presentation/payment_method/widgets/payment_section_widget.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() =>
      _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String selectedPaymentMethod = 'Cash';

  final List<PaymentOptionModel> cashOptions = [
    PaymentOptionModel(
      title: 'Cash',
      icon: Iconsax.money,
      type: PaymentType.selectable,
    ),
  ];

  final List<PaymentOptionModel> walletOptions = [
    PaymentOptionModel(
      title: 'Wallet',
      icon: Iconsax.wallet_3,
      type: PaymentType.selectable,
    ),
  ];

  final List<PaymentOptionModel> cardOptions = [
    PaymentOptionModel(
      title: 'Add Card',
      icon: Iconsax.card,
      type: PaymentType.action,
    ),
  ];

  final List<PaymentOptionModel> moreOptions = [
    PaymentOptionModel(
      title: 'Easypaisa',
      imagePath: AppImages.easyPaisaIcon,
      type: PaymentType.payment,
    ),

    PaymentOptionModel(
      title: 'JazzCash',
      imagePath: AppImages.jazzCashIcon,
      type: PaymentType.payment,
    ),

    PaymentOptionModel(
      title: 'Stripe',
      imagePath: AppImages.stripeIcon,
      type: PaymentType.payment,
    ),

    PaymentOptionModel(
      title: 'Cash on Delivery',
      icon: Icons.local_shipping_outlined,
      type: PaymentType.payment,
    ),
  ];

  void selectPaymentMethod(String title) {
    setState(() {
      selectedPaymentMethod = title;
    });
  }

  void addCard() {
    debugPrint('Add Card clicked');
    context.push(AppRoutes.addCardScreen);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: const Text('Add card screen will open here.'),
          backgroundColor: AppColors.primaryColor,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  void confirmPayment() {
    debugPrint('SELECTED PAYMENT METHOD: $selectedPaymentMethod');

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            '$selectedPaymentMethod selected successfully.',
          ),
          backgroundColor: AppColors.primaryColor,
          behavior: SnackBarBehavior.floating,
        ),
      );

    // TODO: Navigate order success / place order screen.
    // context.go(AppRoutes.orderSuccessScreen);
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
          leading: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              top: 6.h,
              bottom: 6.h,
            ),
            child: CustomBackButtonWidget(
              onTap: () {
                if (context.canPop()) {
                  context.pop();
                }
              },
            ),
          ),
          title: Text(
            'Payment Methods',
            style: AppTextStyles.bodyLarge.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
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
                  12.h,
                  20.w,
                  110.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PaymentSectionWidget(
                      title: 'Cash',
                      options: cashOptions,
                      selectedPaymentMethod: selectedPaymentMethod,
                      onSelect: selectPaymentMethod,
                      onActionTap: addCard,
                    ),

                    SizedBox(height: 24.h),

                    PaymentSectionWidget(
                      title: 'Wallet',
                      options: walletOptions,
                      selectedPaymentMethod: selectedPaymentMethod,
                      onSelect: selectPaymentMethod,
                      onActionTap: addCard,
                    ),

                    SizedBox(height: 24.h),

                    PaymentSectionWidget(
                      title: 'Credit & Debit Card',
                      options: cardOptions,
                      selectedPaymentMethod: selectedPaymentMethod,
                      onSelect: selectPaymentMethod,
                      onActionTap: addCard,
                    ),

                    SizedBox(height: 24.h),

                    PaymentSectionWidget(
                      title: 'More Payment Options',
                      options: moreOptions,
                      selectedPaymentMethod: selectedPaymentMethod,
                      onSelect: selectPaymentMethod,
                      onActionTap: addCard,
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
            onPressed: confirmPayment,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            child: Text(
              'Confirm Payment',
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





