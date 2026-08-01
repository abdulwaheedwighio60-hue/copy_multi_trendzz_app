import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import '../model/seller_category_model.dart';

class SellerEditDialog {

  static void show(
      BuildContext context, SellerCategoryModel seller,) {

    final categoryController =
    TextEditingController(
      text: seller.categoryName,
    );

    final slugController =
    TextEditingController(
      text: seller.slug,
    );

    final productController =
    TextEditingController(
      text: seller.totalProducts.toString(),
    );

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

          title: "Edit Seller",

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextField(
                controller: categoryController,
                style: TextStyle(fontSize: textSize),
                decoration: InputDecoration(
                  labelText: "Category",
                  labelStyle: TextStyle(fontSize: textSize),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: isMobile ? 14 : 16,
                  ),
                ),
              ),

              SizedBox(height: spacing),

              TextField(
                controller: slugController,
                style: TextStyle(fontSize: textSize),
                decoration: InputDecoration(
                  labelText: "Slug",
                  labelStyle: TextStyle(fontSize: textSize),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: isMobile ? 14 : 16,
                  ),
                ),
              ),

              SizedBox(height: spacing),

              TextField(
                controller: productController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: textSize),
                decoration: InputDecoration(
                  labelText: "Products",
                  labelStyle: TextStyle(fontSize: textSize),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: isMobile ? 14 : 16,
                  ),
                ),
              ),

            ],
          ),

          actions: [

            ResponsiveDialogButton(
              text: "Cancel",
              isPrimary: false,
              icon: Icons.close,
              onPressed: (){
                Navigator.pop(context);
              },
            ),

            ResponsiveDialogButton(
              text: "Update",
              icon: Icons.edit,
              onPressed: (){

                /// Update API

                Navigator.pop(context);

              },
            ),

          ],

        );

      },

    );

  }

}