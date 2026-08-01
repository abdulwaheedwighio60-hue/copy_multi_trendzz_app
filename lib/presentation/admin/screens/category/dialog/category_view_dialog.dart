import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_tile.dart';
import '../model/category_model.dart';


class CategoryViewDialog {


  static void show(
      BuildContext context,
      CategoryModel category,
      ){

    showDialog(

      context: context,

      builder: (_) {


        return ResponsiveDialog(

          title: "Category Details",


          child: Column(

            children: [


              CircleAvatar(

                radius: 45,

                backgroundImage:
                NetworkImage(category.image),

              ),


              const SizedBox(height:20),



              ResponsiveDialogTile(
                title: "Category",
                value: category.name,
              ),


              ResponsiveDialogTile(
                title: "Description",
                value: category.description,
              ),


              ResponsiveDialogTile(
                title: "Products",
                value: category.products.toString(),
              ),


              ResponsiveDialogTile(
                title: "Created",
                value: category.createdDate,
              ),


              ResponsiveDialogTile(
                title: "Status",
                value: category.status
                    ? "Active"
                    : "Inactive",
              ),


            ],

          ),


          actions: [

            ResponsiveDialogButton(
              text: "Close",
              isPrimary: false,
              icon: Icons.close,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],


        );


      },


    );


  }


}