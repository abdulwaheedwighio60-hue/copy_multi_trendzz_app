import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import '../model/customer_model.dart';
import '../../../../../../core/widgets/responsive_dialog.dart';


class CustomerViewDialog {
  static void show(BuildContext context, CustomerModel customer,) {
    showDialog(
      context: context,
      builder: (_) {
        return ResponsiveDialog(
          title: "Customer Details",
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage:
                NetworkImage(customer.image),
              ),
              const SizedBox(height: 20),
              _dialogTile(
                context,
                "Name",
                customer.name,
              ),
              _dialogTile(
                context,
                "Email",
                customer.email,
              ),
              _dialogTile(
                context,
                "Phone",
                customer.phone,
              ),
              _dialogTile(
                context,
                "Orders",
                customer.orders.toString(),
              ),
              _dialogTile(
                context,
                "Status",
                customer.active
                    ? "Active"
                    : "Blocked",
              ),
              _dialogTile(
                context,
                "Join Date",
                customer.joinDate,

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


  static Widget _dialogTile(BuildContext context,
      String title,
      String value,) {
    final width = MediaQuery
        .of(context)
        .size
        .width;


    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;


    final double fontSize =
    isDesktop
        ? 15
        : isTablet
        ? 14
        : 13;


    final double labelWidth =
    isDesktop
        ? 100
        : isTablet
        ? 90
        : 80;
    return Padding(
      padding: EdgeInsets.only(bottom: isMobile ? 10 : 12,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: labelWidth,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: fontSize,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}