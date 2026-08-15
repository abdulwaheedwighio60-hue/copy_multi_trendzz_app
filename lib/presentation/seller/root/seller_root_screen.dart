import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/model/botton_nav_item.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/features/chat/screens/chat_list/seller_chat_list_screen.dart';
import 'package:multi_trendzz/presentation/seller/products/screens/manage_products_screen/manage_products_screen.dart';
import 'package:multi_trendzz/presentation/seller/seller_dashboard/seller_dashboard_screen.dart';
import 'package:multi_trendzz/presentation/seller/settings/screens/seller_profile_screen.dart';

class SellerRootScreen extends StatefulWidget {
  const SellerRootScreen({super.key});

  @override
  State<SellerRootScreen> createState() => _SellerRootScreenState();
}

class _SellerRootScreenState extends State<SellerRootScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    SellerDashboardScreen(),
    SellerChatListScreen(),
    ManageProductsScreen(),
    // SellerAnalyticsScreen(),
    SellerProfileScreen(),
  ];

  final List<BottomNavItem> navItems = const [
    BottomNavItem(
      title: 'Dashboard',
      icon: Iconsax.home,
      activeIcon: Iconsax.home_15,
    ),
    BottomNavItem(
      title: 'Products',
      icon: Iconsax.box,
      activeIcon: Iconsax.box5,
    ),
    BottomNavItem(
      title: 'Orders',
      icon: Iconsax.shopping_bag,
      activeIcon: Iconsax.shopping_bag5,
    ),
    BottomNavItem(
      title: 'Analytics',
      icon: Iconsax.chart,
      activeIcon: Iconsax.chart5,
    ),
    BottomNavItem(
      title: 'Profile',
      icon: Iconsax.user,
      activeIcon: Iconsax.user,
    ),
  ];

  void onTabChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true,
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          bottom: 10.h,
        ),
        child: Container(
          height: 70.h,
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(22.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.08),
                blurRadius: 20.r,
                offset: Offset(0, 8.h),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              navItems.length,
                  (index) {
                final item = navItems[index];
                final bool isSelected = selectedIndex == index;

                return Expanded(
                  child: _BottomNavButton(
                    title: item.title,
                    icon: isSelected ? item.activeIcon : item.icon,
                    isSelected: isSelected,
                    onTap: () => onTabChanged(index),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavButton extends StatelessWidget {
  const _BottomNavButton({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color activeColor = AppColors.primaryColor;
    final Color inactiveColor = AppColors.greyColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: isSelected ? 32.w : 28.w,
            height: isSelected ? 32.w : 28.w,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primaryColor.withOpacity(0.16)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: isSelected ? 20.sp : 19.sp,
              color: isSelected ? activeColor : inactiveColor,
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodySmall.copyWith(
              color: isSelected ? activeColor : inactiveColor,
              fontSize: 10.sp,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}