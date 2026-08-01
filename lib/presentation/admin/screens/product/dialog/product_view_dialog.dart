import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_tile.dart';
import '../model/product_model.dart';


class ProductViewDialog {


  static void show(
      BuildContext context,
      ProductModel product,
      ){


    showDialog(
      context: context,
      builder: (_){

        return ResponsiveDialog(

          title: "Product Details",


          child: Column(

            children: [


              CircleAvatar(

                radius: 45,

                backgroundImage:
                NetworkImage(product.image),

              ),


              const SizedBox(height:20),



              ResponsiveDialogTile(
                title:"Product",
                value:product.productName,
              ),



              ResponsiveDialogTile(
                title:"Category",
                value:product.category,
              ),



              ResponsiveDialogTile(
                title:"Seller",
                value:product.seller,
              ),



              ResponsiveDialogTile(
                title:"Store",
                value:product.store,
              ),



              ResponsiveDialogTile(
                title:"Price",
                value:product.price,
              ),



              ResponsiveDialogTile(
                title:"Stock",
                value:product.stock.toString(),
              ),



              ResponsiveDialogTile(
                title:"Orders",
                value:product.orders.toString(),
              ),



              ResponsiveDialogTile(
                title:"Sales",
                value:product.sales,
              ),



              ResponsiveDialogTile(
                title:"Status",
                value:product.active
                    ?"Active"
                    :"Blocked",
              ),



              ResponsiveDialogTile(
                title:"Created",
                value:product.createdDate,
              ),



            ],
          ),



          actions: [

            ResponsiveDialogButton(
              text: "Close",
              backgroundColor: Colors.red,
              icon: Icons.save_outlined,
              onPressed: () {},
            )

          ],


        );


      },
    );


  }


}