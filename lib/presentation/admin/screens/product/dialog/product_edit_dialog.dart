import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import '../model/product_model.dart';


class ProductEditDialog {


  static void show(
      BuildContext context,
      ProductModel product,
      ){


    final nameController =
    TextEditingController(
        text: product.productName
    );


    final priceController =
    TextEditingController(
        text: product.price
    );


    final stockController =
    TextEditingController(
        text: product.stock.toString()
    );



    showDialog(

      context: context,

      builder:(_){


        return ResponsiveDialog(

          title: "Edit Product",


          child: LayoutBuilder(

            builder:(context,constraints){


              final width =
                  MediaQuery.of(context).size.width;


              final bool isMobile =
                  width < 600;


              final bool isTablet =
                  width >=600 && width <1100;



              final double fieldFont =
              isMobile
                  ? 13
                  : isTablet
                  ? 14
                  : 15;



              final double space =
              isMobile
                  ? 12
                  : 18;




              return Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,


                children:[



                  TextField(

                    controller:nameController,


                    style:TextStyle(
                      fontSize:fieldFont,
                    ),


                    decoration:
                    InputDecoration(

                      labelText:"Product Name",

                      labelStyle:
                      TextStyle(
                        fontSize:fieldFont,
                      ),


                      border:
                      OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(
                            isMobile ? 10 : 14
                        ),

                      ),


                      contentPadding:
                      EdgeInsets.symmetric(

                        horizontal:
                        isMobile ? 12 : 16,

                        vertical:
                        isMobile ? 12 : 16,

                      ),

                    ),

                  ),



                  SizedBox(height:space),




                  TextField(

                    controller:priceController,


                    style:TextStyle(
                      fontSize:fieldFont,
                    ),



                    keyboardType:
                    TextInputType.number,


                    decoration:
                    InputDecoration(


                      labelText:"Price",


                      labelStyle:
                      TextStyle(
                        fontSize:fieldFont,
                      ),


                      border:
                      OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(
                            isMobile ? 10 : 14
                        ),

                      ),


                      contentPadding:
                      EdgeInsets.symmetric(

                        horizontal:
                        isMobile ? 12 : 16,

                        vertical:
                        isMobile ? 12 : 16,

                      ),

                    ),

                  ),



                  SizedBox(height:space),





                  TextField(

                    controller:stockController,


                    keyboardType:
                    TextInputType.number,


                    style:
                    TextStyle(
                      fontSize:fieldFont,
                    ),



                    decoration:
                    InputDecoration(


                      labelText:"Stock",


                      labelStyle:
                      TextStyle(
                        fontSize:fieldFont,
                      ),


                      border:
                      OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(
                            isMobile ? 10 : 14
                        ),

                      ),


                      contentPadding:
                      EdgeInsets.symmetric(

                        horizontal:
                        isMobile ? 12 : 16,

                        vertical:
                        isMobile ? 12 : 16,

                      ),


                    ),


                  ),



                ],

              );


            },

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