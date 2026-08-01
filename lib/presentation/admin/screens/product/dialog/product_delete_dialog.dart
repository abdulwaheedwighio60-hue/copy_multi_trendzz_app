import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import '../model/product_model.dart';

class ProductDeleteDialog {
  static void show(
      BuildContext context,
      ProductModel product,
      ) {
    showDialog(
      context: context,
      builder: (_) {
        final width = MediaQuery.of(context).size.width;

        final bool isMobile = width < 600;
        final bool isTablet = width >= 600 && width < 1100;

        final double fontSize = isMobile
            ? 13
            : isTablet
            ? 15
            : 16;

        final double iconSize = isMobile
            ? 45
            : isTablet
            ? 55
            : 65;

        return ResponsiveDialog(
          title: "Delete Product",

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              CircleAvatar(
                radius: iconSize / 2,
                backgroundColor: Colors.red.withOpacity(.1),

                child: Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                  size: iconSize * .55,
                ),
              ),

              SizedBox(
                height: isMobile ? 16 : 22,
              ),

              Text(
                "Are you sure you want to permanently delete '${product.productName}'?",

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: fontSize,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),

              SizedBox(
                height: isMobile ? 10 : 14,
              ),

              Text(
                "This action cannot be undone.",

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: fontSize - 1,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),

          actions: [

            ResponsiveDialogButton(
              text: "Cancel",
              isPrimary: false,
              icon: Icons.close,
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            ResponsiveDialogButton(
              text: "Delete",
              backgroundColor: Colors.red,
              icon: Icons.delete_outline,
              onPressed: () {

                // Delete API

                Navigator.pop(context);
              },
            ),

          ],
        );
      },
    );
  }
}