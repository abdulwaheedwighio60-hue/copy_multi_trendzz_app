import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/table/responsive_data_table_widget.dart';
import 'package:multi_trendzz/core/widgets/table/table_column_tile.dart';
import 'package:multi_trendzz/presentation/admin/screens/product/dialog/product_block_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/product/dialog/product_delete_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/product/dialog/product_edit_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/product/dialog/product_inventory_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/product/dialog/product_view_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/product/model/product_model.dart';

class ProductTableWidget extends StatefulWidget {
  const ProductTableWidget({super.key});

  @override
  State<ProductTableWidget> createState() => _ProductTableWidgetState();
}

class _ProductTableWidgetState extends State<ProductTableWidget> {

  static List<ProductModel> products = [



    ProductModel(

      id: "P001",

      image:
      "https://i.pravatar.cc/150?img=12",

      productName:
      "iPhone 16 Pro",

      category:
      "Mobile",

      seller:
      "Tech Store",

      store:
      "Tech Store PK",

      email:
      "techstore@gmail.com",

      phone:
      "03001234567",

      price:
      "Rs 250,000",

      stock:
      25,

      orders:
      120,

      sales:
      "Rs 30,00,000",

      description:
      "Apple iPhone 16 Pro with latest A18 chip and premium camera system.",

      active:
      true,

      createdDate:
      "01 Jan 2026",

    ),




    ProductModel(

      id:"P002",

      image:
      "https://i.pravatar.cc/150?img=18",

      productName:
      "MacBook Pro M4",

      category:
      "Laptop",

      seller:
      "Apple Hub",

      store:
      "Apple Hub Store",

      email:
      "applehub@gmail.com",

      phone:
      "03111234567",

      price:
      "Rs 380,000",

      stock:
      15,

      orders:
      80,

      sales:
      "Rs 25,00,000",

      description:
      "MacBook Pro powered by Apple M4 processor.",

      active:
      true,

      createdDate:
      "15 Feb 2026",

    ),




    ProductModel(

      id:"P003",

      image:
      "https://i.pravatar.cc/150?img=25",

      productName:
      "Apple Watch Ultra",

      category:
      "Watch",

      seller:
      "Gadget PK",

      store:
      "Gadget Store",

      email:
      "gadgetpk@gmail.com",

      phone:
      "03221234567",

      price:
      "Rs 80,000",

      stock:
      0,

      orders:
      40,

      sales:
      "Rs 8,00,000",

      description:
      "Premium Apple Watch Ultra for sports and fitness.",

      active:
      false,

      createdDate:
      "20 March 2026",

    ),




    ProductModel(

      id:"P004",

      image:
      "https://i.pravatar.cc/150?img=30",

      productName:
      "Samsung Galaxy S25",

      category:
      "Mobile",

      seller:
      "Samsung Store",

      store:
      "Samsung Official",

      email:
      "samsung@gmail.com",

      phone:
      "03331234567",

      price:
      "Rs 220,000",

      stock:
      50,

      orders:
      200,

      sales:
      "Rs 50,00,000",

      description:
      "Samsung flagship smartphone with AMOLED display.",

      active:
      true,

      createdDate:
      "10 April 2026",

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
            children: products.map((product) {

              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: _mobileProductCard(
                  context: context,
                  product: product,
                ),
              );

            }).toList(),
          )

              : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ResponsiveDataTableWidget(

              headingRowHeight: 58,

              dataRowMinHeight: 72,

              dataRowMaxHeight: 76,

              horizontalMargin: 18,

              columnSpacing: isDesktop ? 38 : 25,

              columns: const [

                DataColumn(
                  label: TableColumnTitle("Image"),
                ),

                DataColumn(
                  label: TableColumnTitle("Product"),
                ),

                DataColumn(
                  label: TableColumnTitle("Category"),
                ),

                DataColumn(
                  label: TableColumnTitle("Seller"),
                ),

                DataColumn(
                  label: TableColumnTitle("Price"),
                ),

                DataColumn(
                  label: TableColumnTitle("Stock"),
                ),

                DataColumn(
                  label: TableColumnTitle("Status"),
                ),

                DataColumn(
                  label: TableColumnTitle("Actions"),
                ),

              ],

              rows: products.map((product) {

                return _productRow(
                  context: context,
                  productModel: product,
                );

              }).toList(),

            )
          ),
        ],
      ),
    );
  }

  Widget _mobileProductCard({
    required BuildContext context,
    required ProductModel product,
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
            offset: const Offset(0,4),
          )

        ],

      ),


      child: Column(

        children: [


          Row(

            children: [


              CircleAvatar(

                radius: isMobile ? 24 : 28,

                backgroundImage:
                NetworkImage(product.image),

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

                      product.productName,

                      maxLines: 1,

                      overflow:
                      TextOverflow.ellipsis,


                      style: TextStyle(

                        fontSize:
                        isMobile
                            ? 15
                            : isTablet
                            ? 16
                            : 17,

                        fontWeight:
                        FontWeight.bold,

                      ),

                    ),



                    const SizedBox(height:3),



                    Text(

                      product.category,

                      style: TextStyle(

                        fontSize:
                        isMobile ? 12 : 13,

                        color:
                        Colors.grey.shade600,

                      ),

                    )


                  ],

                ),

              ),



              // _statusChip(
              //   product.status,
              //   rowSize,
              // )


            ],

          ),



          SizedBox(
            height: isMobile ? 12 : 16,
          ),



          Divider(
            color: Colors.grey.shade300,
          ),



          _infoRow(
            context,
            "Seller",
            product.seller,
          ),



          _infoRow(
            context,
            "Price",
            product.price,
          ),



          _infoRow(
            context,
            "Stock",
            product.stock.toString(),
          ),



          SizedBox(
            height: isMobile ? 14 : 18,
          ),



          Row(

            children: [


              _actionButton(

                context,

                Icons.visibility_outlined,

                Colors.blue,

                iconSize,

                "View Product",

                    (){

                  ProductViewDialog.show(
                    context,
                    product,
                  );

                },

              ),



              const SizedBox(width:8),



              _actionButton(

                context,

                Icons.edit_outlined,

                Colors.orange,

                iconSize,

                "Edit Product",

                    (){

                  ProductEditDialog.show(
                    context,
                    product,
                  );

                },

              ),



              const SizedBox(width:8),



              _actionButton(

                context,

                Icons.inventory_2_outlined,

                Colors.green,

                iconSize,

                "Manage Inventory",

                    (){

                  ProductInventoryDialog.show(
                    context,
                    product,
                  );

                },

              ),



              const SizedBox(width:8),



              _actionButton(

                context,

                Icons.block_outlined,

                Colors.red,

                iconSize,

                "Block Product",

                    (){

                  ProductBlockDialog.show(
                    context,
                    product,
                  );

                },

              ),



              const SizedBox(width:8),



              _actionButton(

                context,

                Icons.delete_outline,

                Colors.grey,

                iconSize,

                "Delete Product",

                    (){

                  ProductDeleteDialog.show(
                    context,
                    product,
                  );

                },

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

  DataRow _productRow({
    required BuildContext context,
    required ProductModel productModel,
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


    final String status = productModel.active
        ? "Active"
        : "Blocked";


    return DataRow(
      cells: [

        /// Image
        DataCell(
          CircleAvatar(
            radius: imageRadius,
            backgroundImage: NetworkImage(
              productModel.image,
            ),
          ),
        ),


        /// Product
        DataCell(
          Text(
            productModel.productName,
            style: TextStyle(
              fontSize: rowSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),


        /// Category
        DataCell(
          Text(
            productModel.category,
            style: TextStyle(
              fontSize: rowSize,
            ),
          ),
        ),


        /// Seller
        DataCell(
          Text(
            productModel.seller,
            style: TextStyle(
              fontSize: rowSize,
            ),
          ),
        ),


        /// Price
        DataCell(
          Text(
            productModel.price,
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
            productModel.stock.toString(),

            style: TextStyle(
              fontSize: rowSize,
              fontWeight: FontWeight.w600,

              color: productModel.stock > 0
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
            children: [


              _actionButton(
                context,
                Icons.visibility_outlined,
                Colors.blue,
                iconSize,
                "View Product",
                    () {

                  ProductViewDialog.show(
                    context,
                    productModel,
                  );

                },
              ),


              const SizedBox(width: 8),



              _actionButton(
                context,
                Icons.edit_outlined,
                Colors.orange,
                iconSize,
                "Edit Product",
                    () {

                  ProductEditDialog.show(
                    context,
                    productModel,
                  );

                },
              ),



              const SizedBox(width: 8),



              _actionButton(
                context,
                Icons.inventory_2_outlined,
                Colors.green,
                iconSize,
                "Manage Inventory",
                    () {

                  ProductInventoryDialog.show(
                    context,
                    productModel,
                  );

                },
              ),



              const SizedBox(width: 8),



              _actionButton(
                context,
                Icons.block_outlined,
                Colors.red,
                iconSize,
                "Block Product",
                    () {

                  ProductBlockDialog.show(
                    context,
                    productModel,
                  );

                },
              ),



              const SizedBox(width: 8),



              _actionButton(
                context,
                Icons.delete_outline,
                Colors.grey,
                iconSize,
                "Delete Product",
                    () {

                  ProductDeleteDialog.show(
                    context,
                    productModel,
                  );

                },
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
      BuildContext context,
      IconData icon,
      Color color,
      double iconSize,
      String tooltip,
      VoidCallback onTap,
      ) {
    return Tooltip(
      message: tooltip,
      waitDuration: const Duration(milliseconds: 300),

      child: InkWell(

        onTap: onTap,

        borderRadius: BorderRadius.circular(8),

        child: Container(

          width: iconSize + 16,

          height: iconSize + 16,

          decoration: BoxDecoration(

            color: color.withOpacity(.12),

            borderRadius:
            BorderRadius.circular(8),

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