import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_constants.dart';
import 'package:multi_trendzz/core/constants/app_texts.dart';
import 'package:multi_trendzz/core/helper/app_helper.dart';
import 'package:multi_trendzz/core/provider/auth_provider.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/services/image_picker_service.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/utils/app_validators.dart';
import 'package:multi_trendzz/core/widgets/app_snack_bar.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';
import 'package:multi_trendzz/core/widgets/custom_elevated_button_widget.dart';
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:io';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  File? _profileImage;
  bool isLoading = false;

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    dobController.dispose();
    genderController.dispose();
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    addressController.dispose();
    postalCodeController.dispose();
    super.dispose();
  }

  Future<void> _pickProfileImage() async {
    final File? image = await ImagePickerService.instance.pickImage(context);

    if (image == null) return;

    setState(() {
      _profileImage = image;
    });
  }

  Future<void> _selectDateOfBirth() async {
    FocusScope.of(context).unfocus();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: 430,
            child: Column(
              children: [

                // Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Select Date of Birth",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: SfDateRangePicker(
                    selectionMode: DateRangePickerSelectionMode.single,
                    initialSelectedDate: DateTime(2000, 1, 1),
                    minDate: DateTime(1950),
                    maxDate: DateTime.now(),

                    headerStyle: const DateRangePickerHeaderStyle(
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    monthViewSettings: const DateRangePickerMonthViewSettings(
                      firstDayOfWeek: 1,
                    ),

                    selectionColor: AppColors.primaryColor,
                    todayHighlightColor: AppColors.primaryColor,
                    startRangeSelectionColor: AppColors.primaryColor,
                    endRangeSelectionColor: AppColors.primaryColor,
                    rangeSelectionColor: Color(0xffEAF5FF),

                    monthCellStyle: const DateRangePickerMonthCellStyle(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      todayTextStyle: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    yearCellStyle: const DateRangePickerYearCellStyle(
                      textStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),

                    onSelectionChanged: (args) {
                      if (args.value is DateTime) {
                        final date = args.value as DateTime;

                        dobController.text =
                        "${date.day.toString().padLeft(2, '0')}/"
                            "${date.month.toString().padLeft(2, '0')}/"
                            "${date.year}";

                        Navigator.pop(context);
                        setState(() {});
                      }
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


  Future<void> _showOptionSheet({
    required String title,
    required List<String> options,
    required TextEditingController controller,
  }) async {
    FocusScope.of(context).unfocus();

    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: AppColors.borderColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                title,
                style: AppTextStyles.titleLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 16.h),

              ...options.map(
                    (String value) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        controller.text = value;
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
                      margin: EdgeInsets.only(bottom: 8.h),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        value,
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
  Future<void> _onContinuePressed() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    try {
      final authProvider = context.read<AuthProvider>();

      String? imageUrl;

      if (_profileImage != null) {
        imageUrl = await authProvider.uploadProfileImage(_profileImage!);
      }

      await authProvider.completeProfile(
        fullName: fullNameController.text.trim(),
        phone: "$selectedDialCode${phoneController.text.trim()}",
        dob: dobController.text.trim(),
        gender: genderController.text.trim(),
        country: countryController.text.trim(),
        state: stateController.text.trim(),
        city: cityController.text.trim(),
        address: addressController.text.trim(),
        postalCode: postalCodeController.text.trim(),
        profileImage: imageUrl,
      );

      if (!mounted) return;

      AppSnackBar.show(
        context: context,
        type: AppSnackBarType.success,
        message: "Profile completed successfully.",
      );

      context.go(AppRoutes.rootScreen);

    } catch (e) {
      if (!mounted) return;

      AppSnackBar.show(
        context: context,
        type: AppSnackBarType.error,
        message: e.toString(),
      );

      print(e);
    }
  }
  // Future<void> _onContinuePressed() async {
  //   FocusScope.of(context).unfocus();
  //
  //   if (!_formKey.currentState!.validate()) {
  //     return;
  //   }
  //
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   await Future.delayed(const Duration(seconds: 2));
  //
  //   if (!mounted) return;
  //
  //   setState(() {
  //     isLoading = false;
  //   });
  //
  //   // TODO: Save profile API / Navigate to next screen
  //   context.go(AppRoutes.rootScreen);
  // }

  String? _requiredValidator(String? value, String fieldName) {
    final String input = value?.trim() ?? '';

    if (input.isEmpty) {
      return 'Please enter $fieldName';
    }

    return null;
  }

  String? _phoneValidator(String? value) {
    final String phone = value?.trim() ?? '';

    if (phone.isEmpty) {
      return 'Please enter phone number';
    }

    if (phone.length < 10) {
      return 'Please enter valid phone number';
    }

    return null;
  }

  String? _postalCodeValidator(String? value) {
    final String postalCode = value?.trim() ?? '';

    if (postalCode.isEmpty) {
      return 'Please enter postal code';
    }

    if (postalCode.length < 4) {
      return 'Please enter valid postal code';
    }

    return null;
  }



  String selectedDialCode = '+92';
  //
  // final List<Map<String, String>> phoneCountries = <Map<String, String>>[
  //   {
  //     'flag': '🇵🇰',
  //     'name': 'Pakistan',
  //     'code': '+92',
  //   },
  //   {
  //     'flag': '🇮🇳',
  //     'name': 'India',
  //     'code': '+91',
  //   },
  //   {
  //     'flag': '🇦🇪',
  //     'name': 'UAE',
  //     'code': '+971',
  //   },
  //   {
  //     'flag': '🇸🇦',
  //     'name': 'Saudi Arabia',
  //     'code': '+966',
  //   },
  //   {
  //     'flag': '🇺🇸',
  //     'name': 'United States',
  //     'code': '+1',
  //   },
  //   {
  //     'flag': '🇬🇧',
  //     'name': 'United Kingdom',
  //     'code': '+44',
  //   },
  // ];

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
                context.go(AppRoutes.signUpScreen);
              },
            ),
          ),
        ),
        body: SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 10.h),

                          _buildHeader(),

                          SizedBox(height: 28.h),

                          Center(
                            child: _buildProfileImagePicker(),
                          ),

                          SizedBox(height: 30.h),

                          _buildProfileForm(),

                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),

                _buildContinueButton(),

                SizedBox(height: 18.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          AppStrings.completeYourProfileString,
          textAlign: TextAlign.center,
          style: AppTextStyles.headlineLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 26.sp,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 10.h),

        Text(
          AppStrings.completeProfileDescription,
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

  Widget _buildProfileImagePicker() {
    return GestureDetector(
      onTap: _pickProfileImage,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 132.w,
            height: 132.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 20.r,
                  offset: Offset(0, 10.h),
                ),
              ],
            ),
            child: Center(
              child: Container(
                width: 116.w,
                height: 116.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                  image: _profileImage != null
                      ? DecorationImage(
                    image: FileImage(_profileImage!),
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
                child: _profileImage == null
                    ? Icon(
                  Icons.person,
                  size: 60.sp,
                  color: AppColors.primaryColor,
                )
                    : null,
              ),
            ),
          ),

          Positioned(
            right: 2.w,
            bottom: 8.h,
            child: Container(
              width: 38.w,
              height: 38.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white,
                  width: 3.w,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.25),
                    blurRadius: 12.r,
                    offset: Offset(0, 6.h),
                  ),
                ],
              ),
              child: Icon(
                Iconsax.edit_2,
                color: AppColors.white,
                size: 18.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel('Full Name'),

        SizedBox(height: 6.h),

        CustomTextFormFieldWidget(
          controller: fullNameController,
          hintText: 'Enter your full name',
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Icons.person,
            color: AppColors.textHint,
            size: 22.sp,
          ),
          validator: (String? value) {
            final String name = value?.trim() ?? '';

            if (name.isEmpty) {
              return 'Please enter full name';
            }

            if (name.length < 3) {
              return 'Name must be at least 3 characters';
            }

            return null;
          },
        ),

        SizedBox(height: 16.h),

        _buildFieldLabel('Phone Number'),

        SizedBox(height: 6.h),

        _buildPhoneNumberField(),

        SizedBox(height: 16.h),

        Row(
          children: [
            Expanded(
              child: _buildDateField(),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildGenderField(),
            ),
          ],
        ),

        SizedBox(height: 16.h),

        _buildFieldLabel('Country'),

        SizedBox(height: 6.h),

        CustomTextFormFieldWidget(
          controller: countryController,
          hintText: 'Select country',
          readOnly: true,
          onTap: () {
            _showOptionSheet(
              title: 'Select Country',
              controller: countryController,
              options: const [
                'Pakistan',
                'United Arab Emirates',
                'Saudi Arabia',
                'United States',
                'United Kingdom',
              ],
            );
          },
          prefixIcon: Icon(
            Iconsax.global,
            color: AppColors.textHint,
            size: 22.sp,
          ),
          suffixIcon: Icon(
            Iconsax.arrow_down_1,
            color: AppColors.textHint,
            size: 20.sp,
          ),
          validator: (String? value) {
            return _requiredValidator(value, 'country');
          },
        ),

        SizedBox(height: 16.h),

        Row(
          children: [
            Expanded(
              child: _buildStateField(),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildCityField(),
            ),
          ],
        ),

        SizedBox(height: 16.h),

        _buildFieldLabel('Address'),

        SizedBox(height: 6.h),

        CustomTextFormFieldWidget(
          controller: addressController,
          hintText: 'Enter your address',
          keyboardType: TextInputType.streetAddress,
          textInputAction: TextInputAction.next,
          maxLines: 2,
          prefixIcon: Icon(
            Iconsax.location,
            color: AppColors.textHint,
            size: 22.sp,
          ),
          validator: (String? value) {
            return _requiredValidator(value, 'address');
          },
        ),

        SizedBox(height: 16.h),

        _buildFieldLabel('Postal Code'),

        SizedBox(height: 6.h),

        CustomTextFormFieldWidget(
          controller: postalCodeController,
          hintText: 'Enter postal code',
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          prefixIcon: Icon(
            Iconsax.sms_tracking,
            color: AppColors.textHint,
            size: 22.sp,
          ),
          validator: _postalCodeValidator,
        ),
      ],
    );
  }




  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel('Date of Birth'),

        SizedBox(height: 6.h),

        CustomTextFormFieldWidget(
          controller: dobController,
          hintText: 'DD/MM/YYYY',
          readOnly: true,
          onTap: _selectDateOfBirth,
          prefixIcon: Icon(
            Iconsax.calendar,
            color: AppColors.textHint,
            size: 21.sp,
          ),
          suffixIcon: Icon(
            Iconsax.arrow_down_1,
            color: AppColors.textHint,
            size: 18.sp,
          ),
          validator: (String? value) {
            return _requiredValidator(value, 'date of birth');
          },
        ),
      ],
    );
  }

  Widget _buildGenderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel('Gender'),

        SizedBox(height: 6.h),

        CustomTextFormFieldWidget(
          controller: genderController,
          hintText: 'Select',
          readOnly: true,
          onTap: () {
            _showOptionSheet(
              title: 'Select Gender',
              controller: genderController,
              options: const [
                'Male',
                'Female',
                'Other',
              ],
            );
          },
          prefixIcon: Icon(
            Iconsax.user,
            color: AppColors.textHint,
            size: 21.sp,
          ),
          suffixIcon: Icon(
            Iconsax.arrow_down_1,
            color: AppColors.textHint,
            size: 18.sp,
          ),
          validator: (String? value) {
            return _requiredValidator(value, 'gender');
          },
        ),
      ],
    );
  }

  Widget _buildStateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel('State'),

        SizedBox(height: 6.h),

        CustomTextFormFieldWidget(
          controller: stateController,
          hintText: 'State',
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Iconsax.map,
            color: AppColors.textHint,
            size: 21.sp,
          ),
          validator: (String? value) {
            return _requiredValidator(value, 'state');
          },
        ),
      ],
    );
  }



  Widget _buildCityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel('City'),

        SizedBox(height: 6.h),

        CustomTextFormFieldWidget(
          controller: cityController,
          hintText: 'City',
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Iconsax.building,
            color: AppColors.textHint,
            size: 21.sp,
          ),
          validator: (String? value) {
            return _requiredValidator(value, 'city');
          },
        ),
      ],
    );
  }

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

  Widget _buildContinueButton() {
    return ElevatedButtonWidget(
      text: isLoading ? 'Please wait...' : 'Continue',
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
      onPressed: isLoading ? null : _onContinuePressed,
    );
  }

  Widget _buildPhoneNumberField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 54.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
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
              items: AppConstants.phoneCountries.map((country) {
                return DropdownMenuItem<String>(
                  value: country.code,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        country.flag,
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        country.code,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value == null) return;

                setState(() {
                  selectedDialCode = value;
                  phoneController.clear(); // Optional
                });
              },
            ),
          ),
        ),

        SizedBox(width: 10.w),

        Expanded(
          child: CustomTextFormFieldWidget(
            controller: phoneController,
            hintText: AppHelper.getPhoneHintText(selectedDialCode),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(
                AppHelper.getPhoneMaxLength(selectedDialCode),
              ),
            ],
            validator: (value) => AppValidators.validatePhone(
              value,
              selectedDialCode: selectedDialCode,
            ),
          ),
        ),
      ],
    );
  }}