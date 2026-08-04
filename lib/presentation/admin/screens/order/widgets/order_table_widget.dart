import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/widgets/table/responsive_data_table_widget.dart';
import 'package:multi_trendzz/core/widgets/table/table_action_button.dart';
import 'package:multi_trendzz/core/widgets/table/table_column_tile.dart';
import 'package:multi_trendzz/core/widgets/table/table_payment_badge.dart';
import 'package:multi_trendzz/core/widgets/table/table_status_badge.dart';
import 'package:multi_trendzz/presentation/admin/screens/order/dialog/order_delete_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/order/dialog/order_edit_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/order/dialog/order_view_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/order/model/order_model.dart';

class OrderTableWidget extends StatefulWidget {
  const OrderTableWidget({super.key});

  @override
  State<OrderTableWidget> createState() => _OrderTableWidgetState();
}

class _OrderTableWidgetState extends State<OrderTableWidget> {


  final List<OrderModel> orders = [

    OrderModel(
      orderId: "ORD-1001",
      customerName: "Ali Ahmed",
      customerImage: "https://i.pravatar.cc/150?img=11",
      sellerName: "Fashion Hub",
      totalAmount: 5200,
      paymentMethod: "Paid",
      status: "Delivered",
      orderDate: "01 Aug 2026",
    ),

    OrderModel(
      orderId: "ORD-1002",
      customerName: "Sara Khan",
      customerImage: "https://i.pravatar.cc/150?img=32",
      sellerName: "Tech Store",
      totalAmount: 18999,
      paymentMethod: "COD",
      status: "Pending",
      orderDate: "31 Jul 2026",
    ),

    OrderModel(
      orderId: "ORD-1003",
      customerName: "Ahmed Raza",
      customerImage: "https://i.pravatar.cc/150?img=15",
      sellerName: "Mobile World",
      totalAmount: 12500,
      paymentMethod: "Paid",
      status: "Processing",
      orderDate: "30 Jul 2026",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;




    if (width < 700) {
      return _mobileView();
    }

    return _desktopView();
  }

  Widget _desktopView() {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

    final double headingSize = isDesktop ? 15 : 13;
    final double textSize = isDesktop ? 14 : 12;
    final double avatarRadius = isDesktop ? 22 : 18;
    final double iconSize = isDesktop ? 18 : 16;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ResponsiveDataTableWidget(
        headingRowHeight: isDesktop ? 62 : 58,
        dataRowMinHeight: isDesktop ? 80 : 72,
        dataRowMaxHeight: isDesktop ? 82 : 74,
        horizontalMargin: isDesktop ? 20 : 14,
        columnSpacing: isDesktop ? 35 : 22,

        columns: const [

          DataColumn(
            label: TableColumnTitle("Customer"),
          ),

          DataColumn(
            label: TableColumnTitle("Order ID"),
          ),

          DataColumn(
            label: TableColumnTitle("Seller"),
          ),

          DataColumn(
            label: TableColumnTitle("Amount"),
          ),

          DataColumn(
            label: TableColumnTitle("Payment"),
          ),

          DataColumn(
            label: TableColumnTitle("Status"),
          ),

          DataColumn(
            label: TableColumnTitle("Date"),
          ),

          DataColumn(
            label: TableColumnTitle("Actions"),
          ),
        ],

        rows: orders.map((order) {
          return DataRow(
            cells: [

              /// Customer
              DataCell(
                SizedBox(
                  width: isDesktop ? 220 : 180,
                  child: Row(
                    children: [

                      CircleAvatar(
                        radius: avatarRadius,
                        backgroundImage:
                        NetworkImage(order.customerImage),
                      ),

                      SizedBox(width: isDesktop ? 12 : 8),

                      Expanded(
                        child: Text(
                          order.customerName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: textSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Order ID
              DataCell(
                Text(
                  order.orderId,
                  style: TextStyle(fontSize: textSize),
                ),
              ),

              /// Seller
              DataCell(
                SizedBox(
                  width: isDesktop ? 150 : 120,
                  child: Text(
                    order.sellerName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
              ),

              /// Amount
              DataCell(
                Text(
                  "Rs ${order.totalAmount.toStringAsFixed(0)}",
                  style: TextStyle(
                    fontSize: textSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              /// Payment
              DataCell(
                TablePaymentBadge(
                  text: order.paymentMethod,
                ),
              ),

              /// Status
              DataCell(
                TableStatusBadge(
                  text: order.status,
                ),
              ),

              /// Date
              DataCell(
                Text(
                  order.orderDate,
                  style: TextStyle(fontSize: textSize),
                ),
              ),

              /// Actions
              DataCell(
                Row(
                  children: [

                    TableActionButton(
                      icon: Icons.visibility_outlined,
                      color: Colors.blue,
                      tooltip: "View Order",
                      onTap: () {
                        OrderViewDialog.show(
                          context,
                          order,
                        );
                      },
                    ),

                    SizedBox(width: 4.w),

                    TableActionButton(
                      icon: Icons.edit_outlined,
                      color: Colors.orange,
                      tooltip: "Update Order",
                      onTap: () {
                        OrderEditDialog.show(
                          context,
                          order,
                        );
                      },
                    ),

                    SizedBox(width: 4.w),

                    TableActionButton(
                      icon: Icons.delete_outline,
                      color: Colors.red,
                      tooltip: "Delete Order",
                      onTap: () {
                        OrderDeleteDialog.show(
                          context,
                          order,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }




  Widget _mobileView() {
    final width = MediaQuery.of(context).size.width;

    final bool isSmall = width < 400;

    final double avatarRadius = isSmall ? 24 : 28;
    final double titleSize = isSmall ? 15 : 16;
    final double textSize = isSmall ? 12 : 13;
    final double iconSize = isSmall ? 16 : 18;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (_, index) {
        final order = orders[index];

        return Container(
          padding: EdgeInsets.all(isSmall ? 16 : 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.grey.shade200,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Customer
              Row(
                children: [

                  CircleAvatar(
                    radius: avatarRadius,
                    backgroundImage:
                    NetworkImage(order.customerImage),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Text(
                          order.customerName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          order.orderId,
                          style: TextStyle(
                            fontSize: textSize,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              _infoRow(
                "Seller",
                order.sellerName,
                textSize,
              ),

              _infoRow(
                "Amount",
                "Rs ${order.totalAmount.toStringAsFixed(0)}",
                textSize,
              ),

              const SizedBox(height: 12),

              Row(
                children: [

                  Expanded(
                    child: _paymentBadge(
                      order.paymentMethod,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: _statusBadge(
                      order.status,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              _infoRow(
                "Date",
                order.orderDate,
                textSize,
              ),

              const Divider(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  _actionButton(
                    context,
                    Icons.visibility_outlined,
                    Colors.blue,
                    "View Order",
                        () {
                          OrderViewDialog.show(
                            context,
                            order,
                          );
                    },
                  ),
                  SizedBox(width: 3.w,),
                  _actionButton(
                    context,
                    Icons.edit_outlined,
                    Colors.orange,
                    "Update Order",
                        () {
                          OrderEditDialog.show(
                            context,
                            order,
                          );
                    },
                  ),
                  SizedBox(width: 3.w,),
                  _actionButton(
                    context,
                    Icons.delete_outline,
                    Colors.red,
                    "Delete Order",
                        () {
                          OrderDeleteDialog.show(
                            context,
                            order,
                          );
                    },
                  ),

                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _actionButton(
      BuildContext context,
      IconData icon,
      Color color,
      String tooltip,
      VoidCallback onTap,
      ) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: color.withOpacity(.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 18,
            color: color,
          ),
        ),
      ),
    );
  }

  Widget _paymentBadge(String payment) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

    final double fontSize = isDesktop
        ? 13
        : isTablet
        ? 12
        : 11;

    final double horizontalPadding = isDesktop
        ? 5
        : isTablet
        ? 10
        : 8;

    final double verticalPadding = isDesktop
        ? 2
        : isTablet
        ? 4
        : 5;

    final bool paid = payment == "Paid";

    return Container(
      height: isDesktop ? 28 : 32,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: paid
            ? Colors.green.withOpacity(.12)
            : Colors.orange.withOpacity(.12),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        payment,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: paid
              ? Colors.green
              : Colors.orange,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _statusBadge(String status) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

    final double fontSize = isDesktop
        ? 13
        : isTablet
        ? 12
        : 11;

    final double horizontalPadding = isDesktop
        ? 12
        : isTablet
        ? 10
        : 8;

    final double verticalPadding = isDesktop
        ? 2
        : isTablet
        ? 4
        : 5;

    Color color;

    switch (status) {
      case "Pending":
        color = Colors.orange;
        break;

      case "Processing":
        color = Colors.blue;
        break;

      case "Shipped":
        color = Colors.deepPurple;
        break;

      case "Delivered":
        color = Colors.green;
        break;

      default:
        color = Colors.red;
    }

    return Container(
      height: isDesktop ? 28 : 32,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        status,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }




  Widget _infoRow(
      String title,
      String value,
      double textSize,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [

          SizedBox(
            width: 70,
            child: Text(
              "$title :",
              style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
          ),

          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

}