import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';

class SellerTableWidget extends StatelessWidget {
  const SellerTableWidget({super.key});

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

              _mobileSellerCard(
                image: "https://i.pravatar.cc/150?img=12",
                seller: "Ahmed Ali",
                store: "Tech World",
                email: "ahmed@gmail.com",
                phone: "+92 3001234567",
                orders: "152",
                sales: "Rs 245K",
                status: "Active",
                  context: context
              ),

              const SizedBox(height: 15),

              _mobileSellerCard(
                image: "https://i.pravatar.cc/150?img=22",
                seller: "Ali Khan",
                store: "Fashion Hub",
                email: "ali@gmail.com",
                phone: "+92 3019876543",
                orders: "95",
                sales: "Rs 120K",
                status: "Pending",
                  context: context
              ),

              const SizedBox(height: 15),

              _mobileSellerCard(
                image: "https://i.pravatar.cc/150?img=32",
                seller: "Sara Ahmed",
                store: "Beauty Store",
                email: "sara@gmail.com",
                phone: "+92 3345678901",
                orders: "210",
                sales: "Rs 560K",
                status: "Blocked",
                context: context
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

                _sellerRow(
                  image:"https://i.pravatar.cc/150?img=12",
                  seller:"Ahmed Ali",
                  store:"Tech World",
                  email:"ahmed@gmail.com",
                  phone:"+92 3001234567",
                  orders:"152",
                  sales:"Rs 245K",
                  status:"Active",
                    context: context
                ),

                _sellerRow(
                  image:"https://i.pravatar.cc/150?img=22",
                  seller:"Ali Khan",
                  store:"Fashion Hub",
                  email:"ali@gmail.com",
                  phone:"+92 3019876543",
                  orders:"95",
                  sales:"Rs 120K",
                  status:"Pending",
                    context: context
                ),

                _sellerRow(
                  image:"https://i.pravatar.cc/150?img=32",
                  seller:"Sara Ahmed",
                  store:"Beauty Store",
                  email:"sara@gmail.com",
                  phone:"+92 3345678901",
                  orders:"210",
                  sales:"Rs 560K",
                  status:"Blocked",
                  context: context
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _mobileSellerCard({
    required BuildContext context,
    required String image,
    required String seller,
    required String store,
    required String email,
    required String phone,
    required String orders,
    required String sales,
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
        border: Border.all(color: Colors.grey.shade200),
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
          /// Top Section
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
                      seller,
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

                    SizedBox(height: isMobile ? 2 : 4),

                    Text(
                      store,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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

          Divider(
            color: Colors.grey.shade300,
          ),

          SizedBox(height: isMobile ? 10 : 14),

          _infoRow(
            context,
            "Email",
            email,
          ),

          _infoRow(
            context,
            "Phone",
            phone,
          ),

          _infoRow(
            context,
            "Orders",
            orders,
          ),

          _infoRow(
            context,
            "Sales",
            sales,
          ),

          SizedBox(height: isMobile ? 14 : 18),

          Row(
            children: [

              _actionButton(
                Icons.visibility_outlined,
                Colors.blue,
                iconSize,
              ),

              const SizedBox(width: 6),

              _actionButton(
                Icons.edit_outlined,
                Colors.orange,
                iconSize,
              ),

              const SizedBox(width: 6),

              _actionButton(
                Icons.block_outlined,
                Colors.red,
                iconSize,
              ),

              const SizedBox(width: 6),

              _actionButton(
                Icons.delete_outline,
                Colors.grey,
                iconSize,
              ),
            ],
          )
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

  DataRow _sellerRow({
    required BuildContext context,
    required String image,
    required String seller,
    required String store,
    required String email,
    required String phone,
    required String orders,
    required String sales,
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

    final double avatarSize = isDesktop
        ? 20
        : isTablet
        ? 18
        : 16;

    final double iconSize = isDesktop
        ? 18
        : isTablet
        ? 17
        : 16;

    return DataRow(
      cells: [

        /// Seller
        DataCell(
          Row(
            children: [
              CircleAvatar(
                radius: avatarSize,
                backgroundImage: NetworkImage(image),
              ),

              SizedBox(width: isDesktop ? 12 : 8),

              Text(
                seller,
                style: TextStyle(
                  fontSize: rowSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        DataCell(
          Text(
            store,
            style: TextStyle(fontSize: rowSize),
          ),
        ),

        DataCell(
          Text(
            email,
            style: TextStyle(fontSize: rowSize),
          ),
        ),

        DataCell(
          Text(
            phone,
            style: TextStyle(fontSize: rowSize),
          ),
        ),

        DataCell(
          Text(
            orders,
            style: TextStyle(fontSize: rowSize),
          ),
        ),

        DataCell(
          Text(
            sales,
            style: TextStyle(
              fontSize: rowSize,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        DataCell(
          _statusChip(
            status,
            rowSize,
          ),
        ),

        DataCell(
          Row(
            children: [

              _actionButton(
                Icons.visibility_outlined,
                Colors.blue,
                iconSize,
              ),

              SizedBox(width: isDesktop ? 8 : 6),

              _actionButton(
                Icons.edit_outlined,
                Colors.orange,
                iconSize,
              ),

              SizedBox(width: isDesktop ? 8 : 6),

              _actionButton(
                Icons.block,
                Colors.red,
                iconSize,
              ),

              SizedBox(width: isDesktop ? 8 : 6),

              _actionButton(
                Icons.delete_outline,
                Colors.grey,
                iconSize,
              ),
            ],
          ),
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

      default:
        color = Colors.red;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: fontSize < 13 ? 10 : 14,
        vertical: fontSize < 13 ? 5 : 6,
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
      ) {
    return InkWell(
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
    );
  }
}