import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_tile.dart';
import 'package:multi_trendzz/presentation/admin/screens/order/model/order_model.dart';

class OrderViewDialog {
  static void show(
      BuildContext context,
      OrderModel order,
      ) {
    showDialog(
      context: context,
      builder: (_) {
        return ResponsiveDialog(
          title: "Order Details",

          child: Column(
            children: [

              CircleAvatar(
                radius: 45,
                backgroundImage:
                NetworkImage(order.customerImage),
              ),

              const SizedBox(height: 20),

              ResponsiveDialogTile(
                title: "Customer",
                value: order.customerName,
              ),

              ResponsiveDialogTile(
                title: "Order ID",
                value: order.orderId,
              ),

              ResponsiveDialogTile(
                title: "Seller",
                value: order.sellerName,
              ),

              ResponsiveDialogTile(
                title: "Amount",
                value: "Rs ${order.totalAmount}",
              ),

              ResponsiveDialogTile(
                title: "Payment",
                value: order.paymentMethod,
              ),

              ResponsiveDialogTile(
                title: "Status",
                value: order.status,
              ),

              ResponsiveDialogTile(
                title: "Date",
                value: order.orderDate,
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

          ],
        );
      },
    );
  }
}