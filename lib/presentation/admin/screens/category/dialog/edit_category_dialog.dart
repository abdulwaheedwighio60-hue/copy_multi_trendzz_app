import 'package:flutter/material.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog.dart';
import 'package:multi_trendzz/core/widgets/responsive_dialog_button.dart';
import 'package:multi_trendzz/presentation/admin/screens/category/model/category_model.dart';


class CategoryEditDialog {


  static void show(
      BuildContext context,
      CategoryModel category,
      ) {


    final nameController =
    TextEditingController(
      text: category.name,
    );


    final descriptionController =
    TextEditingController(
      text: category.description,
    );


    final productController =
    TextEditingController(
      text: category.products.toString(),
    );


    bool status = category.status;



    showDialog(

      context: context,


      builder: (_) {


        return StatefulBuilder(

          builder: (context, setState) {


            final width =
                MediaQuery.of(context).size.width;


            final bool isMobile =
                width < 700;



            final double textSize =
            width >= 1100
                ? 15
                : width >=700
                ? 14
                : 13;



            return ResponsiveDialog(

              title: "Update Category",


              child: Column(

                children: [


                  CircleAvatar(

                    radius:
                    isMobile ? 35 : 45,


                    backgroundImage:
                    NetworkImage(
                      category.image,
                    ),

                  ),



                  const SizedBox(height:20),



                  TextField(

                    controller:
                    nameController,


                    style: TextStyle(
                      fontSize: textSize,
                    ),


                    decoration:
                    InputDecoration(

                      labelText:
                      "Category Name",


                      prefixIcon:
                      const Icon(
                        Icons.category_outlined,
                      ),


                      border:
                      OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(12),

                      ),

                    ),

                  ),



                  const SizedBox(height:15),




                  TextField(

                    controller:
                    descriptionController,


                    maxLines:3,


                    style:TextStyle(
                      fontSize:textSize,
                    ),


                    decoration:
                    InputDecoration(

                      labelText:
                      "Description",


                      prefixIcon:
                      const Icon(
                        Icons.description_outlined,
                      ),


                      border:
                      OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(12),

                      ),

                    ),

                  ),



                  const SizedBox(height:15),




                  TextField(

                    controller:
                    productController,


                    keyboardType:
                    TextInputType.number,


                    style:
                    TextStyle(
                      fontSize:textSize,
                    ),


                    decoration:
                    InputDecoration(

                      labelText:
                      "Total Products",


                      prefixIcon:
                      const Icon(
                        Icons.inventory_2_outlined,
                      ),


                      border:
                      OutlineInputBorder(

                        borderRadius:
                        BorderRadius.circular(12),

                      ),

                    ),

                  ),




                  const SizedBox(height:15),




                  Row(

                    children: [


                      Text(

                        "Category Status",


                        style:
                        TextStyle(

                          fontSize:textSize,

                          fontWeight:
                          FontWeight.w600,

                        ),

                      ),



                      const Spacer(),




                      Switch(

                        value: status,


                        activeColor:
                        AppColors.primaryColor,


                        onChanged:(value){

                          setState((){

                            status=value;

                          });

                        },

                      ),

                    ],

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


      },

    );

  }

}