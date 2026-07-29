import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/services/image_picker_service.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  File? _profileImage;

  Future<void> _pickProfileImage() async {
    final File? image =
    await ImagePickerService.instance.pickImage(context);

    if (image == null) return;

    setState(() {
      _profileImage = image;
    });
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController =
  TextEditingController(text: 'Esther Howard');

  final TextEditingController phoneController =
  TextEditingController();

  final TextEditingController dobController =
  TextEditingController();

  final TextEditingController genderController =
  TextEditingController();

  final TextEditingController countryController =
  TextEditingController();

  final TextEditingController stateController =
  TextEditingController();

  final TextEditingController cityController =
  TextEditingController();

  final TextEditingController addressController =
  TextEditingController();

  final TextEditingController postalCodeController =
  TextEditingController();


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
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,

          title: Text(
            'Your Profile',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          leadingWidth: 65.w,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              top: 6.h,
              bottom: 6.h,
            ),
            child: CustomBackButtonWidget(
              onTap: () {
                context.go(AppRoutes.rootScreen);
              },
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15.h),

                    _buildProfileImagePicker(),

                    SizedBox(height: 15.h),

                    Text(
                      "Esther Howard",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 25.h),

                    _buildField(
                      label: 'Full Name',
                      controller: fullNameController,
                      hint: 'Enter full name',
                    ),

                    _buildField(
                      label: 'Phone Number',
                      controller: phoneController,
                      hint: 'Enter phone number',
                      keyboardType: TextInputType.phone,
                    ),

                    _buildField(
                      label: 'Date of Birth',
                      controller: dobController,
                      hint: 'DD/MM/YYYY',
                    ),

                    _buildField(
                      label: 'Gender',
                      controller: genderController,
                      hint: 'Select gender',
                    ),

                    _buildField(
                      label: 'Country',
                      controller: countryController,
                      hint: 'Enter country',
                    ),

                    _buildField(
                      label: 'State',
                      controller: stateController,
                      hint: 'Enter state',
                    ),

                    _buildField(
                      label: 'City',
                      controller: cityController,
                      hint: 'Enter city',
                    ),

                    _buildField(
                      label: 'Address',
                      controller: addressController,
                      hint: 'Enter address',
                    ),

                    _buildField(
                      label: 'Postal Code',
                      controller: postalCodeController,
                      hint: 'Enter postal code',
                      keyboardType: TextInputType.number,
                    ),

                    SizedBox(height: 25.h),

                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            debugPrint(
                              'Updated Name: ${fullNameController.text}',
                            );

                            // TODO: Call update profile API
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(30.r),
                          ),
                        ),
                        child: const Text(
                          'Update Profile',
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildField({
    required String label,
    required TextEditingController controller,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 16.h,
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: 6.h),

          CustomTextFormFieldWidget(
            controller: controller,
            hintText: hint,
            keyboardType: keyboardType,
          ),
        ],
      ),
    );
  }
  Widget _buildProfileImagePicker() {
    return GestureDetector(
      onTap: _pickProfileImage,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 120.w,
            height: 120.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12.r,
                  offset: Offset(0, 5.h),
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryLight,
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
                size: 45.sp,
                color: AppColors.primaryColor,
              )
                  : null,
            ),
          ),

          Positioned(
            right: -2.w,
            bottom: 2.h,
            child: Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2.5.w,
                ),
              ),
              child: Icon(
                Iconsax.edit_2,
                color: Colors.white,
                size: 15.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
