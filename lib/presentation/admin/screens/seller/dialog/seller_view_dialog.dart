import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_tile.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import '../model/seller_category_model.dart';

class SellerViewDialog {

  static void show(
      BuildContext context,
      SellerCategoryModel seller,
      ) {

    showDialog(
      context: context,
      builder: (_) {
        final width = MediaQuery.of(context).size.width;

        final bool isDesktop = width >= 1100;
        final bool isTablet = width >= 700 && width < 1100;
        final bool isMobile = width < 700;

        final double avatarRadius = isDesktop
            ? 50
            : isTablet
            ? 45
            : 38;

        final double titleSize = isDesktop
            ? 18
            : isTablet
            ? 17
            : 16;

        final double textSize = isDesktop
            ? 15
            : isTablet
            ? 14
            : 13;

        final double spacing = isDesktop
            ? 22
            : isTablet
            ? 18
            : 15;
        return ResponsiveDialog(

          title: "Seller Details",

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              CircleAvatar(
                radius: avatarRadius,
                backgroundImage: NetworkImage(seller.image),
              ),

              SizedBox(height: spacing),

              Text(
                seller.categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: spacing),

              ResponsiveDialogTile(
                title: "Category",
                value: seller.categoryName,

              ),

              ResponsiveDialogTile(
                title: "Slug",
                value: seller.slug,

              ),

              ResponsiveDialogTile(
                title: "Products",
                value: seller.totalProducts.toString(),

              ),

              ResponsiveDialogTile(
                title: "Sales",
                value: seller.totalSales.toString(),

              ),

              ResponsiveDialogTile(
                title: "Created",
                value: seller.createdDate,

              ),

              ResponsiveDialogTile(
                title: "Status",
                value: seller.active ? "Active" : "Inactive",

              ),

            ],
          ),

          actions: [

            ResponsiveDialogButton(
              text: "Close",
              isPrimary: false,
              icon: Icons.close,
              onPressed: (){
                Navigator.pop(context);
              },
            ),

          ],

        );

      },
    );
  }
}