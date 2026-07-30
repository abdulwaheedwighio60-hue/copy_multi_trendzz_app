import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import '../widgets/settings_header_widget.dart';
import '../widgets/settings_profile_card_widget.dart';
import '../widgets/settings_section_widget.dart';
import '../widgets/settings_tile_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState
    extends State<SettingsScreen> {

  bool notificationEnabled = true;

  bool darkMode = false;

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(

      value: const SystemUiOverlayStyle(

        statusBarColor: AppColors.primaryColor,

        statusBarIconBrightness:
        Brightness.light,

      ),

      child: Scaffold(

        backgroundColor:
        const Color(0xffF5F6FA),

        body: SafeArea(

          child: SingleChildScrollView(

            child: Column(

              children: [

                /// Header

                const SettingsHeaderWidget(),

                /// Profile Card

                SettingsProfileCardWidget(

                  sellerName:
                  "Abdul Waheed",

                  storeName:
                  "Waheed Store",

                  email:
                  "abdulwaheed@gmail.com",

                  imageUrl:
                  "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=500",

                  onEdit: () {

                    /// Navigate Seller Profile

                  },

                ),

                /// Store Settings

                const SettingsSectionWidget(

                  title:
                  "Store Settings",

                  subtitle:
                  "Manage your store information",

                ),

                SettingsTileWidget(

                  leadingIcon:
                  Iconsax.profile_circle,

                  title:
                  "Seller Profile",

                  subtitle:
                  "Manage seller profile",

                  onTap: () {
                    context.push(AppRoutes.sellerProfileScreen);
                  },

                ),

                SettingsTileWidget(

                  leadingIcon:
                  Iconsax.building,

                  title:
                  "Business Information",

                  subtitle:
                  "Business details",

                  onTap: () {
                    context.push(AppRoutes.businessInformationScreen);
                  },

                ),

                SettingsTileWidget(

                  leadingIcon:
                  Iconsax.card,

                  title:
                  "Bank Account",

                  subtitle:
                  "Manage bank account",

                  onTap: () {
                    context.push(AppRoutes.bankAccountScreen);
                  },

                ),

                SettingsTileWidget(

                  leadingIcon:
                  Iconsax.truck,

                  title:
                  "Shipping Settings",

                  subtitle:
                  "Shipping charges & methods",

                  onTap: () {
                    context.push(AppRoutes.shippingSettingScreen);
                  },

                ),

                SettingsTileWidget(

                  leadingIcon:
                  Iconsax.receipt_item,

                  title:
                  "Tax Settings",

                  subtitle:
                  "Manage taxes",

                  onTap: () {
                    context.push(AppRoutes.taxSettingsScreen);
                  },

                ),

                /// Preferences

                const SettingsSectionWidget(

                  title:
                  "Preferences",

                  subtitle:
                  "Customize your experience",

                ),

                Container(

                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(16),

                  ),

                  child: SwitchListTile(

                    value:
                    notificationEnabled,

                    activeColor:
                    AppColors.primaryColor,

                    contentPadding:
                    EdgeInsets.zero,

                    title: const Text(
                      "Notifications",
                    ),

                    secondary:
                    const Icon(
                      Iconsax.notification,
                    ),

                    onChanged:
                        (value){

                      setState(() {

                        notificationEnabled =
                            value;

                      });

                    },

                  ),

                ),

                Container(

                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(16),

                  ),

                  child: SwitchListTile(

                    value:
                    darkMode,

                    activeColor:
                    AppColors.primaryColor,

                    contentPadding:
                    EdgeInsets.zero,

                    title: const Text(
                      "Dark Mode",
                    ),

                    secondary:
                    const Icon(
                      Iconsax.moon,
                    ),

                    onChanged:
                        (value){

                      setState(() {

                        darkMode =
                            value;

                      });

                    },

                  ),

                ),

                /// Security

                const SettingsSectionWidget(

                  title:
                  "Account",

                  subtitle:
                  "Security settings",

                ),

                SettingsTileWidget(

                  leadingIcon:
                  Iconsax.shield_tick,

                  title:
                  "Security",

                  subtitle:
                  "Password & security",

                  onTap: () {
                    context.push(AppRoutes.securityScreen);
                  },

                ),

                SettingsTileWidget(

                  leadingIcon:
                  Iconsax.logout,

                  title:
                  "Logout",

                  subtitle:
                  "Sign out from account",

                  iconColor:
                  Colors.red,

                  textColor:
                  Colors.red,

                  showArrow:
                  false,

                  onTap: () {

                    /// Logout

                  },

                ),

                const SizedBox(
                  height: 30,
                ),

              ],

            ),

          ),

        ),

      ),

    );

  }

}