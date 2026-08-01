import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import 'package:multi_trendzz/presentation/admin/screens/order/model/order_model.dart';

class OrderDeleteDialog {
  static void show(
      BuildContext context,
      OrderModel order,
      ) {

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

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

    final double avatarRadius = isDesktop
        ? 48
        : isTablet
        ? 44
        : 38;

    showDialog(
      context: context,
      builder: (_) {

        return ResponsiveDialog(

          title: "Delete Order",

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              CircleAvatar(
                radius: avatarRadius,
                backgroundImage:
                NetworkImage(order.customerImage),
              ),

              const SizedBox(height: 18),

              Text(
                order.customerName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                order.orderId,
                style: TextStyle(
                  fontSize: textSize,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Are you sure you want to delete this order?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: textSize,
                  height: 1.5,
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