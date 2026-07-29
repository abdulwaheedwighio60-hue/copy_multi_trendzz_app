import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';


class TransactionHistoryWidget extends StatelessWidget {

  const TransactionHistoryWidget({
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

                "Transaction History",

                style:
                AppTextStyles.titleMedium,

              ),



              const Spacer(),



              TextButton(

                onPressed: () {},

                child:
                const Text(
                  "View All",
                ),

              ),

            ],

          ),



          SizedBox(
            height:18.h,
          ),



          const _TransactionTile(

            title:
            "Order Payment",

            id:
            "#TXN-45821",

            date:
            "29 July 2026",

            method:
            "Credit Card",

            amount:
            "+\$1,250",

            status:
            "Completed",

            isIncome:
            true,

          ),



          SizedBox(
            height:14.h,
          ),



          const _TransactionTile(

            title:
            "Withdrawal",

            id:
            "#TXN-45820",

            date:
            "28 July 2026",

            method:
            "Bank Transfer",

            amount:
            "-\$500",

            status:
            "Completed",

            isIncome:
            false,

          ),



          SizedBox(
            height:14.h,
          ),



          const _TransactionTile(

            title:
            "Refund Payment",

            id:
            "#TXN-45819",

            date:
            "27 July 2026",

            method:
            "Wallet",

            amount:
            "-\$120",

            status:
            "Pending",

            isIncome:
            false,

          ),

        ],

      ),

    );

  }

}




class _TransactionTile extends StatelessWidget {


  final String title;

  final String id;

  final String date;

  final String method;

  final String amount;

  final String status;

  final bool isIncome;



  const _TransactionTile({

    required this.title,

    required this.id,

    required this.date,

    required this.method,

    required this.amount,

    required this.status,

    required this.isIncome,

  });



  @override
  Widget build(BuildContext context) {


    return Container(

      padding:
      EdgeInsets.all(14.w),


      decoration: BoxDecoration(

        color:
        Colors.grey.shade50,


        borderRadius:
        BorderRadius.circular(16.r),

      ),



      child: Row(

        children: [


          Container(

            width:
            48.w,


            height:
            48.w,


            decoration:
            BoxDecoration(

              color:
              isIncome

                  ? Colors.green.withOpacity(.12)

                  : Colors.red.withOpacity(.12),


              borderRadius:
              BorderRadius.circular(14.r),

            ),


            child:
            Icon(

              isIncome

                  ? Iconsax.money_recive

                  : Iconsax.money_send,


              color:
              isIncome

                  ? Colors.green

                  : Colors.red,


            ),

          ),



          SizedBox(
            width:12.w,
          ),



          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,


              children: [


                Text(

                  title,

                  style:
                  AppTextStyles.bodyMedium.copyWith(

                    fontWeight:
                    FontWeight.bold,

                  ),

                ),



                SizedBox(
                  height:4.h,
                ),



                Text(

                  id,

                  style:
                  AppTextStyles.bodySmall.copyWith(

                    color:
                    Colors.grey,

                  ),

                ),



                SizedBox(
                  height:4.h,
                ),



                Text(

                  "$date • $method",

                  style:
                  AppTextStyles.bodySmall.copyWith(

                    color:
                    Colors.grey,

                  ),

                ),


              ],

            ),

          ),



          Column(

            crossAxisAlignment:
            CrossAxisAlignment.end,


            children: [


              Text(

                amount,

                style:
                AppTextStyles.bodyLarge.copyWith(

                  fontWeight:
                  FontWeight.bold,

                  color:
                  isIncome

                      ? Colors.green

                      : Colors.red,

                ),

              ),



              SizedBox(
                height:6.h,
              ),



              Container(

                padding:
                EdgeInsets.symmetric(

                  horizontal:
                  8.w,

                  vertical:
                  4.h,

                ),


                decoration:
                BoxDecoration(

                  color:

                  status == "Completed"

                      ? Colors.green.withOpacity(.12)

                      : Colors.orange.withOpacity(.12),


                  borderRadius:
                  BorderRadius.circular(20.r),

                ),


                child:
                Text(

                  status,

                  style:
                  TextStyle(

                    fontSize:
                    11.sp,

                    fontWeight:
                    FontWeight.bold,


                    color:

                    status == "Completed"

                        ? Colors.green

                        : Colors.orange,

                  ),

                ),

              ),

            ],

          ),

        ],

      ),

    );

  }

}