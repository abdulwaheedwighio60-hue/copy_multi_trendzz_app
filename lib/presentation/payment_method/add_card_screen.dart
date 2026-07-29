import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/helper/save_card_local_service.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController cardHolderController =
  TextEditingController(text: 'Esther Howard');
  final TextEditingController cardNumberController =
  TextEditingController(text: '4716 9627 1635 8047');
  final TextEditingController expiryDateController =
  TextEditingController(text: '02/30');
  final TextEditingController cvvController =
  TextEditingController();

  bool saveCard = true;
  bool isLoadingSavedCards = false;

  String? selectedSavedCardId;

  List<SavedCardModel> savedCards = [];

  @override
  void initState() {
    super.initState();
    loadSavedCards();
  }

  @override
  void dispose() {
    cardHolderController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  String get formattedCardNumber {
    final String value = cardNumberController.text.trim();

    if (value.isEmpty) {
      return '0000 0000 0000 0000';
    }

    return value;
  }

  String get cardHolderName {
    final String value = cardHolderController.text.trim();

    if (value.isEmpty) {
      return 'Card Holder';
    }

    return value;
  }

  String get expiryDate {
    final String value = expiryDateController.text.trim();

    if (value.isEmpty) {
      return 'MM/YY';
    }

    return value;
  }

  String get cardBrand {
    final String digitsOnly =
    cardNumberController.text.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.startsWith('4')) {
      return 'Visa';
    }

    if (digitsOnly.startsWith('5')) {
      return 'MasterCard';
    }

    if (digitsOnly.startsWith('3')) {
      return 'American Express';
    }

    return 'Card';
  }

  String? validateRequired(
      String? value, {
        required String fieldName,
      }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  String? validateCardNumber(String? value) {
    final String cardNumber =
        value?.replaceAll(' ', '').trim() ?? '';

    if (cardNumber.isEmpty) {
      return 'Card number is required';
    }

    if (cardNumber.length < 16) {
      return 'Card number must be 16 digits';
    }

    return null;
  }

  String? validateExpiryDate(String? value) {
    final String expiry = value?.trim() ?? '';

    if (expiry.isEmpty) {
      return 'Expiry date is required';
    }

    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(expiry)) {
      return 'Use MM/YY format';
    }

    return null;
  }

  String? validateCvv(String? value) {
    final String cvv = value?.trim() ?? '';

    if (cvv.isEmpty) {
      return 'CVV is required';
    }

    if (cvv.length < 3) {
      return 'CVV must be 3 digits';
    }

    return null;
  }

  Future<void> loadSavedCards() async {
    setState(() {
      isLoadingSavedCards = true;
    });

    final List<SavedCardModel> cards =
    await SavedCardLocalService.instance.getSavedCards();

    if (!mounted) return;

    setState(() {
      savedCards = cards;
      isLoadingSavedCards = false;

      if (savedCards.isNotEmpty && selectedSavedCardId == null) {
        selectedSavedCardId = savedCards.first.id;
      }
    });
  }

  Future<void> addCard() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    final String maskedCardNumber =
    SavedCardLocalService.instance.getMaskedCardNumberFromInput(
      cardNumberController.text.trim(),
    );

    final String brand =
    SavedCardLocalService.instance.getCardBrandFromInput(
      cardNumberController.text.trim(),
    );

    final Map<String, dynamic> cardData = <String, dynamic>{
      'cardHolderName': cardHolderController.text.trim(),
      'maskedCardNumber': maskedCardNumber,
      'expiryDate': expiryDateController.text.trim(),
      'brand': brand,
      'saveCard': saveCard,
    };

    if (saveCard) {
      final SavedCardModel savedCard =
      await SavedCardLocalService.instance.saveCard(
        cardHolderName: cardHolderController.text.trim(),
        cardNumber: cardNumberController.text.trim(),
        expiryDate: expiryDateController.text.trim(),
      );

      selectedSavedCardId = savedCard.id;

      await loadSavedCards();
    }

    debugPrint('CARD DATA: $cardData');

    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            saveCard
                ? 'Card saved successfully.'
                : 'Card added without saving.',
          ),
          backgroundColor: AppColors.primaryColor,
          behavior: SnackBarBehavior.floating,
        ),
      );

    cardHolderController.clear();
    cardNumberController.clear();
    expiryDateController.clear();
    cvvController.clear();

    setState(() {});
  }

  void selectSavedCard(SavedCardModel card) {
    setState(() {
      selectedSavedCardId = card.id;
    });

    debugPrint('SELECTED SAVED CARD: ${card.toJson()}');
  }

  void useSelectedCardForPayment() {
    if (selectedSavedCardId == null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: const Text('Please select a saved card.'),
            backgroundColor: AppColors.primaryColor,
            behavior: SnackBarBehavior.floating,
          ),
        );
      return;
    }

    final SavedCardModel selectedCard = savedCards.firstWhere(
          (SavedCardModel card) => card.id == selectedSavedCardId,
    );

    debugPrint('PAYMENT CARD SELECTED: ${selectedCard.toJson()}');

    context.pop(selectedCard.toJson());
  }

  Future<void> deleteSavedCard(String cardId) async {
    await SavedCardLocalService.instance.deleteCard(cardId);

    if (selectedSavedCardId == cardId) {
      selectedSavedCardId = null;
    }

    await loadSavedCards();

    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: const Text('Card removed successfully.'),
          backgroundColor: AppColors.primaryColor,
          behavior: SnackBarBehavior.floating,
        ),
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
                  }
                }
            ),
          ),
          title: Text(
            'Add Card',
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
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.manual,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  20.w,
                  14.h,
                  20.w,
                  isKeyboardOpen ? 24.h : 120.h,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCardPreview(),

                      SizedBox(height: 22.h),

                      _buildInputField(
                        label: 'Card Holder Name',
                        controller: cardHolderController,
                        hintText: 'Enter card holder name',
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: (value) => validateRequired(
                          value,
                          fieldName: 'Card holder name',
                        ),
                        onChanged: (_) {
                          setState(() {});
                        },
                      ),

                      SizedBox(height: 14.h),

                      _buildInputField(
                        label: 'Card Number',
                        controller: cardNumberController,
                        hintText: '0000 0000 0000 0000',
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                          CardNumberInputFormatter(),
                        ],
                        validator: validateCardNumber,
                        onChanged: (_) {
                          setState(() {});
                        },
                      ),

                      SizedBox(height: 14.h),

                      Row(
                        children: [
                          Expanded(
                            child: _buildInputField(
                              label: 'Expiry Date',
                              controller: expiryDateController,
                              hintText: 'MM/YY',
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                                ExpiryDateInputFormatter(),
                              ],
                              validator: validateExpiryDate,
                              onChanged: (_) {
                                setState(() {});
                              },
                            ),
                          ),

                          SizedBox(width: 12.w),

                          Expanded(
                            child: _buildInputField(
                              label: 'CVV',
                              controller: cvvController,
                              hintText: '000',
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3),
                              ],
                              validator: validateCvv,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16.h),

                      _buildSaveCardOption(),

                      SizedBox(height: 26.h),

                      _buildSavedCardsSection(),
                    ],
                  ),
                ),
              ),
            ),

            if (!isKeyboardOpen) _buildBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardPreview() {
    return Container(
      width: double.infinity,
      height: 205.h,
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryColor,
            Color(0xFFFF6D73),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.25),
            blurRadius: 18.r,
            offset: Offset(0, 10.h),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -30.w,
            top: -65.h,
            child: Container(
              width: 185.w,
              height: 185.w,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.18),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            right: -75.w,
            top: -10.h,
            child: Container(
              width: 180.w,
              height: 180.w,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.16),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            top: 14.h,
            right: 0,
            child: Text(
              cardBrand.toUpperCase(),
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

          Positioned(
            left: 0,
            bottom: 70.h,
            child: Text(
              formattedCardNumber,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.1,
              ),
            ),
          ),

          Positioned(
            left: 0,
            bottom: 18.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Card holder name',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.white.withOpacity(0.82),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  cardHolderName,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            left: 130.w,
            bottom: 18.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Expiry date',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.white.withOpacity(0.82),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  expiryDate,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: 0,
            bottom: 20.h,
            child: Icon(
              Iconsax.card,
              color: AppColors.white.withOpacity(0.55),
              size: 34.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
    ValueChanged<String>? onChanged,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textPrimary,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 8.h),

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          validator: validator,
          onChanged: onChanged,
          obscureText: obscureText,
          obscuringCharacter: '*',
          cursorColor: AppColors.primaryColor,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textPrimary,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.inputFieldColor,
            hintText: hintText,
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
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 1.1.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.error,
                width: 1.w,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.error,
                width: 1.w,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveCardOption() {
    return InkWell(
      onTap: () {
        setState(() {
          saveCard = !saveCard;
        });
      },
      borderRadius: BorderRadius.circular(8.r),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 22.w,
            height: 22.w,
            decoration: BoxDecoration(
              color: saveCard
                  ? AppColors.primaryColor
                  : AppColors.white,
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                color: saveCard
                    ? AppColors.primaryColor
                    : AppColors.borderColor,
                width: 1.w,
              ),
            ),
            child: saveCard
                ? Icon(
              Icons.check,
              color: AppColors.white,
              size: 15.sp,
            )
                : null,
          ),

          SizedBox(width: 8.w),

          Text(
            'Save Card',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedCardsSection() {
    if (isLoadingSavedCards) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
            strokeWidth: 2.5.w,
          ),
        ),
      );
    }

    if (savedCards.isEmpty) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: AppColors.borderColor,
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
                Iconsax.card,
                color: AppColors.primaryColor,
                size: 22.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                'No saved cards yet. Add a new card and keep Save Card checked.',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 13.sp,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Saved Cards',
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 17.sp,
            fontWeight: FontWeight.w800,
          ),
        ),

        SizedBox(height: 12.h),

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: savedCards.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.h);
          },
          itemBuilder: (context, index) {
            final SavedCardModel card = savedCards[index];

            return SavedCardTileWidget(
              card: card,
              isSelected: selectedSavedCardId == card.id,
              onTap: () => selectSavedCard(card),
              onDelete: () => deleteSavedCard(card.id),
            );
          },
        ),

        SizedBox(height: 14.h),

        SizedBox(
          width: double.infinity,
          height: 52.h,
          child: OutlinedButton(
            onPressed: useSelectedCardForPayment,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
              side: BorderSide(
                color: AppColors.primaryColor,
                width: 1.2.w,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            child: Text(
              'Use Selected Card',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.primaryColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
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
          height: 56.h,
          child: ElevatedButton(
            onPressed: addCard,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            child: Text(
              'Add Card',
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

class SavedCardTileWidget extends StatelessWidget {
  const SavedCardTileWidget({
    super.key,
    required this.card,
    required this.isSelected,
    required this.onTap,
    required this.onDelete,
  });

  final SavedCardModel card;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.all(14.sp),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withOpacity(0.08)
              : AppColors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.borderColor,
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.025),
              blurRadius: 12.r,
              offset: Offset(0, 5.h),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(13.r),
              ),
              child: Icon(
                Iconsax.card,
                color: AppColors.primaryColor,
                size: 24.sp,
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    card.brand,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    card.maskedCardNumber,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    '${card.cardHolderName} • Exp ${card.expiryDate}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textHint,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 8.w),

            _SavedCardRadio(isSelected: isSelected),

            SizedBox(width: 4.w),

            IconButton(
              onPressed: onDelete,
              icon: Icon(
                Iconsax.trash,
                color: AppColors.primaryColor,
                size: 21.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SavedCardRadio extends StatelessWidget {
  const _SavedCardRadio({
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
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
        duration: const Duration(milliseconds: 220),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.transparent,
        ),
      ),
    );
  }
}