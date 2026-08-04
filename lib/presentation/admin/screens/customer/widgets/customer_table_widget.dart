import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/table/responsive_data_table_widget.dart';
import 'package:multi_trendzz/core/widgets/table/table_column_tile.dart';
import 'package:multi_trendzz/presentation/admin/screens/customer/dialog/customer_block_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/customer/dialog/customer_delete_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/customer/dialog/customer_edit_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/customer/dialog/customer_view_dialog.dart';
import 'package:multi_trendzz/presentation/admin/screens/customer/model/customer_model.dart';
import 'package:flutter/material.dart';

class CustomerTableWidget extends StatelessWidget {
   CustomerTableWidget({super.key,});

  final List<CustomerModel> customers = [
     CustomerModel(
      image: "https://i.pravatar.cc/150?img=12",
      name: "Ahmed Khan",
      email: "ahmed@gmail.com",
      phone: "+92 300 1234567",
      orders: 45,
      active: true,
      joinDate: "12 Jan 2026",
    ),

     CustomerModel(
      image: "https://i.pravatar.cc/150?img=18",
      name: "Ali Raza",
      email: "ali@gmail.com",
      phone: "+92 301 9876543",
      orders: 23,
      active: true,
      joinDate: "20 Feb 2026",
    ),

     CustomerModel(
      image: "https://i.pravatar.cc/150?img=25",
      name: "Sara Ahmed",
      email: "sara@gmail.com",
      phone: "+92 312 5555555",
      orders: 12,
      active: false,
      joinDate: "05 March 2026",
    ),

    CustomerModel(
      image: "https://i.pravatar.cc/150?img=32",
      name: "Usman Ali",
      email: "usman@gmail.com",
      phone: "+92 333 7777777",
      orders: 67,
      active: true,
      joinDate: "15 April 2026",
    ),
  ];

   double _dialogWidth(BuildContext context){

     final width = MediaQuery.of(context).size.width;


     if(width >= 1100){
       return 500;
     }
     else if(width >= 700){
       return width * 0.75;
     }
     else{
       return width * 0.92;
     }

   }

  @override
  Widget build(BuildContext context) {


    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;
    final bool isTablet = width >= 700 && width < 1100;
    final bool isMobile = width < 700;




    return Container(
      padding: EdgeInsets.all(
        isMobile ? 14 : isTablet ? 18 : 22,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200,),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0,4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "All Customers",
                      style: TextStyle(
                        fontSize: isMobile ? 18 : isTablet ? 20 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height:5),
                    Text(
                      "${customers.length} Registered Customers",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: isMobile ? 12 : 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal:16, vertical:8,),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  customers.length.toString(),
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height:20),
          /// DESKTOP TABLE
          isMobile ? const SizedBox() : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ResponsiveDataTableWidget(
              headingRowHeight: 58,
              dataRowMinHeight: 72,
              dataRowMaxHeight: 76,
              horizontalMargin: 18,
              columnSpacing: isDesktop ? 38 : 25,

              columns: const [

                DataColumn(
                  label: TableColumnTitle("Customer"),
                ),

                DataColumn(
                  label: TableColumnTitle("Email"),
                ),

                DataColumn(
                  label: TableColumnTitle("Phone"),
                ),

                DataColumn(
                  label: TableColumnTitle("Orders"),
                ),

                DataColumn(
                  label: TableColumnTitle("Status"),
                ),

                DataColumn(
                  label: TableColumnTitle("Join Date"),
                ),

                DataColumn(
                  label: TableColumnTitle("Actions"),
                ),
              ],

              rows: customers
                  .map(
                    (customer) => _customerRow(
                  context,
                  customer,
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
  DataRow _customerRow(BuildContext context, CustomerModel customer,){
    final width = MediaQuery.of(context).size.width;
    final bool isDesktop = width >=1100;
    final double fontSize = isDesktop ? 14 : 13;
    return DataRow(
        cells: [
          /// CUSTOMER
          DataCell(
            Row(
              children: [
                CircleAvatar(
                  radius:22, backgroundImage: NetworkImage(customer.image),
                ),
                const SizedBox(width:12),
                Text(
                  customer.name,
                  style: TextStyle(
                    fontSize:fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          DataCell(
              Text(
                customer.email, style: TextStyle(fontSize:fontSize),
              )
          ),
          /// PHONE
          DataCell(
              Text(
                customer.phone,
                style: TextStyle(fontSize:fontSize),
              )
          ),
          /// ORDERS
          DataCell(
              Text(
                customer.orders.toString(),
                style: TextStyle(
                  fontSize:fontSize,
                  fontWeight: FontWeight.w600,
                ),
              )
          ),
          /// STATUS
          DataCell(
            _statusBadge(customer.active
            ),
          ),
          /// DATE
          DataCell(
              Text(
                customer.joinDate,
                style: TextStyle(fontSize:fontSize),
              )
          ),
          /// ACTIONS
          DataCell(
            Row(
              children: [
                _actionButton(
                  context,
                  Icons.visibility_outlined,
                  Colors.blue,
                  "View Customer",
                  customer,
                ),
                const SizedBox(width:8),
                _actionButton(
                    context,
                    Icons.edit_outlined,
                    Colors.orange,
                    "Edit Customer", customer
                ),
                const SizedBox(width:8),
                _actionButton(
                  context,
                    Icons.block_outlined,
                    Colors.red,
                    "Block Customer",
                  customer
                ),
                const SizedBox(width:8),
                _actionButton(
                  context,
                    Icons.delete_outline,
                    Colors.grey,
                    "Delete Customer",
                  customer,
                ),
              ],
            ),
          )
        ]
    );
  }

  Widget _statusBadge(bool active){
    final Color color = active ? Colors.green : Colors.red;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal:12, vertical:6),
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        active ? "Active" : "Blocked",
        style: TextStyle(
          color:color,
          fontWeight: FontWeight.w600,
          fontSize:13,
        ),
      ),
    );
  }

   Widget _actionButton(
       BuildContext context,
       IconData icon,
       Color color,
       String tooltip,
       CustomerModel customer,
       ) {

     return Tooltip(
       message: tooltip,
       waitDuration: const Duration(milliseconds: 300),
       child: InkWell(
         borderRadius: BorderRadius.circular(8),
         onTap: () {
           switch(tooltip){
             case "View Customer":
               CustomerViewDialog.show(context, customer,);
               break;
             case "Edit Customer":
               CustomerEditDialog.show(context, customer);
               break;
             case "Block Customer":
               CustomerBlockDialog.show(context, customer);
               break;
             case "Delete Customer":
               CustomerDeleteDialog.show(context, customer);
               break;
           }
         },
         child: Container(
           width:34,
           height:34,
           decoration: BoxDecoration(
             color: color.withOpacity(.12),
             borderRadius: BorderRadius.circular(8),
           ),
           child: Icon(
             icon, size:18,
             color:color,
           ),
         ),
       ),
     );
   }
}