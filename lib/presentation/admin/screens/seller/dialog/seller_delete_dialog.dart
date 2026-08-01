import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import '../model/seller_category_model.dart';

class SellerDeleteDialog {

  static void show(
      BuildContext context,
      SellerCategoryModel seller,
      ) {

    showDialog(

      context: context ,

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

          title: "Delete Seller",

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Icon(
                Icons.delete_forever_rounded,
                color: Colors.red,
                size: isMobile
                    ? 55
                    : 70,
              ),

              SizedBox(height: spacing),

              Text(
                "Are you sure you want to delete '${seller.categoryName}'?",

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: textSize,
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
              text: "Delete",
              backgroundColor: Colors.red,
              icon: Icons.delete_outline,
              onPressed: (){

                /// Delete API

                Navigator.pop(context);

              },
            ),

          ],

        );

      },

    );

  }

}