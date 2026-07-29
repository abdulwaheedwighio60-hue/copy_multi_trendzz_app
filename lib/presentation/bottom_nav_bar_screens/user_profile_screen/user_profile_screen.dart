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

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  File? _profileImage;

  Future<void> _pickProfileImage() async {
    final File? image =
    await ImagePickerService.instance.pickImage(context);

    if (image == null) return;

    setState(() {
      _profileImage = image;
    });
  }

  final List<Map<String, dynamic>> profileItems = [
    {
      'title': 'Your profile',
      'icon': Iconsax.user,
    },
    {
      'title': 'Manage Address',
      'icon': Iconsax.location,
    },
    {
      'title': 'Payment Methods',
      'icon': Iconsax.card,
    },
    {
      'title': 'My Orders',
      'icon': Iconsax.clipboard_text,
    },
    {
      'title': 'My Coupons',
      'icon': Iconsax.calendar,
    },
    {
      'title': 'My Wallet',
      'icon': Iconsax.wallet_2,
    },
    {
      'title': 'Settings',
      'icon': Iconsax.setting_2,
    },
    {
      'title': 'Help Center',
      'icon': Iconsax.info_circle,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightColor,
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

          title: Text(
            'Profile',
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
                context.pop();
              },
            ),
          ),
        ),

        body: SafeArea(
          top: false,
          child: Column(
            children: [
              SizedBox(height: 15.h),

              /// Profile Image
              _buildProfileImagePicker(),

              SizedBox(height: 15.h),

              /// Name
              Text(
                "Esther Howard",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 12.h),

              /// Menu List
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: profileItems.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 1,
                      thickness: 0.8,
                      color: Colors.grey.shade200,
                    );
                  },
                  itemBuilder: (context, index) {
                    final item = profileItems[index];

                    return _buildProfileMenuItem(
                      title: item['title'],
                      icon: item['icon'],
                      onTap: () {
                        switch (index) {
                          case 0:
                          // Your profile
                            context.go(AppRoutes.editProfileScreen);
                            break;

                          case 1:
                          // Manage Address
                            context.push(AppRoutes.shippingAddressScreen);
                            break;

                          case 2:
                          // Payment Methods
                            context.push(AppRoutes.paymentMethodScreen);
                            break;

                          case 3:
                          // My Orders
                            context.push(AppRoutes.myOrderScreen);
                            break;

                          case 4:
                          // My Coupons
                            context.push(AppRoutes.couponScreen);
                            break;

                          case 5:
                          // My Wallet
                            context.push(AppRoutes.walletScreen);
                            break;

                          case 6:
                          // Settings
                            context.push(AppRoutes.settingScreen);
                            break;

                          case 7:
                          // Help Center
                            break;
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileMenuItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 58.h,
        child: Row(
          children: [
            Icon(
              icon,
              size: 22.sp,
              color: AppColors.primaryColor,
            ),

            SizedBox(width: 14.w),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ),

            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 17.sp,
              color: AppColors.primaryColor,
            ),
          ],
        ),
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
            width: 90.w,
            height: 90.w,
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