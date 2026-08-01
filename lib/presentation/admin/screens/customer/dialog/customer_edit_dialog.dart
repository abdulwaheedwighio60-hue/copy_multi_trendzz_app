import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import 'package:multi_trendzz/presentation/admin/screens/customer/model/customer_model.dart';


class CustomerEditDialog {


  static void show(
      BuildContext context,
      CustomerModel customer,
      ){


    final nameController =
    TextEditingController(
        text: customer.name
    );


    final emailController =
    TextEditingController(
        text: customer.email
    );


    final phoneController =
    TextEditingController(
        text: customer.phone
    );



    final width =
        MediaQuery.of(context).size.width;


    final bool isDesktop =
        width >= 1100;


    final bool isTablet =
        width >=700 && width <1100;


    final bool isMobile =
        width <700;



    final double textSize =
    isDesktop
        ? 15
        : isTablet
        ? 14
        : 13;



    final double gap =
    isMobile
        ? 12
        : 16;



    showDialog(

      context:context,

      builder:(_){


        return ResponsiveDialog(

          title:"Edit Customer",



          child:Column(

            children:[



              TextField(

                controller:nameController,


                style:TextStyle(
                  fontSize:textSize,
                ),


                decoration:
                InputDecoration(

                  labelText:"Name",

                  prefixIcon:
                  const Icon(
                    Icons.person_outline,
                  ),

                  border:
                  const OutlineInputBorder(),


                  contentPadding:
                  EdgeInsets.symmetric(

                    horizontal:
                    isMobile ? 12 : 16,

                    vertical:
                    isMobile ? 12 : 15,

                  ),

                ),

              ),



              SizedBox(
                height:gap,
              ),



              TextField(

                controller:emailController,


                style:TextStyle(
                  fontSize:textSize,
                ),


                keyboardType:
                TextInputType.emailAddress,


                decoration:
                InputDecoration(

                  labelText:"Email",

                  prefixIcon:
                  const Icon(
                    Icons.email_outlined,
                  ),


                  border:
                  const OutlineInputBorder(),


                  contentPadding:
                  EdgeInsets.symmetric(

                    horizontal:
                    isMobile ? 12 : 16,

                    vertical:
                    isMobile ? 12 : 15,

                  ),

                ),

              ),




              SizedBox(
                height:gap,
              ),




              TextField(

                controller:phoneController,


                style:
                TextStyle(
                  fontSize:textSize,
                ),


                keyboardType:
                TextInputType.phone,


                decoration:
                InputDecoration(

                  labelText:"Phone",

                  prefixIcon:
                  const Icon(
                    Icons.phone_outlined,
                  ),


                  border:
                  const OutlineInputBorder(),



                  contentPadding:
                  EdgeInsets.symmetric(

                    horizontal:
                    isMobile ? 12 : 16,

                    vertical:
                    isMobile ? 12 : 15,

                  ),

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
              text: "Update",
              backgroundColor: AppColors.primaryColor,
              icon: Icons.edit,
              onPressed: () {

                /// Update API

                Navigator.pop(context);

              },
            ),

          ],



        );


      },

    );


  }


}