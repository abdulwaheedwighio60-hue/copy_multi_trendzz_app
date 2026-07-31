import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/presentation/admin/screens/product/product_management_screen/product_management_screen.dart';
import 'package:multi_trendzz/presentation/admin/screens/seller/seller_management_screen/seller_management_screen.dart';

class AdminSidebarWidget extends StatelessWidget {
  const AdminSidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

    final double sidebarWidth = isDesktop
        ? 270
        : isTablet
        ? 240
        : 260;

    final double titleSize = isDesktop
        ? 24
        : isTablet
        ? 21
        : 18;

    final double menuSize = isDesktop
        ? 16
        : isTablet
        ? 15
        : 14;

    final double iconSize = isDesktop
        ? 24
        : 22;

    return Container(
      width: sidebarWidth,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 24,
      ),
      child: Column(
        children: [

          /// Logo
          Row(
            children: [

              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.storefront,
                  color: Colors.white,
                  size: 26,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  "Multi Trendzz",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 35),

          Expanded(
            child: ListView(
              children: [

                SidebarMenuTile(
                  icon: Icons.dashboard_outlined,
                  title: "Dashboard",
                  iconSize: iconSize,
                  fontSize: menuSize,
                  isSelected: true,
                ),

                SidebarMenuTile(
                  icon: Icons.shopping_bag_outlined,
                  title: "Products",
                  iconSize: iconSize,
                  fontSize: menuSize,
                  onTab: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductManagementScreen()));
                  },
                ),

                SidebarMenuTile(
                  icon: Icons.category_outlined,
                  title: "Categories",
                  iconSize: iconSize,
                  fontSize: menuSize,
                ),

                SidebarMenuTile(
                  icon: Icons.shopping_cart_outlined,
                  title: "Orders",
                  iconSize: iconSize,
                  fontSize: menuSize,
                ),

                SidebarMenuTile(
                  icon: Icons.people_outline,
                  title: "Customers",
                  iconSize: iconSize,
                  fontSize: menuSize,
                ),

                SidebarMenuTile(
                  icon: Icons.store_outlined,
                  title: "Sellers",
                  iconSize: iconSize,
                  fontSize: menuSize,
                  onTab: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SellerManagementScreen()));
                  },
                ),

                SidebarMenuTile(
                  icon: Icons.inventory_2_outlined,
                  title: "Inventory",
                  iconSize: iconSize,
                  fontSize: menuSize,
                ),

                SidebarMenuTile(
                  icon: Icons.local_offer_outlined,
                  title: "Coupons",
                  iconSize: iconSize,
                  fontSize: menuSize,
                ),

                SidebarMenuTile(
                  icon: Icons.bar_chart_outlined,
                  title: "Reports",
                  iconSize: iconSize,
                  fontSize: menuSize,
                ),

                SidebarMenuTile(
                  icon: Icons.settings_outlined,
                  title: "Settings",
                  iconSize: iconSize,
                  fontSize: menuSize,
                ),
              ],
            ),
          ),

          const Divider(),

          SidebarMenuTile(
            icon: Icons.logout,
            title: "Logout",
            iconSize: iconSize,
            fontSize: menuSize,
          ),
        ],
      ),
    );
  }
}

class SidebarMenuTile extends StatelessWidget {

  final IconData icon;
  final String title;
  final bool isSelected;
  final double fontSize;
  final double iconSize;
  final VoidCallback? onTab;

  const SidebarMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.fontSize,
    required this.iconSize,
    this.isSelected = false,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 8),

      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xffEEF2FF)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),

      child: ListTile(

        dense: true,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 4,
        ),

        leading: Icon(
          icon,
          size: iconSize,
          color: isSelected
              ? AppColors.primaryColor
              : Colors.grey.shade700,
        ),

        title: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight:
            isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected
                ? AppColors.primaryColor
                : Colors.black87,
          ),
        ),

        onTap: onTab,
      ),
    );
  }
}