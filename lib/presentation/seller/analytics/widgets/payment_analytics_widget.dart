import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';


class PaymentAnalyticsWidget extends StatelessWidget {
  const PaymentAnalyticsWidget({
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

            blurRadius: 12,

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
                "Payment Analytics",
                style:
                AppTextStyles.titleMedium,
              ),


              const Spacer(),


              Icon(
                Iconsax.card,
                color:
                AppColors.primaryColor,
              ),

            ],
          ),



          SizedBox(height:25.h),



          SizedBox(

            height:200.h,

            child: PieChart(

              PieChartData(

                centerSpaceRadius:
                45.r,


                sectionsSpace:
                4,


                sections:[


                  PieChartSectionData(

                    value:45,

                    title:"45%",

                    radius:65,

                    color:
                    Colors.blue,

                  ),


                  PieChartSectionData(

                    value:25,

                    title:"25%",

                    radius:65,

                    color:
                    Colors.green,

                  ),


                  PieChartSectionData(

                    value:20,

                    title:"20%",

                    radius:65,

                    color:
                    Colors.orange,

                  ),


                  PieChartSectionData(

                    value:10,

                    title:"10%",

                    radius:65,

                    color:
                    Colors.purple,

                  ),

                ],
              ),
            ),
          ),



          SizedBox(height:25.h),



          const _PaymentTile(
            icon: Iconsax.card,
            title:"Credit / Debit Card",
            value:"45%",
            amount:"\$20,600",
            color:Colors.blue,
          ),


          SizedBox(height:12.h),



          const _PaymentTile(
            icon: Iconsax.wallet,
            title:"Wallet",
            value:"25%",
            amount:"\$11,450",
            color:Colors.green,
          ),



          SizedBox(height:12.h),



          const _PaymentTile(
            icon: Iconsax.money,
            title:"Cash On Delivery",
            value:"20%",
            amount:"\$9,200",
            color:Colors.orange,
          ),



          SizedBox(height:12.h),



          const _PaymentTile(
            icon: Iconsax.bank,
            title:"Bank Transfer",
            value:"10%",
            amount:"\$4,570",
            color:Colors.purple,
          ),


        ],
      ),
    );
  }
}



class _PaymentTile extends StatelessWidget {


  final IconData icon;

  final String title;

  final String value;

  final String amount;

  final Color color;



  const _PaymentTile({

    required this.icon,

    required this.title,

    required this.value,

    required this.amount,

    required this.color,

  });



  @override
  Widget build(BuildContext context) {


    return Row(

      children:[


        Container(

          width:45.w,

          height:45.w,


          decoration:BoxDecoration(

            color:
            color.withOpacity(.12),

            borderRadius:
            BorderRadius.circular(12.r),

          ),


          child:Icon(

            icon,

            color:color,

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
                  FontWeight.w600,

                ),

              ),


              SizedBox(height:4.h),


              Text(

                amount,

                style:
                AppTextStyles.bodySmall.copyWith(

                  color:
                  Colors.grey,

                ),

              ),

            ],
          ),
        ),



        Text(

          value,

          style:
          AppTextStyles.bodyLarge.copyWith(

            fontWeight:
            FontWeight.bold,

          ),

        ),

      ],
    );
  }
}