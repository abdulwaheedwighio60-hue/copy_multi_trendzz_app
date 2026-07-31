import 'package:flutter/material.dart';


class SellerRowWidget {


  static DataRow build({

    required String image,
    required String seller,
    required String store,
    required String email,
    required String phone,
    required String orders,
    required String sales,
    required String status,

    VoidCallback? onView,
    VoidCallback? onEdit,
    VoidCallback? onBlock,
    VoidCallback? onDelete,

  }) {


    return DataRow(

      cells: [


        /// Seller
        DataCell(

          Row(
            children: [


              CircleAvatar(

                radius: 20,

                backgroundImage:
                NetworkImage(image),

              ),



              const SizedBox(width:12),



              Text(

                seller,

                style: const TextStyle(

                  fontWeight:
                  FontWeight.w600,

                ),

              )

            ],
          ),

        ),




        /// Store
        DataCell(
          Text(store),
        ),




        /// Email
        DataCell(
          Text(email),
        ),




        /// Phone
        DataCell(
          Text(phone),
        ),




        /// Orders
        DataCell(
          Text(orders),
        ),




        /// Sales
        DataCell(

          Text(

            sales,

            style: const TextStyle(

              color: Colors.green,

              fontWeight:
              FontWeight.bold,

            ),

          ),

        ),




        /// Status
        DataCell(

          _statusChip(status),

        ),




        /// Actions
        DataCell(

          Row(

            children: [


              _actionButton(
                Icons.visibility_outlined,
                Colors.blue,
                onView,
              ),


              const SizedBox(width:8),


              _actionButton(
                Icons.edit_outlined,
                Colors.orange,
                onEdit,
              ),



              const SizedBox(width:8),


              _actionButton(
                Icons.block,
                Colors.red,
                onBlock,
              ),



              const SizedBox(width:8),


              _actionButton(
                Icons.delete_outline,
                Colors.grey,
                onDelete,
              ),

            ],

          ),

        ),


      ],

    );

  }





  static Widget _statusChip(String status){


    Color color;


    switch(status){

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

      padding:
      const EdgeInsets.symmetric(
        horizontal:14,
        vertical:6,
      ),


      decoration: BoxDecoration(

        color:
        color.withOpacity(.12),

        borderRadius:
        BorderRadius.circular(30),

      ),


      child: Text(

        status,

        style: TextStyle(

          color:color,

          fontWeight:
          FontWeight.w600,

        ),

      ),

    );

  }






  static Widget _actionButton(
      IconData icon,
      Color color,
      VoidCallback? onTap,
      ){

    return InkWell(

      onTap:onTap,


      child: Container(

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

    );

  }


}