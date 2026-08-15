import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:go_router/go_router.dart';

import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_texts.dart';
import 'package:multi_trendzz/core/services/image_picker_service.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';
import 'package:multi_trendzz/core/widgets/custom_elevated_button_widget.dart';
import 'package:multi_trendzz/core/widgets/app_snack_bar.dart';

class CreateStoreScreen extends StatefulWidget {
  const CreateStoreScreen({super.key});

  @override
  State<CreateStoreScreen> createState() => _CreateStoreScreenState();
}

class _CreateStoreScreenState extends State<CreateStoreScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController storeNameController =
  TextEditingController();

  final TextEditingController storeDescriptionController =
  TextEditingController();

  final TextEditingController categoryController =
  TextEditingController();

  final TextEditingController businessPhoneController =
  TextEditingController();

  final TextEditingController businessEmailController =
  TextEditingController();

  final TextEditingController pickupAddressController =
  TextEditingController();

  File? _storeLogo;
  File? _storeBanner;

  bool _isLoading = false;
  bool _sellerTermsAccepted = false;

  String selectedDialCode = '+92';

  @override
  void dispose() {
    storeNameController.dispose();
    storeDescriptionController.dispose();
    categoryController.dispose();
    businessPhoneController.dispose();
    businessEmailController.dispose();
    pickupAddressController.dispose();
    super.dispose();
  }

  // ------------------------------------------------------------
  // Pick Store Logo
  // ------------------------------------------------------------

  Future<void> _pickStoreLogo() async {
    final File? image =
    await ImagePickerService.instance.pickImage(context);

    if (image == null) return;

    setState(() {
      _storeLogo = image;
    });
  }

  // ------------------------------------------------------------
  // Pick Store Banner
  // ------------------------------------------------------------

  Future<void> _pickStoreBanner() async {
    final File? image =
    await ImagePickerService.instance.pickImage(context);

    if (image == null) return;

    setState(() {
      _storeBanner = image;
    });
  }

  // ------------------------------------------------------------
  // Category Bottom Sheet
  // ------------------------------------------------------------

  Future<void> _selectCategory() async {
    FocusScope.of(context).unfocus();

    final List<String> categories = [
      'Fashion & Apparel',
      'Electronics',
      'Beauty & Personal Care',
      'Home & Living',
      'Sports & Fitness',
      'Jewelry & Accessories',
      'Grocery',
      'Books & Stationery',
      'Toys & Kids',
      'Other',
    ];

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20.w,
              12.h,
              20.w,
              24.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag Handle
                Container(
                  width: 42.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),

                SizedBox(height: 20.h),

                // Title
                Text(
                  'Select Category',
                  style: AppTextStyles.titleLarge.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 16.h),

                // Categories List
                Flexible(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: categories.map(
                            (String category) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                categoryController.text = category;
                              });

                              Navigator.pop(context);
                            },
                            borderRadius: BorderRadius.circular(12.r),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 14.h,
                              ),
                              margin: EdgeInsets.only(
                                bottom: 8.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius:
                                BorderRadius.circular(12.r),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Iconsax.category,
                                    size: 20.sp,
                                    color: AppColors.primaryColor,
                                  ),

                                  SizedBox(width: 12.w),

                                  Expanded(
                                    child: Text(
                                      category,
                                      style: AppTextStyles.bodyLarge.copyWith(
                                        color: AppColors.textPrimary,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),

                                  Icon(
                                    Iconsax.arrow_right_3,
                                    size: 18.sp,
                                    color: AppColors.textHint,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ------------------------------------------------------------
  // Validation
  // ------------------------------------------------------------

  String? _requiredValidator(
      String? value,
      String fieldName,
      ) {
    final String input = value?.trim() ?? '';

    if (input.isEmpty) {
      return 'Please enter $fieldName';
    }

    return null;
  }

  String? _emailValidator(String? value) {
    final String email = value?.trim() ?? '';

    if (email.isEmpty) {
      return 'Please enter business email';
    }

    final bool isValid = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    ).hasMatch(email);

    if (!isValid) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? _phoneValidator(String? value) {
    final String phone = value?.trim() ?? '';

    if (phone.isEmpty) {
      return 'Please enter business phone';
    }

    if (phone.length < 10) {
      return 'Please enter valid phone number';
    }

    return null;
  }

  // ------------------------------------------------------------
  // Create Store
  // ------------------------------------------------------------

  Future<void> _createStore() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!_sellerTermsAccepted) {
      AppSnackBar.show(
        context: context,
        type: AppSnackBarType.error,
        message: 'Please accept the Seller Terms & Conditions.',
      );

      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // TODO:
      // Upload logo
      // Upload banner
      // Save store data to Supabase

      await Future.delayed(
        const Duration(seconds: 1),
      );

      if (!mounted) return;

      AppSnackBar.show(
        context: context,
        type: AppSnackBarType.success,
        message: 'Your store has been created successfully.',
      );

      // TODO:
      // Replace this with your Seller Dashboard route.
      //
      // context.go(AppRoutes.sellerDashboard);

    } catch (e) {
      if (!mounted) return;

      AppSnackBar.show(
        context: context,
        type: AppSnackBarType.error,
        message: e.toString(),
      );
    } finally {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });
    }
  }

  // ------------------------------------------------------------
  // Build
  // ------------------------------------------------------------

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
          leadingWidth: 65.w,

          leading: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              top: 6.h,
              bottom: 6.h,
            ),
            child: CustomBackButtonWidget(
              onTap: () {
                context.pop();
              },
            ),
          ),
        ),

        body: SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 10.h),

                          _buildHeader(),

                          SizedBox(height: 28.h),

                          _buildStoreBranding(),

                          SizedBox(height: 30.h),

                          _buildStoreForm(),

                          SizedBox(height: 20.h),

                          _buildSellerTerms(),

                          SizedBox(height: 25.h),
                        ],
                      ),
                    ),
                  ),
                ),

                _buildCreateStoreButton(),

                SizedBox(height: 18.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // Header
  // ------------------------------------------------------------

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Create Your Store',
          textAlign: TextAlign.center,
          style: AppTextStyles.headlineLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 26.sp,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 10.h),

        Text(
          'Set up your store and start selling your products on Multi Trendzz.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textSecondary,
            fontSize: 15.sp,
            height: 1.5,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // Store Branding
  // ------------------------------------------------------------

  Widget _buildStoreBranding() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Store Branding'),

        SizedBox(height: 14.h),

        // Banner
        GestureDetector(
          onTap: _pickStoreBanner,
          child: Container(
            width: double.infinity,
            height: 150.h,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: AppColors.borderColor,
              ),
              image: _storeBanner != null
                  ? DecorationImage(
                image: FileImage(_storeBanner!),
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: _storeBanner == null
                ? Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.gallery_add,
                  size: 34.sp,
                  color: AppColors.primaryColor,
                ),

                SizedBox(height: 8.h),

                Text(
                  'Add Store Banner',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  'Optional',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            )
                : Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: _buildImageEditButton(
                  onTap: _pickStoreBanner,
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 18.h),

        // Logo
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickStoreLogo,
              child: Container(
                width: 88.w,
                height: 88.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.borderColor,
                    width: 1.5,
                  ),
                  image: _storeLogo != null
                      ? DecorationImage(
                    image: FileImage(_storeLogo!),
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
                child: _storeLogo == null
                    ? Icon(
                  Iconsax.shop,
                  size: 36.sp,
                  color: AppColors.primaryColor,
                )
                    : null,
              ),
            ),

            SizedBox(width: 16.w),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Store Logo',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    'Add a logo to help customers recognize your store.',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 13.sp,
                      height: 1.4,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  GestureDetector(
                    onTap: _pickStoreLogo,
                    child: Text(
                      _storeLogo == null
                          ? 'Add Logo'
                          : 'Change Logo',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // Store Form
  // ------------------------------------------------------------

  Widget _buildStoreForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Store Information'),

        SizedBox(height: 16.h),

        _buildFieldLabel('Store Name'),

        SizedBox(height: 6.h),

        CustomTextFormFieldWidget(
          controller: storeNameController,
          hintText: 'Enter your store name',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Iconsax.shop,
            color: AppColors.textHint,
            size: 22.sp,
          ),
          validator: (value) {
            return _requiredValidator(
              value,
              'store name',
            );
          },
        ),

        SizedBox(height: 16.h),

        _buildFieldLabel('Store Description'),

        SizedBox(height: 6.h),

        CustomTextFormFieldWidget(
          controller: storeDescriptionController,
          hintText: 'Tell customers about your store',
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLines: 4,
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              bottom: 55.h,
            ),
            child: Icon(
              Iconsax.document_text,
              color: AppColors.textHint,
              size: 22.sp,
            ),
          ),
          validator: (value) {
            return _requiredValidator(
              value,
              'store description',
            );
          },
        ),

        SizedBox(height: 16.h),

        _buildFieldLabel('Business Category'),

        SizedBox(height: 6.h),

        CustomTextFormFieldWidget(
          controller: categoryController,
          hintText: 'Select category',
          readOnly: true,
          onTap: _selectCategory,
          prefixIcon: Icon(
            Iconsax.category,
            color: AppColors.textHint,
            size: 22.sp,
          ),
          suffixIcon: Icon(
            Iconsax.arrow_down_1,
            color: AppColors.textHint,
            size: 20.sp,
          ),
          validator: (value) {
            return _requiredValidator(
              value,
              'business category',
            );
          },
        ),

        SizedBox(height: 25.h),

        _buildSectionTitle('Business Contact'),

        SizedBox(height: 16.h),

        _buildFieldLabel('Business Phone'),

        SizedBox(height: 6.h),

        _buildBusinessPhoneField(),

        SizedBox(height: 16.h),

        _buildFieldLabel('Business Email'),

        SizedBox(height: 6.h),

        CustomTextFormFieldWidget(
          controller: businessEmailController,
          hintText: 'Enter business email',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Iconsax.sms,
            color: AppColors.textHint,
            size: 22.sp,
          ),
          validator: _emailValidator,
        ),

        SizedBox(height: 25.h),

        _buildSectionTitle('Pickup Address'),

        SizedBox(height: 8.h),

        Text(
          'This address will be used for order pickup and delivery.',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            fontSize: 13.sp,
            height: 1.4,
          ),
        ),

        SizedBox(height: 14.h),

        CustomTextFormFieldWidget(
          controller: pickupAddressController,
          hintText: 'Enter your pickup address',
          keyboardType: TextInputType.streetAddress,
          textInputAction: TextInputAction.done,
          maxLines: 3,
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              bottom: 35.h,
            ),
            child: Icon(
              Iconsax.location,
              color: AppColors.textHint,
              size: 22.sp,
            ),
          ),
          validator: (value) {
            return _requiredValidator(
              value,
              'pickup address',
            );
          },
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // Business Phone
  // ------------------------------------------------------------

  Widget _buildBusinessPhoneField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 54.h,
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.inputFieldColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedDialCode,
              icon: Icon(
                Iconsax.arrow_down_1,
                size: 16.sp,
                color: AppColors.textHint,
              ),
              dropdownColor: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              items: const [
                DropdownMenuItem(
                  value: '+92',
                  child: Text('🇵🇰 +92'),
                ),
                DropdownMenuItem(
                  value: '+971',
                  child: Text('🇦🇪 +971'),
                ),
                DropdownMenuItem(
                  value: '+966',
                  child: Text('🇸🇦 +966'),
                ),
                DropdownMenuItem(
                  value: '+1',
                  child: Text('🇺🇸 +1'),
                ),
                DropdownMenuItem(
                  value: '+44',
                  child: Text('🇬🇧 +44'),
                ),
              ],
              onChanged: (String? value) {
                if (value == null) return;

                setState(() {
                  selectedDialCode = value;
                  businessPhoneController.clear();
                });
              },
            ),
          ),
        ),

        SizedBox(width: 10.w),

        Expanded(
          child: CustomTextFormFieldWidget(
            controller: businessPhoneController,
            hintText: 'Business phone',
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(15),
            ],
            prefixIcon: Icon(
              Iconsax.call,
              color: AppColors.textHint,
              size: 22.sp,
            ),
            validator: _phoneValidator,
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // Seller Terms
  // ------------------------------------------------------------

  Widget _buildSellerTerms() {
    return InkWell(
      onTap: () {
        setState(() {
          _sellerTermsAccepted =
          !_sellerTermsAccepted;
        });
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 4.h,
        ),
        child: Row(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24.w,
              height: 24.w,
              child: Checkbox(
                value: _sellerTermsAccepted,
                activeColor:
                AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(5.r),
                ),
                onChanged: (value) {
                  setState(() {
                    _sellerTermsAccepted =
                        value ?? false;
                  });
                },
              ),
            ),

            SizedBox(width: 10.w),

            Expanded(
              child: RichText(
                text: TextSpan(
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 13.sp,
                    height: 1.5,
                  ),
                  children: [
                    const TextSpan(
                      text: 'I agree to the ',
                    ),
                    TextSpan(
                      text: 'Seller Terms & Conditions',
                      style: TextStyle(
                        color:
                        AppColors.primaryColor,
                        fontWeight:
                        FontWeight.w700,
                      ),
                    ),
                    const TextSpan(
                      text:
                      ' and agree to follow the marketplace selling policies.',
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

  // ------------------------------------------------------------
  // Section Title
  // ------------------------------------------------------------

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: AppTextStyles.titleMedium.copyWith(
        color: AppColors.textPrimary,
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  // ------------------------------------------------------------
  // Field Label
  // ------------------------------------------------------------

  Widget _buildFieldLabel(String text) {
    return Text(
      text,
      style: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.darkColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // ------------------------------------------------------------
  // Image Edit Button
  // ------------------------------------------------------------

  Widget _buildImageEditButton({
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38.w,
        height: 38.w,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.white,
            width: 2.w,
          ),
        ),
        child: Icon(
          Iconsax.edit_2,
          color: AppColors.white,
          size: 18.sp,
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // Create Store Button
  // ------------------------------------------------------------

  Widget _buildCreateStoreButton() {
    return ElevatedButtonWidget(
      text: _isLoading
          ? 'Creating Store...'
          : 'Create Store',
      expand: true,
      height: 54.h,
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.lightColor,
      borderRadius: 100.r,
      textStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.lightColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
      onPressed:
      _isLoading ? null : _createStore,
    );
  }
}