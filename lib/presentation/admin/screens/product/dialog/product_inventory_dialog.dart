import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import '../model/product_model.dart';



class ProductInventoryDialog {



  static void show(
      BuildContext context,
      ProductModel product,
      ){



    final stockController =
    TextEditingController(
        text: product.stock.toString()
    );



    showDialog(

      context: context,

      builder: (_){


        final width =
            MediaQuery.of(context).size.width;


        final bool isMobile =
            width < 600;


        final bool isTablet =
            width >= 600 && width < 1100;



        final double fontSize =
        isMobile
            ? 13
            : isTablet
            ? 14
            : 16;



        final double spacing =
        isMobile
            ? 14
            : 20;



        return ResponsiveDialog(


          title: "Manage Inventory",




          child: Column(


            crossAxisAlignment:
            CrossAxisAlignment.start,


            children: [




              Text(

                "Update stock for ${product.productName}",


                maxLines: 2,


                overflow:
                TextOverflow.ellipsis,


                style: TextStyle(

                  fontSize: fontSize,

                  fontWeight:
                  FontWeight.w500,

                  color:
                  Colors.black87,

                ),


              ),




              SizedBox(
                height: spacing,
              ),





              TextField(


                controller: stockController,


                keyboardType:
                TextInputType.number,



                style: TextStyle(

                  fontSize: fontSize,

                ),




                decoration: InputDecoration(



                  labelText:
                  "Available Stock",




                  labelStyle:
                  TextStyle(

                    fontSize: fontSize,

                  ),




                  contentPadding:
                  EdgeInsets.symmetric(

                    horizontal:
                    isMobile ? 12 : 16,


                    vertical:
                    isMobile ? 12 : 15,

                  ),




                  border:
                  OutlineInputBorder(


                    borderRadius:
                    BorderRadius.circular(

                        isMobile ? 10 : 14

                    ),


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
              text: "Save",
              backgroundColor: Colors.green,
              icon: Icons.save_outlined,
              onPressed: () {},
            )




          ],




        );



      },


    );



  }



}