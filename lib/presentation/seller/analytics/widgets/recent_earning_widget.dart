import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';


class RecentEarningsWidget extends StatelessWidget {

  const RecentEarningsWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {


    return Container(

      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),


      padding: EdgeInsets.all(18.w),


      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(20.r),


        boxShadow: [

          BoxShadow(

            color:
            Colors.black.withOpacity(.05),

            blurRadius:12,

            offset:
            const Offset(0,4),

          ),

        ],
      ),


      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,


        children: [


          Row(

            children: [


              Text(

                "Recent Earnings",

                style:
                AppTextStyles.titleMedium,

              ),


              const Spacer(),


              TextButton(

                onPressed:(){},

                child:
                const Text(
                  "View All",
                ),

              ),

            ],

          ),



          SizedBox(height:18.h),



          const _EarningTile(

            id:"#TRX-10245",

            title:"Order Payment",

            date:"29 July 2026",

            method:"Credit Card",

            amount:"\$1,250",

            status:"Completed",

            statusColor:
            Colors.green,

          ),



          SizedBox(height:14.h),



          const _EarningTile(

            id:"#TRX-10246",

            title:"Order Payment",

            date:"28 July 2026",

            method:"Cash On Delivery",

            amount:"\$850",

            status:"Pending",

            statusColor:
            Colors.orange,

          ),



          SizedBox(height:14.h),



          const _EarningTile(

            id:"#TRX-10247",

            title:"Withdrawal",

            date:"27 July 2026",

            method:"Bank Transfer",

            amount:"\$2,500",

            status:"Completed",

            statusColor:
            Colors.green,

          ),


        ],
      ),
    );
  }
}




class _EarningTile extends StatelessWidget {


  final String id;

  final String title;

  final String date;

  final String method;

  final String amount;

  final String status;

  final Color statusColor;



  const _EarningTile({

    required this.id,

    required this.title,

    required this.date,

    required this.method,

    required this.amount,

    required this.status,

    required this.statusColor,

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

            width:48.w,

            height:48.w,


            decoration:BoxDecoration(

              color:
              AppColors.primaryColor
                  .withOpacity(.12),


              borderRadius:
              BorderRadius.circular(14.r),

            ),


            child: Icon(

              Iconsax.money_recive,

              color:
              AppColors.primaryColor,

              size:22.sp,

            ),

          ),



          SizedBox(width:12.w),



          Expanded(

            child:Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,


              children:[


                Text(

                  title,

                  style:
                  AppTextStyles.bodyMedium.copyWith(

                    fontWeight:
                    FontWeight.bold,

                  ),

                ),



                SizedBox(height:4.h),



                Text(

                  id,

                  style:
                  AppTextStyles.bodySmall.copyWith(

                    color:
                    Colors.grey,

                  ),

                ),



                SizedBox(height:4.h),



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


            children:[


              Text(

                amount,

                style:
                AppTextStyles.bodyLarge.copyWith(

                  fontWeight:
                  FontWeight.bold,

                ),

              ),



              SizedBox(height:6.h),



              Container(

                padding:
                EdgeInsets.symmetric(

                  horizontal:8.w,

                  vertical:4.h,

                ),


                decoration:BoxDecoration(

                  color:
                  statusColor.withOpacity(.12),


                  borderRadius:
                  BorderRadius.circular(20.r),

                ),


                child:Text(

                  status,

                  style:TextStyle(

                    color:
                    statusColor,

                    fontSize:
                    11.sp,

                    fontWeight:
                    FontWeight.bold,

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