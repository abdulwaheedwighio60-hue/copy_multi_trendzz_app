import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/table/responsive_data_table_widget.dart';
import 'package:multi_trendzz/core/widgets/table/table_column_tile.dart';
import 'package:multi_trendzz/core/widgets/table/table_status_badge.dart';

class RecentOrdersWidget extends StatelessWidget {
  const RecentOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

    final double titleSize = isDesktop
        ? 22
        : isTablet
        ? 20
        : 18;

    final double headingSize = isDesktop
        ? 15
        : isTablet
        ? 14
        : 12;

    final double rowSize = isDesktop
        ? 14
        : isTablet
        ? 13
        : 12;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Orders",
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          /// Responsive Table
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ResponsiveDataTableWidget(
              headingRowHeight: 56,
              dataRowMinHeight: 66,
              dataRowMaxHeight: 70,
              horizontalMargin: 16,
              columnSpacing: isDesktop ? 40 : 20,

              columns: const [
                DataColumn(label: TableColumnTitle("Order ID")),
                DataColumn(label: TableColumnTitle("Customer")),
                DataColumn(label: TableColumnTitle("Product")),
                DataColumn(label: TableColumnTitle("Amount")),
                DataColumn(label: TableColumnTitle("Status")),
                DataColumn(label: TableColumnTitle("Date")),
              ],

              rows: [
                _buildRow(
                  rowSize,
                  "#1001",
                  "Ali Ahmed",
                  "iPhone 15 Pro",
                  "Rs. 285,000",
                  "Delivered",
                  "29 Jul",
                ),

                _buildRow(
                  rowSize,
                  "#1002",
                  "Ahmed Khan",
                  "Samsung S25",
                  "Rs. 210,000",
                  "Pending",
                  "30 Jul",
                ),

                _buildRow(
                  rowSize,
                  "#1003",
                  "Bilal",
                  "MacBook Air",
                  "Rs. 350,000",
                  "Shipped",
                  "30 Jul",
                ),

                _buildRow(
                  rowSize,
                  "#1004",
                  "Usman",
                  "Dell XPS",
                  "Rs. 245,000",
                  "Cancelled",
                  "31 Jul",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildRow(
      double rowSize,
      String orderId,
      String customer,
      String product,
      String amount,
      String status,
      String date,
      ) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            orderId,
            style: TextStyle(fontSize: rowSize),
          ),
        ),

        DataCell(
          Text(
            customer,
            style: TextStyle(fontSize: rowSize),
          ),
        ),

        DataCell(
          Text(
            product,
            style: TextStyle(fontSize: rowSize),
          ),
        ),

        DataCell(
          Text(
            amount,
            style: TextStyle(
              fontSize: rowSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        DataCell(
          TableStatusBadge(
            text: status,
          ),
        ),

        DataCell(
          Text(
            date,
            style: TextStyle(fontSize: rowSize),
          ),
        ),
      ],
    );
  }
}