import 'package:flutter/material.dart';

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
            child: DataTable(
              headingRowColor:
              WidgetStateProperty.all(Colors.grey.shade100),

              columnSpacing: isDesktop ? 40 : 20,

              horizontalMargin: 16,

              columns: [
                DataColumn(
                  label: Text(
                    "Order ID",
                    style: TextStyle(
                      fontSize: headingSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                DataColumn(
                  label: Text(
                    "Customer",
                    style: TextStyle(
                      fontSize: headingSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                DataColumn(
                  label: Text(
                    "Product",
                    style: TextStyle(
                      fontSize: headingSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                DataColumn(
                  label: Text(
                    "Amount",
                    style: TextStyle(
                      fontSize: headingSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                DataColumn(
                  label: Text(
                    "Status",
                    style: TextStyle(
                      fontSize: headingSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                DataColumn(
                  label: Text(
                    "Date",
                    style: TextStyle(
                      fontSize: headingSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],

              rows: [
                _buildRow(
                  rowSize,
                  "#1001",
                  "Ali Ahmed",
                  "iPhone 15 Pro",
                  "Rs. 285,000",
                  "Delivered",
                  Colors.green,
                  "29 Jul",
                ),

                _buildRow(
                  rowSize,
                  "#1002",
                  "Ahmed Khan",
                  "Samsung S25",
                  "Rs. 210,000",
                  "Pending",
                  Colors.orange,
                  "30 Jul",
                ),

                _buildRow(
                  rowSize,
                  "#1003",
                  "Bilal",
                  "MacBook Air",
                  "Rs. 350,000",
                  "Shipped",
                  Colors.blue,
                  "30 Jul",
                ),

                _buildRow(
                  rowSize,
                  "#1004",
                  "Usman",
                  "Dell XPS",
                  "Rs. 245,000",
                  "Cancelled",
                  Colors.red,
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
      Color color,
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
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: rowSize - 1,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
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