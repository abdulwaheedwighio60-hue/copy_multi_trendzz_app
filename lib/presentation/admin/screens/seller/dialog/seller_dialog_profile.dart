import 'package:flutter/material.dart';


class SellerProfileDialog extends StatelessWidget {


  final String image;
  final String sellerName;
  final String storeName;
  final String email;
  final String phone;
  final String orders;
  final String sales;
  final String status;
  final String joinedDate;



  const SellerProfileDialog({

    super.key,

    required this.image,
    required this.sellerName,
    required this.storeName,
    required this.email,
    required this.phone,
    required this.orders,
    required this.sales,
    required this.status,
    required this.joinedDate,

  });





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




        child: Column(


          mainAxisSize:
          MainAxisSize.min,



          children: [



            /// Header

            Row(

              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,


              children: [



                const Text(

                  "Seller Profile",

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






            /// Profile Image

            CircleAvatar(

              radius:50,


              backgroundImage:
              NetworkImage(image),


            ),




            const SizedBox(height:15),





            Text(

              sellerName,

              style:
              const TextStyle(

                fontSize:22,

                fontWeight:
                FontWeight.bold,

              ),

            ),




            const SizedBox(height:5),




            Text(

              storeName,

              style:
              TextStyle(

                color:
                Colors.grey.shade600,

                fontSize:15,

              ),

            ),





            const SizedBox(height:15),





            _statusChip(status),






            const SizedBox(height:25),






            /// Seller Information

            _infoCard(

              title:
              "Seller Information",

              children: [


                _infoRow(
                  Icons.email_outlined,
                  "Email",
                  email,
                ),



                _infoRow(
                  Icons.phone_outlined,
                  "Phone",
                  phone,
                ),



                _infoRow(
                  Icons.calendar_today_outlined,
                  "Joined",
                  joinedDate,
                ),


              ],


            ),





            const SizedBox(height:15),






            /// Sales Information

            _infoCard(

              title:
              "Performance",


              children: [



                _infoRow(

                  Icons.shopping_bag_outlined,

                  "Total Orders",

                  orders,

                ),





                _infoRow(

                  Icons.attach_money,

                  "Total Sales",

                  sales,

                ),



              ],


            ),





          ],


        ),


      ),



    );


  }







  Widget _statusChip(String status){


    Color color;


    switch(status){


      case "Active":

        color =
            Colors.green;

        break;




      case "Pending":

        color =
            Colors.orange;

        break;




      default:

        color =
            Colors.red;


    }




    return Container(


      padding:
      const EdgeInsets.symmetric(

        horizontal:18,

        vertical:7,

      ),



      decoration:
      BoxDecoration(


        color:
        color.withOpacity(.12),



        borderRadius:
        BorderRadius.circular(30),


      ),




      child:Text(

        status,


        style:
        TextStyle(

          color:color,

          fontWeight:
          FontWeight.w600,

        ),


      ),


    );


  }









  Widget _infoCard({

    required String title,

    required List<Widget> children,

  }){


    return Container(


      padding:
      const EdgeInsets.all(15),



      decoration:
      BoxDecoration(


        color:
        Colors.grey.shade50,



        borderRadius:
        BorderRadius.circular(14),


        border:
        Border.all(

          color:
          Colors.grey.shade200,

        ),


      ),




      child:Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,


        children: [



          Text(

            title,

            style:
            const TextStyle(

              fontWeight:
              FontWeight.bold,

              fontSize:16,

            ),

          ),




          const SizedBox(height:12),



          ...children,


        ],


      ),


    );


  }







  Widget _infoRow(

      IconData icon,

      String title,

      String value,

      ){



    return Padding(

      padding:
      const EdgeInsets.only(
        bottom:10,
      ),



      child:Row(

        children: [



          Icon(

            icon,

            size:20,

            color:
            Colors.blue,

          ),




          const SizedBox(width:10),




          Text(

            "$title:",

            style:
            const TextStyle(

              fontWeight:
              FontWeight.w600,

            ),

          ),





          const SizedBox(width:8),




          Expanded(

            child:Text(

              value,

              overflow:
              TextOverflow.ellipsis,

            ),

          )


        ],


      ),

    );


  }


}