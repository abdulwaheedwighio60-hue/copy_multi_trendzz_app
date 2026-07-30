import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

import '../../../core/constants/app_colors.dart';
import 'admin_menu_item_widget.dart';

class AdminSidebarWidget extends StatelessWidget {

  final int selectedIndex;

  final Function(int) onItemSelected;

  const AdminSidebarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {

    final menus = [

      {
        "title":"Dashboard",
        "icon":Iconsax.category,
      },

      {
        "title":"Buyers",
        "icon":Iconsax.profile_2user,
      },

      {
        "title":"Sellers",
        "icon":Iconsax.shop,
      },

      {
        "title":"Products",
        "icon":Iconsax.box,
      },

      {
        "title":"Orders",
        "icon":Iconsax.shopping_cart,
      },

      {
        "title":"Reports",
        "icon":Iconsax.chart_2,
      },

      {
        "title":"Settings",
        "icon":Iconsax.setting_2,
      },

    ];

    return Container(

      width: 260,

      color: Colors.white,

      padding: EdgeInsets.all(20.w),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          SizedBox(height:15.h),

          Row(

            children: [

              CircleAvatar(

                radius:24,

                backgroundColor:
                AppColors.primaryColor,

                child: Icon(
                  Iconsax.monitor,
                  color: Colors.white,
                ),

              ),

              SizedBox(width:12.w),

              Expanded(

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    Text(
                      "Multi Trendzz",
                      style:
                      AppTextStyles.titleMedium,
                    ),

                    Text(
                      "Admin Panel",
                      style:
                      AppTextStyles.bodySmall,
                    ),

                  ],
                ),
              ),
            ],
          ),

          SizedBox(height:35.h),

          Expanded(

            child: ListView.builder(

              itemCount: menus.length,

              itemBuilder: (_,index){

                final item = menus[index];

                return AdminMenuItemWidget(

                  icon:
                  item["icon"] as IconData,

                  title:
                  item["title"] as String,

                  isSelected:
                  selectedIndex==index,

                  onTap:(){

                    onItemSelected(index);

                  },

                );

              },

            ),

          ),

          Divider(),

          SizedBox(height:10.h),

          ListTile(

            leading: CircleAvatar(

              backgroundColor:
              AppColors.primaryColor,

              child: Text(
                "A",
                style: AppTextStyles.labelLarge,
              ),

            ),

            title: Text(
              "Admin",
              style:
              AppTextStyles.bodyMedium.copyWith(
                color:
                AppColors.textPrimary,
              ),
            ),

            subtitle: Text(
              "Super Admin",
              style:
              AppTextStyles.bodySmall,
            ),

          ),

        ],
      ),
    );
  }
}