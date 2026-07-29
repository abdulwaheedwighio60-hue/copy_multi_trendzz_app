import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/app_snack_bar.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({super.key});

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  final TextEditingController amountController = TextEditingController();

  final double walletBalance = 12000.00;

  int selectedAmountIndex = -1;
  int selectedPaymentMethodIndex = 0;

  final List<double> quickAmounts = [
    100,
    200,
    500,
    1000,
    2000,
    3000,
    4000,
    5000,
  ];

  final List<WalletPaymentMethodModel> paymentMethods = [
    WalletPaymentMethodModel(
      title: 'EasyPaisa',
      subtitle: 'Pay securely with your EasyPaisa wallet',
      icon: Iconsax.wallet_2,
    ),
    WalletPaymentMethodModel(
      title: 'Bank Transfer',
      subtitle: 'Transfer from your bank account',
      icon: Iconsax.bank,
    ),
    WalletPaymentMethodModel(
      title: 'Debit / Credit Card',
      subtitle: 'Pay using saved or new card',
      icon: Iconsax.card,
    ),
  ];

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  double get selectedAmount {
    return double.tryParse(amountController.text.trim()) ?? 0;
  }

  void selectQuickAmount(int index) {
    setState(() {
      selectedAmountIndex = index;
      amountController.text = quickAmounts[index].toStringAsFixed(0);
    });
  }

  void continueAddMoney() {
    FocusScope.of(context).unfocus();

    if (selectedAmount <= 0) {
      AppSnackBar.show(
        context: context,
        type: AppSnackBarType.warning,
        title: 'Amount Required',
        message: 'Please enter or select a valid amount to continue.',
      );
      return;
    }

    if (selectedAmount < 100) {
      AppSnackBar.show(
        context: context,
        type: AppSnackBarType.warning,
        title: 'Minimum Amount',
        message: 'Minimum wallet top-up amount is \$100.00.',
      );
      return;
    }

    final WalletPaymentMethodModel method =
    paymentMethods[selectedPaymentMethodIndex];

    debugPrint('ADD MONEY AMOUNT: $selectedAmount');
    debugPrint('PAYMENT METHOD: ${method.title}');

    showPaymentConfirmationSheet();
  }

  void showPaymentConfirmationSheet() {
    final WalletPaymentMethodModel method =
    paymentMethods[selectedPaymentMethodIndex];

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.transparent,
      isScrollControlled: true,
      builder: (BuildContext bottomSheetContext) {
        return Container(
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
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 42.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),

                SizedBox(height: 22.h),

                Container(
                  width: 70.w,
                  height: 70.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.10),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    method.icon,
                    color: AppColors.primaryColor,
                    size: 34.sp,
                  ),
                ),

                SizedBox(height: 18.h),

                Text(
                  'Confirm Add Money',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  'You are adding \$${selectedAmount.toStringAsFixed(2)} to your wallet using ${method.title}.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 14.sp,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 24.h),

                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 52.h,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(bottomSheetContext).pop();

                            AppSnackBar.show(
                              context: context,
                              type: AppSnackBarType.info,
                              title: 'Payment Cancelled',
                              message: 'Add money request has been cancelled.',
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.textPrimary,
                            side: BorderSide(
                              color: AppColors.borderColor,
                              width: 1.w,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textPrimary,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Expanded(
                      child: SizedBox(
                        height: 52.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(bottomSheetContext).pop();

                            // TODO:
                            // 1. Call Add Money API
                            // 2. Open EasyPaisa/Bank/Card gateway
                            // 3. On success update wallet balance

                            AppSnackBar.show(
                              context: context,
                              type: AppSnackBarType.info,
                              title: 'Payment Setup',
                              message:
                              'Payment gateway will be connected with API soon.',
                            );

                            // API success ke baad ye use karna:
                            /*
                            AppSnackBar.show(
                              context: context,
                              type: AppSnackBarType.success,
                              title: 'Money Added',
                              message:
                                  '\$${selectedAmount.toStringAsFixed(2)} has been added to your wallet successfully.',
                            );
                            */

                            // API error ke case mein ye use karna:
                            /*
                            AppSnackBar.show(
                              context: context,
                              type: AppSnackBarType.error,
                              title: 'Payment Failed',
                              message:
                                  'Unable to add money. Please try again later.',
                            );
                            */
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
                            'Confirm',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardOpen =
        MediaQuery.of(context).viewInsets.bottom > 0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: true,
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
                } else {
                  context.go(AppRoutes.walletScreen);
                }
              },
            ),
          ),
          title: Text(
            'Add Money',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontSize: 17.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.manual,
                padding: EdgeInsets.fromLTRB(
                  20.w,
                  16.h,
                  20.w,
                  isKeyboardOpen ? 24.h : 120.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildWalletCard(),

                    SizedBox(height: 22.h),

                    _buildPaymentMethods(),
                  ],
                ),
              ),
            ),

            if (!isKeyboardOpen) _buildBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.10),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wallet Balance',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      '\$ ${walletBalance.toStringAsFixed(2)}',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: 42.w,
                height: 42.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Iconsax.wallet_3,
                  color: AppColors.primaryColor,
                  size: 24.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          _buildQuickAmountGrid(),

          SizedBox(height: 14.h),

          _buildAmountField(),
        ],
      ),
    );
  }

  Widget _buildQuickAmountGrid() {
    return GridView.builder(
      itemCount: quickAmounts.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 8.w,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) {
        final bool isSelected = selectedAmountIndex == index;

        return InkWell(
          onTap: () {
            selectQuickAmount(index);
          },
          borderRadius: BorderRadius.circular(8.r),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.borderColor,
                width: 1.w,
              ),
            ),
            child: Text(
              '+ \$${quickAmounts[index].toStringAsFixed(0)}',
              style: AppTextStyles.bodySmall.copyWith(
                color: isSelected
                    ? AppColors.white
                    : AppColors.textPrimary,
                fontSize: 11.5.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAmountField() {
    return TextFormField(
      controller: amountController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (_) {
        setState(() {
          selectedAmountIndex = -1;
        });
      },
      cursorColor: AppColors.primaryColor,
      style: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.textPrimary,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            left: 14.w,
            right: 8.w,
          ),
          child: Text(
            '\$',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
              fontSize: 15.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 34.w,
          minHeight: 0,
        ),
        hintText: 'Enter Amount',
        hintStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textHint,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 14.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
          ),
        ),

        SizedBox(height: 12.h),

        ListView.separated(
          itemCount: paymentMethods.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.h);
          },
          itemBuilder: (context, index) {
            final WalletPaymentMethodModel method = paymentMethods[index];
            final bool isSelected = selectedPaymentMethodIndex == index;

            return InkWell(
              onTap: () {
                setState(() {
                  selectedPaymentMethodIndex = index;
                });

                AppSnackBar.show(
                  context: context,
                  type: AppSnackBarType.info,
                  title: 'Payment Method Selected',
                  message: '${method.title} has been selected.',
                  duration: const Duration(seconds: 2),
                );
              },
              borderRadius: BorderRadius.circular(14.r),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: EdgeInsets.all(14.sp),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryColor.withOpacity(0.07)
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.borderColor,
                    width: 1.w,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 42.w,
                      height: 42.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        method.icon,
                        color: AppColors.primaryColor,
                        size: 22.sp,
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            method.title,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textPrimary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                          SizedBox(height: 4.h),

                          Text(
                            method.subtitle,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      width: 22.w,
                      height: 22.w,
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.borderColor,
                          width: 2.w,
                        ),
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.transparent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
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
          height: 54.h,
          child: ElevatedButton(
            onPressed: continueAddMoney,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            child: Text(
              'Continue',
              style: AppTextStyles.bodyMedium.copyWith(
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

class WalletPaymentMethodModel {
  WalletPaymentMethodModel({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
}