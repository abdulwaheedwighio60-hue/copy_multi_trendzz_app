import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import 'package:multi_trendzz/presentation/admin/screens/category/model/category_model.dart';


class CategoryDeleteDialog {


  static void show(
      BuildContext context,
      CategoryModel category,
      ) {


    showDialog(

      context: context,


      builder: (_){


        final width =
            MediaQuery.of(context).size.width;


        final double textSize =
        width >= 1100
            ? 15
            : width >= 700
            ? 14
            : 13;



        return ResponsiveDialog(

          title: "Delete Category",



          child: Column(

            children: [


              Icon(

                Icons.warning_amber_rounded,

                size: 55,

                color: Colors.red,

              ),


              const SizedBox(height:20),



              Text(

                "Are you sure you want to delete\n"
                    "'${category.name}'?",


                textAlign:
                TextAlign.center,


                style: TextStyle(

                  fontSize: textSize,

                  height: 1.5,

                  color:
                  Colors.grey.shade700,

                ),

              ),


            ],

          ),



          actions: [

            ResponsiveDialogButton(
              text: "Cancel",
              isPrimary: false,
              icon: Icons.close,
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            ResponsiveDialogButton(
              text: "Delete",
              backgroundColor: Colors.red,
              icon: Icons.delete_outline,
              onPressed: () {

                // Delete API

                Navigator.pop(context);
              },
            ),

          ],

        );


      },

    );


  }


}