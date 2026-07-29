import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';




class SellerCouponDetailScreen extends StatefulWidget {
  const SellerCouponDetailScreen({
    super.key,
  });


  @override
  State<SellerCouponDetailScreen> createState() =>
      _SellerCouponDetailScreenState();
}


class _SellerCouponDetailScreenState
    extends State<SellerCouponDetailScreen> {


  @override
  Widget build(BuildContext context) {


    return AnnotatedRegion<SystemUiOverlayStyle>(

      value: const SystemUiOverlayStyle(

        statusBarColor:
        AppColors.primaryColor,

        statusBarIconBrightness:
        Brightness.light,
      ),


      child: Scaffold(


        backgroundColor:
        const Color(0xffF7F8FA),



        appBar: AppBar(

          backgroundColor:
          AppColors.primaryColor,

          elevation: 0,

          title:
          const Text(
            "Coupon Details",
          ),

          foregroundColor:
          Colors.white,

        ),




        body:
        SingleChildScrollView(


          padding:
          EdgeInsets.all(20.w),



          child:
          Column(


            children: [




              /// Coupon Header Card

              Container(

                width:
                double.infinity,


                padding:
                EdgeInsets.all(20.w),


                decoration:
                BoxDecoration(

                  color:
                  Colors.white,


                  borderRadius:
                  BorderRadius.circular(20.r),


                ),



                child:
                Column(

                  children: [


                    Container(

                      width:
                      75.w,

                      height:
                      75.w,


                      decoration:
                      BoxDecoration(

                        color:
                        AppColors.primaryColor
                            .withOpacity(.12),


                        shape:
                        BoxShape.circle,

                      ),


                      child:
                      const Icon(

                        Iconsax.ticket_discount,

                        size:
                        38,

                        color:
                        AppColors.primaryColor,

                      ),

                    ),



                    SizedBox(height:15.h),



                    Text(

                      "SUMMER50",

                      style:
                      AppTextStyles.titleLarge.copyWith(

                        fontWeight:
                        FontWeight.bold,

                      ),

                    ),



                    SizedBox(height:8.h),



                    Container(

                      padding:
                      EdgeInsets.symmetric(

                        horizontal:
                        15.w,

                        vertical:
                        7.h,

                      ),


                      decoration:
                      BoxDecoration(

                        color:
                        Colors.green.withOpacity(.12),

                        borderRadius:
                        BorderRadius.circular(30.r),

                      ),


                      child:
                      const Text(

                        "Active",

                        style:
                        TextStyle(

                          color:
                          Colors.green,

                          fontWeight:
                          FontWeight.bold,

                        ),

                      ),

                    ),


                  ],

                ),

              ),





              SizedBox(height:20.h),




              _section(

                title:
                "Coupon Information",


                children: [

                  _row(
                    Iconsax.discount_shape,
                    "Discount",
                    "50% OFF",
                  ),


                  _row(
                    Iconsax.category,
                    "Type",
                    "Percentage",
                  ),


                  _row(
                    Iconsax.wallet_money,
                    "Minimum Order",
                    "\$100",
                  ),


                  _row(
                    Iconsax.chart,
                    "Usage Limit",
                    "500 Users",
                  ),


                ],

              ),





              SizedBox(height:20.h),




              _section(

                title:
                "Validity",


                children: [

                  _row(
                    Iconsax.calendar,
                    "Start Date",
                    "20 July 2026",
                  ),


                  _row(
                    Iconsax.calendar,
                    "End Date",
                    "30 July 2026",
                  ),


                ],

              ),





              SizedBox(height:20.h),




              _section(

                title:
                "Performance",


                children: [


                  _row(
                    Iconsax.shopping_cart,
                    "Total Used",
                    "152 Times",
                  ),


                  _row(
                    Iconsax.money,
                    "Revenue Generated",
                    "\$4,820",
                  ),


                  _row(
                    Iconsax.people,
                    "Customers",
                    "128",
                  ),


                ],

              ),





              SizedBox(height:20.h),





              _section(

                title:
                "Recent Customers",


                children: [


                  _customer(
                    "Abdul Waheed",
                    "Order #10245",
                  ),


                  _customer(
                    "Ali Ahmed",
                    "Order #10250",
                  ),


                  _customer(
                    "Sara Khan",
                    "Order #10262",
                  ),


                ],

              ),





              SizedBox(height:30.h),





              Row(

                children: [


                  Expanded(

                    child:
                    OutlinedButton.icon(

                      onPressed: () {},

                      icon:
                      const Icon(
                        Iconsax.edit,
                      ),


                      label:
                      const Text(
                        "Edit",
                      ),

                    ),

                  ),



                  SizedBox(width:12.w),




                  Expanded(

                    child:
                    ElevatedButton.icon(

                      onPressed: () {},

                      icon:
                      const Icon(
                        Iconsax.trash,
                      ),


                      label:
                      const Text(
                        "Delete",
                      ),


                      style:
                      ElevatedButton.styleFrom(

                        backgroundColor:
                        Colors.red,

                        foregroundColor:
                        Colors.white,

                      ),

                    ),

                  ),



                ],

              ),




            ],

          ),

        ),


      ),

    );
  }







  Widget _section({

    required String title,

    required List<Widget> children,

  }){


    return Container(

      padding:
      EdgeInsets.all(18.w),


      width:
      double.infinity,


      decoration:
      BoxDecoration(

        color:
        Colors.white,


        borderRadius:
        BorderRadius.circular(18.r),

      ),



      child:
      Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,


        children: [


          Text(

            title,

            style:
            AppTextStyles.titleMedium.copyWith(

              fontWeight:
              FontWeight.bold,

            ),

          ),



          SizedBox(height:15.h),



          ...children,


        ],

      ),

    );

  }







  Widget _row(

      IconData icon,

      String title,

      String value,

      ){


    return Padding(

      padding:
      EdgeInsets.only(
        bottom:14.h,
      ),


      child:
      Row(

        children: [


          Icon(

            icon,

            color:
            AppColors.primaryColor,

            size:
            20,

          ),



          SizedBox(width:12.w),



          Expanded(

            child:
            Text(
              title,
            ),

          ),



          Text(

            value,

            style:
            const TextStyle(

              fontWeight:
              FontWeight.w600,

            ),

          ),


        ],

      ),

    );

  }







  Widget _customer(

      String name,

      String order,

      ){


    return Padding(

      padding:
      EdgeInsets.only(
        bottom:12.h,
      ),


      child:
      Row(

        children: [


          CircleAvatar(

            radius:
            22.r,

            backgroundImage:
            const NetworkImage(

              "https://i.pravatar.cc/150",

            ),

          ),



          SizedBox(width:12.w),



          Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [


              Text(

                name,

                style:
                const TextStyle(

                  fontWeight:
                  FontWeight.w600,

                ),

              ),


              Text(

                order,

                style:
                TextStyle(

                  color:
                  Colors.grey.shade600,

                ),

              ),


            ],

          ),



        ],

      ),

    );

  }

}