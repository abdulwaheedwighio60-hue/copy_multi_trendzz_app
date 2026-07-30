import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';


class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {

  bool orderNotifications = true;
  bool productNotifications = true;
  bool paymentNotifications = true;
  bool customerNotifications = true;
  bool promotionalNotifications = false;
  bool emailNotifications = true;
  bool smsNotifications = false;
  bool pushNotifications = true;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xffF5F6FA),

        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          title: const Text("Notification Settings"),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _sectionTitle("Seller Notifications"),

              _buildSwitchTile(
                icon: Iconsax.box,
                title: "Order Notifications",
                subtitle: "Receive updates for new orders",
                value: orderNotifications,
                onChanged: (value) {
                  setState(() => orderNotifications = value);
                },
              ),

              _buildSwitchTile(
                icon: Iconsax.shopping_bag,
                title: "Product Notifications",
                subtitle: "Stock & product updates",
                value: productNotifications,
                onChanged: (value) {
                  setState(() => productNotifications = value);
                },
              ),

              _buildSwitchTile(
                icon: Iconsax.wallet_money,
                title: "Payment Notifications",
                subtitle: "Payout & payment alerts",
                value: paymentNotifications,
                onChanged: (value) {
                  setState(() => paymentNotifications = value);
                },
              ),

              _buildSwitchTile(
                icon: Iconsax.profile_2user,
                title: "Customer Notifications",
                subtitle: "Customer activity alerts",
                value: customerNotifications,
                onChanged: (value) {
                  setState(() => customerNotifications = value);
                },
              ),

              SizedBox(height: 25.h),

              _sectionTitle("Communication"),

              _buildSwitchTile(
                icon: Iconsax.sms,
                title: "Email Notifications",
                subtitle: "Receive updates via email",
                value: emailNotifications,
                onChanged: (value) {
                  setState(() => emailNotifications = value);
                },
              ),

              _buildSwitchTile(
                icon: Iconsax.message,
                title: "SMS Notifications",
                subtitle: "Receive SMS alerts",
                value: smsNotifications,
                onChanged: (value) {
                  setState(() => smsNotifications = value);
                },
              ),

              _buildSwitchTile(
                icon: Iconsax.notification,
                title: "Push Notifications",
                subtitle: "Receive app notifications",
                value: pushNotifications,
                onChanged: (value) {
                  setState(() => pushNotifications = value);
                },
              ),

              SizedBox(height: 25.h),

              _sectionTitle("Marketing"),

              _buildSwitchTile(
                icon: Iconsax.discount_shape,
                title: "Promotional Notifications",
                subtitle: "Offers & promotional campaigns",
                value: promotionalNotifications,
                onChanged: (value) {
                  setState(() => promotionalNotifications = value);
                },
              ),

              SizedBox(height: 30.h),

              SizedBox(
                width: double.infinity,
                height: 55.h,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Notification Settings Updated Successfully",
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  icon: const Icon(
                    Iconsax.tick_circle,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Save Changes",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30.h),

            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: SwitchListTile(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primaryColor,
        secondary: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}