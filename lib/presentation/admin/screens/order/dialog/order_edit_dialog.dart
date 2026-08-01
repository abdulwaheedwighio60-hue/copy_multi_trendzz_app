import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import 'package:multi_trendzz/presentation/admin/screens/order/model/order_model.dart';

class OrderEditDialog {
  static void show(
      BuildContext context,
      OrderModel order,
      ) {
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

    String selectedStatus = order.status;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
            return ResponsiveDialog(
              title: "Update Order",

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  CircleAvatar(
                    radius: avatarRadius,
                    backgroundImage:
                    NetworkImage(order.customerImage),
                  ),

                  SizedBox(height: spacing),

                  Text(
                    order.customerName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    order.orderId,
                    style: TextStyle(
                      fontSize: textSize,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: spacing),

                  DropdownButtonFormField<String>(
                    value: selectedStatus,
                    isExpanded: true,
                    isDense: true,
                    menuMaxHeight: isMobile ? 220 : 280,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: isMobile ? 22 : 24,
                      color: Colors.grey.shade700,
                    ),
                    style: TextStyle(
                      fontSize: textSize,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      labelText: "Order Status",
                      labelStyle: TextStyle(
                        fontSize: textSize,
                        color: Colors.grey.shade700,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? 18 : 15,
                        vertical: isDesktop ? 18 : isTablet ? 16 : 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.primaryColor,
                          width: 1.5,
                        ),
                      ),
                    ),
                    items: [
                      "Pending",
                      "Processing",
                      "Shipped",
                      "Delivered",
                      "Cancelled",
                    ].map(
                          (status) => DropdownMenuItem(
                        value: status,
                        child: Text(
                          status,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: textSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedStatus = value;
                        });
                      }
                    },
                  )

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
                  text: "Update",
                  backgroundColor: AppColors.primaryColor,
                  icon: Icons.edit,
                  onPressed: () {

                    /// Update API

                    Navigator.pop(context);

                  },
                ),

              ],
            );
          },
        );
      },
    );
  }
}