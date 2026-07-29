import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  final List<Map<String, dynamic>> profileItems = [
    {
      'title': 'Notification Settings',
      'icon': Iconsax.notification,
    },
    {
      'title': 'Password Manager',
      'icon': Iconsax.key,
    },
    {
      'title': 'Delete Account',
      'icon': Iconsax.trash,
    },

  ];

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

          title: Text(
            'Settings',
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
        body: ListView.separated(
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
                  //context.push(AppRoutes.editProfileScreen);
                    break;

                  case 1:
                  // Manage Address
                  //.push(AppRoutes.shippingAddressScreen);
                    break;

                  case 2:
                  // Payment Methods
                  //context.push(AppRoutes.paymentMethodScreen);
                    break;

                  case 3:
                  // My Orders
                  //context.push(AppRoutes.myOrderScreen);
                    break;

                  case 4:
                  // My Coupons
                  //  context.push(AppRoutes.couponScreen);

                    break;

                  case 5:
                  // My Wallet
                  // context.push(AppRoutes.walletScreen);
                    break;

                  case 6:
                  // Settings
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
}