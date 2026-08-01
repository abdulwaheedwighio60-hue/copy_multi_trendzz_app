import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/category/dialog/category_delete_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/category/dialog/category_view_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/category/dialog/edit_category_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/category/model/category_model.dart';

class CategoryTableWidget extends StatefulWidget {
  const CategoryTableWidget({super.key});

  @override
  State<CategoryTableWidget> createState() => _CategoryTableWidgetState();
}

class _CategoryTableWidgetState extends State<CategoryTableWidget> {

  final List<CategoryModel> categories = [

    CategoryModel(
      name: "Fashion",
      description: "Men & Women Clothing",
      products: 350,
      status: true,
      createdDate: "12 Jul 2026",
      icon: Icons.checkroom,
      image: "https://picsum.photos/200?random=1",
    ),

    CategoryModel(
      name: "Electronics",
      description: "Mobiles & Accessories",
      products: 420,
      status: true,
      createdDate: "14 Jul 2026",
      icon: Icons.devices,
      image: "https://picsum.photos/200?random=2",
    ),

    CategoryModel(
      name: "Beauty",
      description: "Cosmetics & Makeup",
      products: 180,
      status: false,
      createdDate: "18 Jul 2026",
      icon: Icons.face,
      image: "https://picsum.photos/200?random=3",
    ),

    CategoryModel(
      name: "Grocery",
      description: "Daily Essentials",
      products: 260,
      status: true,
      createdDate: "20 Jul 2026",
      icon: Icons.local_grocery_store,
      image: "https://picsum.photos/200?random=4",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final bool isDesktop = width >= 1400;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;
    if (width < 700) {
      return _mobileView(context);
    }

    return _desktopView(context);
  }

  Widget _desktopView(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;

    final bool isDesktop = width >= 1400;
    final bool isTablet = width >= 700 && width < 1100;

    final double rowSize = isDesktop
        ? 14
        : isTablet
        ? 13
        : 12;

    final double avatarRadius = isDesktop
        ? 22
        : isTablet
        ? 20
        : 18;

    final double iconSize = isDesktop
        ? 18
        : isTablet
        ? 17
        : 16;
    final bool isMobile = width < 700;


    return Container(
      padding: EdgeInsets.all(
        isDesktop ? 22 : 18,
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
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          horizontalMargin: 18,
          columnSpacing: isDesktop ? 40 : 28,
          headingRowHeight: 58,
          dataRowMinHeight: 72,
          dataRowMaxHeight: 76,
          headingTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isDesktop ? 15 : 14,
            color: Colors.black87,
          ),
          columns: const [
            DataColumn(label: Text("Category")),
            DataColumn(label: Text("Description")),
            DataColumn(label: Text("Products")),
            DataColumn(label: Text("Status")),
            DataColumn(label: Text("Created")),
            DataColumn(label: Text("Actions")),
          ],
          rows: categories.map((category) {
            return DataRow(
              cells: [

                /// Category
                DataCell(
                  Row(
                    children: [

                      CircleAvatar(
                        radius: isMobile ? 24 : 28,
                        backgroundImage: NetworkImage(category.image),
                      ),

                      const SizedBox(width: 12),

                      Text(
                        category.name,
                        style: TextStyle(
                          fontSize: rowSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                /// Description
                DataCell(
                  SizedBox(
                    width: 230,
                    child: Text(
                      category.description,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: rowSize,
                      ),
                    ),
                  ),
                ),

                /// Products
                DataCell(
                  Text(
                    category.products.toString(),
                    style: TextStyle(
                      fontSize: rowSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                /// Status
                DataCell(
                  _statusChip(
                    category.status ? "Active" : "Inactive",
                    rowSize,
                  ),
                ),

                /// Created
                DataCell(
                  Text(
                    category.createdDate,
                    style: TextStyle(
                      fontSize: rowSize,
                    ),
                  ),
                ),

                /// Actions
                DataCell(
                  Row(
                    children: [

                      _actionButton(
                        Icons.visibility_outlined,
                        Colors.blue,
                        "View Category",
                            () {
                              CategoryViewDialog.show(
                                context,
                                category,
                              );
                        },
                      ),

                      const SizedBox(width: 8),

                      _actionButton(
                        Icons.edit_outlined,
                        Colors.orange,
                        "Edit Category",
                            () {
                              CategoryEditDialog.show(
                                context,
                                category,
                              );
                        },
                      ),

                      const SizedBox(width: 8),

                      _actionButton(
                        Icons.delete_outline,
                        Colors.red,
                        "Delete Category",
                            () {
                              CategoryDeleteDialog.show(
                                context,
                                category,
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
      ),
    );
  }

  Widget _mobileView(BuildContext context) {
    return ListView.separated(
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(height: 15),
      itemBuilder: (_, index) {
        final category = categories[index];

        return _mobileCategoryCard(
          context: context,
          category: category,
        );
      },
    );
  }

  Widget _mobileCategoryCard({
    required BuildContext context,
    required CategoryModel category,
  }) {
    final width = MediaQuery
        .of(context)
        .size
        .width;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isDesktop = width >= 1100;

    final double iconSize =
    isDesktop ? 18 : isTablet ? 17 : 16;

    final double rowSize =
    isDesktop ? 14 : isTablet ? 13 : 12;

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
          ),
        ],
      ),
      child: Column(
        children: [

          /// Header
          Row(
            children: [

              CircleAvatar(
                radius: isMobile ? 24 : 28,
                backgroundImage: NetworkImage(category.image),
              ),

              SizedBox(
                width: isMobile ? 10 : 14,
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      category.name,
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
                      category.description,
                      style: TextStyle(
                        fontSize:
                        isMobile ? 12 : 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              _statusChip(
                category.status
                    ? "Active"
                    : "Inactive",
                rowSize,
              ),
            ],
          ),

          SizedBox(
            height: isMobile ? 12 : 16,
          ),

          Divider(
            color: Colors.grey.shade300,
          ),

          SizedBox(
            height: isMobile ? 10 : 14,
          ),

          _infoRow(
            context,
            "Products",
            category.products.toString(),
          ),

          _infoRow(
            context,
            "Created",
            category.createdDate,
          ),

          SizedBox(
            height: isMobile ? 14 : 18,
          ),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: [

              _actionButton(
                Icons.visibility_outlined,
                Colors.blue,
                "View Category",
                    () {
                      CategoryViewDialog.show(
                        context,
                        category,
                      );
                },
              ),

              _actionButton(
                  Icons.edit_outlined,
                  Colors.orange,
                  "Edit Category",
                      (){
                    CategoryEditDialog.show(
                      context,
                      category,
                    );
                  }
              ),

              _actionButton(
                Icons.delete_outline,
                Colors.red,
                "Delete Category",
                    () {
                      CategoryEditDialog.show(
                        context,
                        category,
                      );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoRow(BuildContext context,
      String title,
      String value,) {
    final width = MediaQuery
        .of(context)
        .size
        .width;

    final bool isMobile = width < 700;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isDesktop = width >= 1100;

    return Padding(
      padding: EdgeInsets.only(
        bottom: isMobile ? 10 : 8,
      ),
      child: Row(
        children: [

          SizedBox(
            width: isDesktop
                ? 75
                : isTablet
                ? 70
                : 65,
            child: Text(
              title,
              style: TextStyle(
                fontSize:
                isMobile ? 12 : 13,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize:
                isMobile ? 13 : 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusChip(String status,
      double fontSize,) {
    Color color;

    switch (status) {
      case "Active":
        color = Colors.green;
        break;

      case "Inactive":
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
      String tooltip,
      VoidCallback onTap,
      ){

    return Tooltip(

      message: tooltip,


      child: InkWell(

        borderRadius:
        BorderRadius.circular(8),


        onTap:onTap,


        child:Container(

          width:34,

          height:34,


          decoration:BoxDecoration(

            color:
            color.withOpacity(.12),


            borderRadius:
            BorderRadius.circular(8),

          ),


          child:Icon(

            icon,

            size:18,

            color:color,

          ),

        ),

      ),
    );
  }



}




