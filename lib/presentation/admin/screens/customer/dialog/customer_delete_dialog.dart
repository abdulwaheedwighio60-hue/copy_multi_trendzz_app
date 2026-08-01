import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import 'package:multi_trendzz/presentation/admin/screens/customer/model/customer_model.dart';


class CustomerDeleteDialog {


  static void show(
      BuildContext context,
      CustomerModel customer,
      ){


    final width =
        MediaQuery.of(context).size.width;


    final bool isDesktop =
        width >=1100;


    final bool isTablet =
        width >=700 && width <1100;


    final bool isMobile =
        width <700;



    final double textSize =
    isDesktop
        ?15
        :isTablet
        ?14
        :13;



    showDialog(

      context:context,


      builder:(_){


        return ResponsiveDialog(


          title:"Delete Customer",




          child:Text(

            "Are you sure you want to delete ${customer.name}?",


            textAlign:
            TextAlign.center,


            style:TextStyle(

              fontSize:textSize,

              height:1.4,

            ),

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

                /// Delete API

                Navigator.pop(context);

              },
            ),

          ],



        );


      },


    );


  }


}