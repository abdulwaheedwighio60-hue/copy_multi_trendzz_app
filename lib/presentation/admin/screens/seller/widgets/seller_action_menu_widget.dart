import 'package:flutter/material.dart';


class SellerActionMenuWidget extends StatelessWidget {


  final VoidCallback? onView;
  final VoidCallback? onEdit;
  final VoidCallback? onBlock;
  final VoidCallback? onDelete;

  final bool isBlocked;



  const SellerActionMenuWidget({

    super.key,

    this.onView,
    this.onEdit,
    this.onBlock,
    this.onDelete,

    this.isBlocked = false,

  });




  @override
  Widget build(BuildContext context) {


    return PopupMenuButton<String>(


      tooltip: "Seller Actions",


      icon: Container(

        width: 34,

        height: 34,


        decoration: BoxDecoration(

          color:
          Colors.grey.withOpacity(.10),

          borderRadius:
          BorderRadius.circular(8),

        ),



        child: const Icon(

          Icons.more_vert,

          size:20,

          color:Colors.black87,

        ),

      ),



      shape: RoundedRectangleBorder(

        borderRadius:
        BorderRadius.circular(12),

      ),



      onSelected: (value){


        switch(value){


          case "view":

            onView?.call();

            break;



          case "edit":

            onEdit?.call();

            break;



          case "block":

            onBlock?.call();

            break;



          case "delete":

            onDelete?.call();

            break;


        }


      },



      itemBuilder:(context)=>[



        const PopupMenuItem(

          value:"view",

          child: Row(

            children: [


              Icon(
                Icons.visibility_outlined,
                size:20,
                color:Colors.blue,
              ),


              SizedBox(width:10),


              Text("View Profile"),

            ],

          ),

        ),





        const PopupMenuItem(

          value:"edit",

          child: Row(

            children: [


              Icon(

                Icons.edit_outlined,

                size:20,

                color:Colors.orange,

              ),



              SizedBox(width:10),


              Text("Edit Seller"),

            ],

          ),

        ),





        PopupMenuItem(

          value:"block",

          child: Row(

            children: [


              Icon(

                isBlocked
                    ? Icons.lock_open_outlined
                    : Icons.block,

                size:20,

                color:Colors.red,

              ),



              const SizedBox(width:10),



              Text(

                isBlocked
                    ? "Unblock Seller"
                    : "Block Seller",

              ),

            ],

          ),

        ),





        const PopupMenuItem(

          value:"delete",

          child: Row(

            children: [


              Icon(

                Icons.delete_outline,

                size:20,

                color:Colors.grey,

              ),



              SizedBox(width:10),



              Text("Delete Seller"),

            ],

          ),

        ),



      ],

    );

  }


}