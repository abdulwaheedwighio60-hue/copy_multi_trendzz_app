import 'package:flutter/material.dart';


class EditSellerDialog extends StatefulWidget {


  final String sellerName;
  final String storeName;
  final String email;
  final String phone;
  final String status;


  final VoidCallback? onUpdate;



  const EditSellerDialog({

    super.key,

    required this.sellerName,
    required this.storeName,
    required this.email,
    required this.phone,
    required this.status,

    this.onUpdate,

  });



  @override
  State<EditSellerDialog> createState() =>
      _EditSellerDialogState();

}





class _EditSellerDialogState
    extends State<EditSellerDialog> {



  final formKey =
  GlobalKey<FormState>();


  late TextEditingController nameController;

  late TextEditingController storeController;

  late TextEditingController emailController;

  late TextEditingController phoneController;



  late String selectedStatus;



  final List<String> statusList = [

    "Active",
    "Pending",
    "Blocked",

  ];





  @override
  void initState() {

    super.initState();


    nameController =
        TextEditingController(
          text: widget.sellerName,
        );


    storeController =
        TextEditingController(
          text: widget.storeName,
        );


    emailController =
        TextEditingController(
          text: widget.email,
        );


    phoneController =
        TextEditingController(
          text: widget.phone,
        );


    selectedStatus =
        widget.status;


  }





  @override
  Widget build(BuildContext context) {


    final width =
        MediaQuery.of(context).size.width;



    return Dialog(


      shape:
      RoundedRectangleBorder(

        borderRadius:
        BorderRadius.circular(20),

      ),




      child: Container(


        width:

        width > 700

            ? 650

            : width * .9,



        padding:
        const EdgeInsets.all(25),



        child: Form(


          key:
          formKey,



          child: Column(


            mainAxisSize:
            MainAxisSize.min,



            crossAxisAlignment:
            CrossAxisAlignment.start,



            children: [



              /// Header

              Row(

                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,


                children: [



                  const Text(

                    "Edit Seller",

                    style:
                    TextStyle(

                      fontSize:22,

                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),




                  IconButton(

                    onPressed:(){

                      Navigator.pop(context);

                    },


                    icon:
                    const Icon(
                      Icons.close,
                    ),

                  )


                ],

              ),




              const SizedBox(height:20),






              _field(

                controller:
                nameController,

                label:
                "Seller Name",

                icon:
                Icons.person_outline,

              ),




              const SizedBox(height:15),





              _field(

                controller:
                storeController,

                label:
                "Store Name",

                icon:
                Icons.store_outlined,

              ),





              const SizedBox(height:15),





              _field(

                controller:
                emailController,

                label:
                "Email",

                icon:
                Icons.email_outlined,

              ),





              const SizedBox(height:15),






              _field(

                controller:
                phoneController,

                label:
                "Phone",

                icon:
                Icons.phone_outlined,

              ),





              const SizedBox(height:15),






              DropdownButtonFormField<String>(


                value:
                selectedStatus,



                decoration:
                _decoration(

                  "Status",

                  Icons.toggle_on_outlined,

                ),



                items:

                statusList.map((status){



                  return DropdownMenuItem(

                    value:status,

                    child:
                    Text(status),

                  );


                }).toList(),




                onChanged:(value){



                  setState((){

                    selectedStatus =
                    value!;

                  });



                },


              ),





              const SizedBox(height:25),






              Row(

                mainAxisAlignment:
                MainAxisAlignment.end,


                children: [



                  TextButton(

                    onPressed:(){

                      Navigator.pop(context);

                    },


                    child:
                    const Text(
                      "Cancel",
                    ),

                  ),




                  const SizedBox(width:10),





                  ElevatedButton(


                    onPressed:(){



                      if(formKey.currentState!
                          .validate()){



                        widget.onUpdate
                            ?.call();



                        Navigator.pop(context);



                      }



                    },



                    child:
                    const Text(

                      "Update Seller",

                    ),


                  ),


                ],


              )




            ],


          ),


        ),


      ),


    );


  }







  Widget _field({

    required TextEditingController controller,

    required String label,

    required IconData icon,

  }){


    return TextFormField(


      controller:
      controller,



      validator:(value){


        if(value == null ||
            value.isEmpty){


          return "Required field";


        }


        return null;


      },



      decoration:
      _decoration(

        label,

        icon,

      ),


    );


  }






  InputDecoration _decoration(

      String label,

      IconData icon,

      ){



    return InputDecoration(


      labelText:
      label,


      prefixIcon:
      Icon(icon),



      filled:true,


      fillColor:
      Colors.grey.shade50,



      border:
      OutlineInputBorder(

        borderRadius:
        BorderRadius.circular(12),

        borderSide:
        BorderSide.none,

      ),


    );


  }



}