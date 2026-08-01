import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import '../model/product_model.dart';

class ProductBlockDialog {
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
          title: product.active
              ? "Block Product"
              : "Unblock Product",

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              CircleAvatar(
                radius: iconSize / 2,
                backgroundColor: product.active
                    ? Colors.red.withOpacity(.1)
                    : Colors.green.withOpacity(.1),

                child: Icon(
                  product.active
                      ? Icons.block
                      : Icons.check_circle_outline,
                  color:
                  product.active ? Colors.red : Colors.green,
                  size: iconSize * .55,
                ),
              ),

              SizedBox(
                height: isMobile ? 16 : 22,
              ),

              Text(
                product.active
                    ? "Are you sure you want to block '${product.productName}'?"
                    : "Do you want to activate '${product.productName}' again?",

                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: fontSize,
                  height: 1.5,
                  color: Colors.black87,
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