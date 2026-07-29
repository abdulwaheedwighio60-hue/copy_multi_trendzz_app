import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';

class AddNewShippingAddressScreen extends StatefulWidget {
  const AddNewShippingAddressScreen({super.key});

  @override
  State<AddNewShippingAddressScreen> createState() =>
      _AddNewShippingAddressScreenState();
}

class _AddNewShippingAddressScreenState
    extends State<AddNewShippingAddressScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController =
  TextEditingController();
  final TextEditingController phoneController =
  TextEditingController();
  final TextEditingController addressTitleController =
  TextEditingController();
  final TextEditingController streetAddressController =
  TextEditingController();
  final TextEditingController cityController =
  TextEditingController();
  final TextEditingController stateController =
  TextEditingController();
  final TextEditingController postalCodeController =
  TextEditingController();

  bool makeDefaultAddress = true;

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    addressTitleController.dispose();
    streetAddressController.dispose();
    cityController.dispose();
    stateController.dispose();
    postalCodeController.dispose();
    super.dispose();
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

  void saveAddress() {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    final NewShippingAddressModel address =
    NewShippingAddressModel(
      fullName: fullNameController.text.trim(),
      phone: phoneController.text.trim(),
      title: addressTitleController.text.trim(),
      streetAddress: streetAddressController.text.trim(),
      city: cityController.text.trim(),
      state: stateController.text.trim(),
      postalCode: postalCodeController.text.trim(),
      isDefault: makeDefaultAddress,
    );

    debugPrint('NEW SHIPPING ADDRESS: ${address.toJson()}');

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: const Text('Shipping address saved successfully.'),
          backgroundColor: AppColors.primaryColor,
          behavior: SnackBarBehavior.floating,
        ),
      );

    context.pop(address);
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
                if (Navigator.canPop(context)) {
                  context.pop();
                }
              },
            ),
          ),
          title: Text(
            'Add New Address',
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
                  16.h,
                  20.w,
                  isKeyboardOpen ? 24.h : 120.h,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderCard(),

                      SizedBox(height: 22.h),

                      _buildSectionTitle('Contact Details'),

                      SizedBox(height: 14.h),

                      _buildTextField(
                        controller: fullNameController,
                        label: 'Full Name',
                        hintText: 'Enter full name',
                        icon: Iconsax.user,
                        textInputAction: TextInputAction.next,
                        validator: (value) => validateRequired(
                          value,
                          fieldName: 'Full name',
                        ),
                      ),

                      SizedBox(height: 14.h),

                      _buildTextField(
                        controller: phoneController,
                        label: 'Phone Number',
                        hintText: 'Enter phone number',
                        icon: Iconsax.call,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(15),
                        ],
                        validator: (value) => validateRequired(
                          value,
                          fieldName: 'Phone number',
                        ),
                      ),

                      SizedBox(height: 24.h),

                      _buildSectionTitle('Address Details'),

                      SizedBox(height: 14.h),

                      _buildTextField(
                        controller: addressTitleController,
                        label: 'Address Title',
                        hintText: 'Home, Office, Parent’s House',
                        icon: Iconsax.home,
                        textInputAction: TextInputAction.next,
                        validator: (value) => validateRequired(
                          value,
                          fieldName: 'Address title',
                        ),
                      ),

                      SizedBox(height: 14.h),

                      _buildTextField(
                        controller: streetAddressController,
                        label: 'Street Address',
                        hintText: 'Enter street address',
                        icon: Iconsax.location,
                        maxLines: 3,
                        textInputAction: TextInputAction.newline,
                        validator: (value) => validateRequired(
                          value,
                          fieldName: 'Street address',
                        ),
                      ),

                      SizedBox(height: 14.h),

                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              controller: cityController,
                              label: 'City',
                              hintText: 'City',
                              icon: Iconsax.building,
                              textInputAction: TextInputAction.next,
                              validator: (value) => validateRequired(
                                value,
                                fieldName: 'City',
                              ),
                            ),
                          ),

                          SizedBox(width: 12.w),

                          Expanded(
                            child: _buildTextField(
                              controller: stateController,
                              label: 'State',
                              hintText: 'State',
                              icon: Iconsax.map,
                              textInputAction: TextInputAction.next,
                              validator: (value) => validateRequired(
                                value,
                                fieldName: 'State',
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 14.h),

                      _buildTextField(
                        controller: postalCodeController,
                        label: 'Postal Code',
                        hintText: 'Enter postal code',
                        icon: Iconsax.note_1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        validator: (value) => validateRequired(
                          value,
                          fieldName: 'Postal code',
                        ),
                      ),

                      SizedBox(height: 18.h),

                      _buildDefaultAddressSwitch(),
                    ],
                  ),
                ),
              ),
            ),

            if (!isKeyboardOpen) _buildBottomSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.18),
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(
              Iconsax.location_add,
              color: AppColors.white,
              size: 26.sp,
            ),
          ),

          SizedBox(width: 14.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add delivery location',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: 5.h),

                Text(
                  'Enter accurate details to avoid delivery delays.',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 13.sp,
                    height: 1.35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.textPrimary,
        fontSize: 17.sp,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData icon,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    int maxLines = 1,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textPrimary,
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 8.h),

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          validator: validator,
          cursorColor: AppColors.primaryColor,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textPrimary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textHint,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                left: 14.w,
                right: 10.w,
              ),
              child: Icon(
                icon,
                color: AppColors.primaryColor,
                size: 20.sp,
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 48.w,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: maxLines > 1 ? 16.h : 15.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: AppColors.borderColor,
                width: 1.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: AppColors.borderColor,
                width: 1.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 1.2.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: AppColors.error,
                width: 1.w,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(
                color: AppColors.error,
                width: 1.2.w,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultAddressSwitch() {
    return InkWell(
      onTap: () {
        setState(() {
          makeDefaultAddress = !makeDefaultAddress;
        });
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 14.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
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
                Iconsax.tick_circle,
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
                    'Make default address',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(height: 3.h),

                  Text(
                    'Use this address as your primary delivery location.',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 12.sp,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            Switch(
              value: makeDefaultAddress,
              activeColor: AppColors.white,
              activeTrackColor: AppColors.primaryColor,
              inactiveThumbColor: AppColors.white,
              inactiveTrackColor: AppColors.borderColor,
              onChanged: (bool value) {
                setState(() {
                  makeDefaultAddress = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSaveButton() {
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
            onPressed: saveAddress,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            child: Text(
              'Save Address',
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

class NewShippingAddressModel {
  NewShippingAddressModel({
    required this.fullName,
    required this.phone,
    required this.title,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.isDefault,
  });

  final String fullName;
  final String phone;
  final String title;
  final String streetAddress;
  final String city;
  final String state;
  final String postalCode;
  final bool isDefault;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fullName': fullName,
      'phone': phone,
      'title': title,
      'streetAddress': streetAddress,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'isDefault': isDefault,
    };
  }
}