import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/presentation/admin/screens/category/category_management_screen.dart';
import 'package:multi_trendzz/presentation/admin/screens/customer/customer_management_screen.dart';
import 'package:multi_trendzz/presentation/admin/screens/order/order_management_screen.dart';
import 'package:multi_trendzz/presentation/admin/screens/product/product_management_screen/product_management_screen.dart';
import 'package:multi_trendzz/presentation/admin/screens/seller/seller_management_screen/seller_management_screen.dart';

class AdminSidebarWidget extends StatefulWidget {

  const AdminSidebarWidget({super.key});

  @override
  State<AdminSidebarWidget> createState() => _AdminSidebarWidgetState();
}

class _AdminSidebarWidgetState extends State<AdminSidebarWidget> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

    final double sidebarWidth = isDesktop ? 270 : isTablet ? 240 : 260;

    final double titleSize = isDesktop ? 24 : isTablet ? 21 : 18;

    final double menuSize = isDesktop ? 16 : isTablet ? 15 : 14;

    final double iconSize = isDesktop ? 24 : 22;

    final menus = [
      ///comment
      {
        "title": "Dashboard",
        "icon": Icons.dashboard_outlined,
        "page": null,
      },

      {
        "title": "Products",
        "icon": Icons.shopping_bag_outlined,
        "page": const ProductManagementScreen(),
      },

      {
        "title": "Categories",
        "icon": Icons.category_outlined,
        "page": const CategoryManagementScreen(),
      },

      {
        "title": "Orders",
        "icon": Icons.shopping_cart_outlined,
        "page": const OrderManagementScreen(),
      },

      {
        "title": "Customers",
        "icon": Icons.people_outline,
        "page": const CustomerManagementScreen(),
      },

      {
        "title": "Sellers",
        "icon": Icons.store_outlined,
        "page": const SellerManagementScreen(),
      },

      {
        "title": "Inventory",
        "icon": Icons.inventory_2_outlined,
        "page": null,
      },

      {
        "title": "Coupons",
        "icon": Icons.local_offer_outlined,
        "page": null,
      },

      {
        "title": "Reports",
        "icon": Icons.bar_chart_outlined,
        "page": null,
      },

      {
        "title": "Settings",
        "icon": Icons.settings_outlined,
        "page": null,
      },
    ];

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
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  "Multi Trendzz",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleSize,
                  ),
                ),
              ),

            ],
          ),

          const SizedBox(height: 35),

          Expanded(
            child: ListView.builder(

              itemCount: menus.length,

              itemBuilder: (context,index){

                return SidebarMenuTile(

                  icon: menus[index]["icon"] as IconData,

                  title: menus[index]["title"] as String,

                  fontSize: menuSize,

                  iconSize: iconSize,

                  isSelected: selectedIndex==index,

                  onTap: (){

                    setState(() {
                      selectedIndex=index;
                    });

                    final page=menus[index]["page"];

                    if(page!=null){

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_)=>page as Widget,
                        ),
                      );

                    }

                  },

                );

              },

            ),
          ),

          const Divider(),

          SidebarMenuTile(

            icon: Icons.logout,

            title: "Logout",

            iconSize: iconSize,

            fontSize: menuSize,

            onTap: (){

            },

          ),

        ],

      ),

    );

  }

}

class SidebarMenuTile extends StatefulWidget {

  final IconData icon;
  final String title;
  final bool isSelected;
  final double fontSize;
  final double iconSize;
  final VoidCallback? onTap;

  const SidebarMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.fontSize,
    required this.iconSize,
    this.isSelected=false,
    this.onTap,
  });

  @override
  State<SidebarMenuTile> createState() => _SidebarMenuTileState();
}

class _SidebarMenuTileState extends State<SidebarMenuTile> {

  bool isHover=false;

  @override
  Widget build(BuildContext context) {

    final activeColor = AppColors.primaryColor;

    return MouseRegion(

      cursor: SystemMouseCursors.click,

      onEnter: (_){
        setState(() {
          isHover=true;
        });
      },

      onExit: (_){
        setState(() {
          isHover=false;
        });
      },

      child: InkWell(

        borderRadius: BorderRadius.circular(14),

        onTap: widget.onTap,

        child: AnimatedContainer(

          duration: const Duration(milliseconds: 220),

          margin: const EdgeInsets.only(bottom: 8),

          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),

          decoration: BoxDecoration(

            color: widget.isSelected
                ? activeColor.withOpacity(.10)
                : isHover
                ? activeColor.withOpacity(.05)
                : Colors.transparent,

            borderRadius: BorderRadius.circular(14),

            border: widget.isSelected
                ? Border.all(
              color: activeColor.withOpacity(.25),
            )
                : null,

          ),

          child: Row(

            children: [

              AnimatedContainer(

                duration: const Duration(milliseconds: 220),

                width: 38,
                height: 38,

                decoration: BoxDecoration(

                  color: widget.isSelected
                      ? activeColor
                      : isHover
                      ? activeColor.withOpacity(.10)
                      : Colors.grey.shade100,

                  borderRadius: BorderRadius.circular(10),

                ),

                child: Icon(

                  widget.icon,

                  size: widget.iconSize,

                  color: widget.isSelected
                      ? Colors.white
                      : isHover
                      ? activeColor
                      : Colors.grey.shade700,

                ),

              ),

              const SizedBox(width: 14),

              Expanded(

                child: Text(

                  widget.title,

                  style: TextStyle(

                    fontSize: widget.fontSize,

                    fontWeight: widget.isSelected
                        ? FontWeight.w700
                        : FontWeight.w500,

                    color: widget.isSelected
                        ? activeColor
                        : isHover
                        ? activeColor
                        : Colors.black87,

                  ),

                ),

              ),

              if(widget.isSelected)

                Container(

                  width: 5,

                  height: 28,

                  decoration: BoxDecoration(

                    color: activeColor,

                    borderRadius: BorderRadius.circular(30),

                  ),

                ),

            ],

          ),

        ),

      ),

    );

  }

}