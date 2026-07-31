import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class ProductTableWidget extends StatelessWidget {
  const ProductTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;

    final double rowSize = isDesktop
        ? 14
        : isTablet
        ? 13
        : 12;

    return Container(
      padding: EdgeInsets.all(
        isMobile ? 14 : isTablet ? 18 : 22,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Title
          Row(
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "All Sellers",
                      style: TextStyle(
                        fontSize: isMobile
                            ? 18
                            : isTablet
                            ? 20
                            : 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      "250 Registered Sellers",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: isMobile ? 12 : 14,
                      ),
                    ),

                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 12 : 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "250",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: isMobile ? 13 : 15,
                  ),
                ),
              )

            ],
          ),

          const SizedBox(height: 20),

          isMobile
              ? Column(
            children: [

              _mobileProductCard(
                context: context,
                image: "https://i.pravatar.cc/150?img=12",
                product: "iPhone 16 Pro",
                category: "Mobile",
                seller: "Tech Store",
                price: "Rs 250,000",
                stock: "25",
                status: "Active",
              ),

              const SizedBox(height: 15),

              _mobileProductCard(
                context: context,
                image: "https://i.pravatar.cc/150?img=12",
                product: "iPhone 16 Pro",
                category: "Mobile",
                seller: "Tech Store",
                price: "Rs 250,000",
                stock: "25",
                status: "Active",
              ),

              const SizedBox(height: 15),

              _mobileProductCard(
                context: context,
                image: "https://i.pravatar.cc/150?img=12",
                product: "iPhone 16 Pro",
                category: "Mobile",
                seller: "Tech Store",
                price: "Rs 250,000",
                stock: "25",
                status: "Active",
              ),

            ],
          )

              : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: isDesktop ? 38 : 25,
              horizontalMargin: 18,
              headingRowHeight: 58,
              dataRowMinHeight: 72,
              dataRowMaxHeight: 76,

              headingTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isDesktop ? 15 : 14,
              ),

              columns: const [

                DataColumn(label: Text("Seller")),
                DataColumn(label: Text("Store")),
                DataColumn(label: Text("Email")),
                DataColumn(label: Text("Phone")),
                DataColumn(label: Text("Orders")),
                DataColumn(label: Text("Sales")),
                DataColumn(label: Text("Status")),
                DataColumn(label: Text("Actions")),

              ],

              rows: [

                _productRow(
                  context: context,
                  image: "https://i.pravatar.cc/150?img=12",
                  product: "iPhone 16 Pro",
                  category: "Mobile",
                  seller: "Tech Store",
                  price: "Rs 250K",
                  stock: "25",
                  status: "Active",
                ),

                _productRow(
                  context: context,
                  image: "https://i.pravatar.cc/150?img=18",
                  product: "MacBook Pro M4",
                  category: "Laptop",
                  seller: "Apple Hub",
                  price: "Rs 380K",
                  stock: "15",
                  status: "Active",
                ),

                _productRow(
                  context: context,
                  image: "https://i.pravatar.cc/150?img=25",
                  product: "Apple Watch Ultra",
                  category: "Watch",
                  seller: "Gadget PK",
                  price: "Rs 80K",
                  stock: "0",
                  status: "Out of Stock",
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _mobileProductCard({
    required BuildContext context,
    required String image,
    required String product,
    required String category,
    required String seller,
    required String price,
    required String stock,
    required String status,
  }) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isDesktop = width >= 1100;

    final double iconSize = isDesktop
        ? 18
        : isTablet
        ? 17
        : 16;

    final double rowSize = isDesktop
        ? 14
        : isTablet
        ? 13
        : 12;

    return Container(
      padding: EdgeInsets.all(
        isMobile ? 14 : 18,
      ),
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
          )
        ],
      ),
      child: Column(
        children: [

          /// Header
          Row(
            children: [

              CircleAvatar(
                radius: isMobile ? 24 : 28,
                backgroundImage: NetworkImage(image),
              ),

              SizedBox(width: isMobile ? 10 : 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      product,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: isMobile
                            ? 15
                            : isTablet
                            ? 16
                            : 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      category,
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              _statusChip(
                status,
                rowSize,
              ),
            ],
          ),

          SizedBox(height: isMobile ? 12 : 16),

          Divider(color: Colors.grey.shade300),

          SizedBox(height: isMobile ? 10 : 14),

          _infoRow(
            context,
            "Seller",
            seller,
          ),

          _infoRow(
            context,
            "Price",
            price,
          ),

          _infoRow(
            context,
            "Stock",
            stock,
          ),

          SizedBox(height: isMobile ? 14 : 18),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              _actionButton(
                Icons.visibility_outlined,
                Colors.blue,
                iconSize,
                "View Product",
              ),

              _actionButton(
                Icons.edit_outlined,
                Colors.orange,
                iconSize,
                "Edit Product",
              ),

              _actionButton(
                Icons.inventory_2_outlined,
                Colors.green,
                iconSize,
                "Manage Inventory",
              ),

              _actionButton(
                Icons.block_outlined,
                Colors.red,
                iconSize,
                "Block Product",
              ),

              _actionButton(
                Icons.delete_outline,
                Colors.grey,
                iconSize,
                "Delete Product",
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _infoRow(
      BuildContext context,
      String title,
      String value,
      ) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isDesktop = width >= 1100;

    return Padding(
      padding: EdgeInsets.only(
        bottom: isMobile ? 10 : 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: isDesktop
                ? 70
                : isTablet
                ? 68
                : 65,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: isMobile ? 12 : 13,
                height: 1.1,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Expanded(
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: isMobile ? 13 : 14,
                height: 1.1,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow _productRow({
    required BuildContext context,
    required String image,
    required String product,
    required String category,
    required String seller,
    required String price,
    required String stock,
    required String status,
  }) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;

    final double rowSize = isDesktop
        ? 14
        : isTablet
        ? 13
        : 12;

    final double imageRadius = isDesktop
        ? 22
        : isTablet
        ? 20
        : 18;

    final double iconSize = isDesktop
        ? 18
        : isTablet
        ? 17
        : 16;

    return DataRow(
      cells: [

        /// Image
        DataCell(
          CircleAvatar(
            radius: imageRadius,
            backgroundImage: NetworkImage(image),
          ),
        ),

        /// Product
        DataCell(
          Text(
            product,
            style: TextStyle(
              fontSize: rowSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        /// Category
        DataCell(
          Text(
            category,
            style: TextStyle(fontSize: rowSize),
          ),
        ),

        /// Seller
        DataCell(
          Text(
            seller,
            style: TextStyle(fontSize: rowSize),
          ),
        ),

        /// Price
        DataCell(
          Text(
            price,
            style: TextStyle(
              fontSize: rowSize,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        /// Stock
        DataCell(
          Text(
            stock,
            style: TextStyle(
              fontSize: rowSize,
              fontWeight: FontWeight.w600,
              color: int.parse(stock) > 0
                  ? Colors.black87
                  : Colors.red,
            ),
          ),
        ),

        /// Status
        DataCell(
          _statusChip(
            status,
            rowSize,
          ),
        ),

        /// Actions
        DataCell(
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                _actionButton(
                  Icons.visibility_outlined,
                  Colors.blue,
                  iconSize,
                  "View Product",
                ),

                const SizedBox(width: 8),

                _actionButton(
                  Icons.edit_outlined,
                  Colors.orange,
                  iconSize,
                  "Edit Product",
                ),

                const SizedBox(width: 8),

                _actionButton(
                  Icons.inventory_2_outlined,
                  Colors.green,
                  iconSize,
                  "Manage Inventory",
                ),

                const SizedBox(width: 8),

                _actionButton(
                  Icons.block_outlined,
                  Colors.red,
                  iconSize,
                  "Block Product",
                ),

                const SizedBox(width: 8),

                _actionButton(
                  Icons.delete_outline,
                  Colors.grey,
                  iconSize,
                  "Delete Product",
                ),
              ],
            )
        ),
      ],
    );
  }

  Widget _statusChip(
      String status,
      double fontSize,
      ) {
    Color color;

    switch (status) {
      case "Active":
        color = Colors.green;
        break;

      case "Pending":
        color = Colors.orange;
        break;

      case "Out of Stock":
        color = Colors.red;
        break;

      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: fontSize - 1,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _actionButton(
      IconData icon,
      Color color,
      double iconSize,
      String tooltip,
      ) {
    return Tooltip(
      message: tooltip,
      waitDuration: const Duration(milliseconds: 300),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: iconSize + 16,
          height: iconSize + 16,
          decoration: BoxDecoration(
            color: color.withOpacity(.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: iconSize,
            color: color,
          ),
        ),
      ),
    );
  }
}