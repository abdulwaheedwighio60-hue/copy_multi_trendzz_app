import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';


class BankAccountWidget extends StatelessWidget {

  const BankAccountWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    return Container(

      margin:
      EdgeInsets.symmetric(
        horizontal: 20.w,
      ),


      padding:
      EdgeInsets.all(18.w),


      decoration: BoxDecoration(

        color:
        Colors.white,


        borderRadius:
        BorderRadius.circular(20.r),


        boxShadow: [

          BoxShadow(

            color:
            Colors.black.withOpacity(.05),

            blurRadius:
            12,

            offset:
            const Offset(0,4),

          ),

        ],

      ),



      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,


        children: [


          /// Header

          Row(

            children: [


              Text(

                "Bank Account",

                style:
                AppTextStyles.titleMedium,

              ),



              const Spacer(),



              TextButton(

                onPressed: () {},

                child:
                const Text(
                  "Edit",
                ),

              ),

            ],

          ),



          SizedBox(
            height:18.h,
          ),



          /// Bank Card

          Container(

            padding:
            EdgeInsets.all(16.w),


            decoration: BoxDecoration(

              gradient:
              LinearGradient(

                colors: [

                  AppColors.primaryColor,

                  AppColors.primaryColor
                      .withOpacity(.75),

                ],

              ),


              borderRadius:
              BorderRadius.circular(18.r),

            ),



            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,


              children: [


                Row(

                  children: [


                    Container(

                      width:
                      45.w,


                      height:
                      45.w,


                      decoration:
                      BoxDecoration(

                        color:
                        Colors.white
                            .withOpacity(.15),

                        borderRadius:
                        BorderRadius.circular(12.r),

                      ),


                      child:
                      const Icon(

                        Iconsax.bank,

                        color:
                        Colors.white,

                      ),

                    ),



                    const Spacer(),



                    Container(

                      padding:
                      EdgeInsets.symmetric(

                        horizontal:
                        10.w,

                        vertical:
                        5.h,

                      ),


                      decoration:
                      BoxDecoration(

                        color:
                        Colors.white
                            .withOpacity(.20),


                        borderRadius:
                        BorderRadius.circular(20.r),

                      ),


                      child:
                      Row(

                        children: [


                          Icon(

                            Iconsax.verify5,

                            color:
                            Colors.white,

                            size:
                            14.sp,

                          ),


                          SizedBox(
                            width:4.w,
                          ),


                          Text(

                            "Verified",

                            style:
                            TextStyle(

                              color:
                              Colors.white,

                              fontSize:
                              11.sp,

                              fontWeight:
                              FontWeight.bold,

                            ),

                          ),

                        ],

                      ),

                    ),

                  ],

                ),



                SizedBox(
                  height:25.h,
                ),



                Text(

                  "HBL Bank",

                  style:
                  AppTextStyles.bodyLarge.copyWith(

                    color:
                    Colors.white,

                    fontWeight:
                    FontWeight.bold,

                  ),

                ),



                SizedBox(
                  height:8.h,
                ),



                Text(

                  "**** **** **** 4582",

                  style:
                  TextStyle(

                    color:
                    Colors.white,

                    fontSize:
                    20.sp,

                    letterSpacing:
                    2,

                    fontWeight:
                    FontWeight.bold,

                  ),

                ),



                SizedBox(
                  height:12.h,
                ),



                Text(

                  "Abdul Waheed",

                  style:
                  TextStyle(

                    color:
                    Colors.white70,

                    fontSize:
                    14.sp,

                  ),

                ),


              ],

            ),

          ),



          SizedBox(
            height:18.h,
          ),



          /// Add New Account Button

          InkWell(

            onTap: () {},


            child: Container(

              width:
              double.infinity,


              padding:
              EdgeInsets.symmetric(

                vertical:
                14.h,

              ),


              decoration:
              BoxDecoration(

                border:
                Border.all(

                  color:
                  AppColors.primaryColor,

                ),


                borderRadius:
                BorderRadius.circular(14.r),

              ),


              child:
              Row(

                mainAxisAlignment:
                MainAxisAlignment.center,


                children: [


                  Icon(

                    Iconsax.add_circle,

                    color:
                    AppColors.primaryColor,

                  ),



                  SizedBox(
                    width:8.w,
                  ),



                  Text(

                    "Add New Bank Account",

                    style:
                    TextStyle(

                      color:
                      AppColors.primaryColor,

                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),


                ],

              ),

            ),

          ),

        ],

      ),

    );

  }

}