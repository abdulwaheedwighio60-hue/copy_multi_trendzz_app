import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/presentation/admin/screens/seller/dialog/seller_block_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/seller/dialog/seller_delete_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/seller/dialog/seller_edit_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/seller/dialog/seller_view_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/seller/model/seller_category_model.dart';

class SellerTableWidget extends StatefulWidget {
  const SellerTableWidget({super.key});

  @override
  State<SellerTableWidget> createState() => _SellerTableWidgetState();
}

class _SellerTableWidgetState extends State<SellerTableWidget> {


  List<SellerCategoryModel> dummyCategories = [

    SellerCategoryModel(
      id: "CAT001",
      image: "https://picsum.photos/200?1",
      categoryName: "Electronics",
      slug: "electronics",
      description: "Mobiles, Laptops, Smart Watches & Accessories.",
      totalProducts: 240,
      totalSales: 5200,
      active: true,
      createdDate: "10 Jan 2026",
    ),

    SellerCategoryModel(
      id: "CAT002",
      image: "https://picsum.photos/200?2",
      categoryName: "Fashion",
      slug: "fashion",
      description: "Men, Women & Kids Clothing Collection.",
      totalProducts: 180,
      totalSales: 3100,
      active: true,
      createdDate: "18 Jan 2026",
    ),

    SellerCategoryModel(
      id: "CAT003",
      image: "https://picsum.photos/200?3",
      categoryName: "Home & Kitchen",
      slug: "home-kitchen",
      description: "Furniture, Kitchen & Home Essentials.",
      totalProducts: 145,
      totalSales: 2200,
      active: true,
      createdDate: "28 Jan 2026",
    ),

    SellerCategoryModel(
      id: "CAT004",
      image: "https://picsum.photos/200?4",
      categoryName: "Beauty",
      slug: "beauty",
      description: "Cosmetics, Makeup & Skincare Products.",
      totalProducts: 95,
      totalSales: 1500,
      active: true,
      createdDate: "05 Feb 2026",
    ),

    SellerCategoryModel(
      id: "CAT005",
      image: "https://picsum.photos/200?5",
      categoryName: "Sports",
      slug: "sports",
      description: "Sports Equipment & Fitness Accessories.",
      totalProducts: 88,
      totalSales: 1240,
      active: false,
      createdDate: "12 Feb 2026",
    ),

    SellerCategoryModel(
      id: "CAT006",
      image: "https://picsum.photos/200?6",
      categoryName: "Books",
      slug: "books",
      description: "Educational & Story Books.",
      totalProducts: 210,
      totalSales: 4100,
      active: true,
      createdDate: "20 Feb 2026",
    ),

    SellerCategoryModel(
      id: "CAT007",
      image: "https://picsum.photos/200?7",
      categoryName: "Furniture",
      slug: "furniture",
      description: "Modern Office & Home Furniture.",
      totalProducts: 72,
      totalSales: 980,
      active: true,
      createdDate: "02 Mar 2026",
    ),

    SellerCategoryModel(
      id: "CAT008",
      image: "https://picsum.photos/200?8",
      categoryName: "Toys",
      slug: "toys",
      description: "Kids Educational & Fun Toys.",
      totalProducts: 110,
      totalSales: 1750,
      active: false,
      createdDate: "15 Mar 2026",
    ),

  ];

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
                context: context,
                seller: dummyCategories[0],
              ),

              const SizedBox(height: 15),

              _mobileSellerCard(
                context: context,
                seller: dummyCategories[1],
              ),

              const SizedBox(height: 15),

              _mobileSellerCard(
                context: context,
                seller: dummyCategories[2],
              ),
              const SizedBox(height: 15),

              _mobileSellerCard(
                context: context,
                seller: dummyCategories[3],
              ),
              const SizedBox(height: 15),

              _mobileSellerCard(
                context: context,
                seller: dummyCategories[4],
              ),
              const SizedBox(height: 15),

              _mobileSellerCard(
                context: context,
                seller: dummyCategories[5],
              ),const SizedBox(height: 15),

              _mobileSellerCard(
                context: context,
                seller: dummyCategories[6],
              ),const SizedBox(height: 15),

              _mobileSellerCard(
                context: context,
                seller: dummyCategories[7],
              ),


            ],
          )

              : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 400, // 5 rows approx
              child: SingleChildScrollView(
                child: DataTable(
                  columnSpacing: isDesktop ? 38 : 25,
                  horizontalMargin: 18,
                  headingRowHeight: 58,
                  dataRowMinHeight: 72,
                  dataRowMaxHeight: 76,

                  columns: const [
                    DataColumn(label: Text("Category")),
                    DataColumn(label: Text("Slug")),
                    DataColumn(label: Text("Products")),
                    DataColumn(label: Text("Sales")),
                    DataColumn(label: Text("Created")),
                    DataColumn(label: Text("Status")),
                    DataColumn(label: Text("Actions")),
                  ],

                  rows: dummyCategories.map((seller) {
                    return _sellerRow(
                      context: context,
                      seller: seller,
                    );
                  }).toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _mobileSellerCard({
    required BuildContext context,
    required SellerCategoryModel seller,
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
          ),
        ],
      ),
      child: Column(
        children: [

          /// Top Section
          Row(
            children: [

              CircleAvatar(
                radius: isMobile ? 24 : 28,
                backgroundImage: NetworkImage(seller.image),
              ),

              SizedBox(width: isMobile ? 10 : 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      seller.categoryName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: isMobile ? 15 : isTablet ? 16 : 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: isMobile ? 2 : 4),

                    Text(
                      seller.slug,
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
                seller.active ? "Active" : "Inactive",
                rowSize,
              ),
            ],
          ),

          SizedBox(height: isMobile ? 12 : 16),

          Divider(color: Colors.grey.shade300),

          SizedBox(height: isMobile ? 10 : 14),

          _infoRow(
            context,
            "Category ID",
            seller.id,
          ),

          _infoRow(
            context,
            "Products",
            seller.totalProducts.toString(),
          ),

          _infoRow(
            context,
            "Sales",
            seller.totalSales.toString(),
          ),

          _infoRow(
            context,
            "Created",
            seller.createdDate,
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

  DataRow _sellerRow({
    required BuildContext context,
    required SellerCategoryModel seller,
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

        /// Category
        DataCell(
          Row(
            children: [

              CircleAvatar(
                radius: avatarSize,
                backgroundImage: NetworkImage(seller.image),
              ),

              SizedBox(width: isDesktop ? 12 : 8),

              Expanded(
                child: Text(
                  seller.categoryName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: rowSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

            ],
          ),
        ),

        /// Slug
        DataCell(
          Text(
            seller.slug,
            style: TextStyle(fontSize: rowSize),
          ),
        ),

        /// Products
        DataCell(
          Text(
            seller.totalProducts.toString(),
            style: TextStyle(fontSize: rowSize),
          ),
        ),

        /// Sales
        DataCell(
          Text(
            seller.totalSales.toString(),
            style: TextStyle(
              fontSize: rowSize,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        /// Created Date
        DataCell(
          Text(
            seller.createdDate,
            style: TextStyle(fontSize: rowSize),
          ),
        ),

        /// Status
        DataCell(
          _statusChip(
            seller.active ? "Active" : "Inactive",
            rowSize,
          ),
        ),

        /// Actions
        DataCell(
            Row(
              children: [

                _actionButton(
                  Icons.visibility_outlined,
                  Colors.blue,
                  iconSize,
                  onTap: () {
                    SellerViewDialog.show(
                      context,
                      seller,
                    );
                  },
                ),

                SizedBox(width: isDesktop ? 8 : 6),

                _actionButton(
                  Icons.edit_outlined,
                  Colors.orange,
                  iconSize,
                  onTap: () {
                    SellerEditDialog.show(
                      context,
                      seller,
                    );
                  },
                ),

                SizedBox(width: isDesktop ? 8 : 6),

                _actionButton(
                  Icons.block_outlined,
                  Colors.red,
                  iconSize,
                  onTap: () {
                    SellerBlockDialog.show(
                      context,
                      seller,
                    );
                  },
                ),

                SizedBox(width: isDesktop ? 8 : 6),

                _actionButton(
                  Icons.delete_outline,
                  Colors.grey,
                  iconSize,
                  onTap: () {
                    SellerDeleteDialog.show(
                      context,
                      seller,
                    );
                  },
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
      double iconSize, {
        VoidCallback? onTap,
      }) {
    return InkWell(
      onTap: onTap,
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