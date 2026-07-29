import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';


class WithdrawMoneyWidget extends StatelessWidget {

  const WithdrawMoneyWidget({
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

                "Withdraw Money",

                style:
                AppTextStyles.titleMedium,

              ),


              const Spacer(),


              Icon(

                Iconsax.money_send,

                color:
                AppColors.primaryColor,

              ),

            ],

          ),



          SizedBox(
            height:20.h,
          ),



          /// Available Balance

          Container(

            padding:
            EdgeInsets.all(14.w),


            decoration:
            BoxDecoration(

              color:
              AppColors.primaryColor
                  .withOpacity(.08),


              borderRadius:
              BorderRadius.circular(14.r),

            ),


            child:
            Row(

              children: [


                Icon(

                  Iconsax.wallet,

                  color:
                  AppColors.primaryColor,

                ),


                SizedBox(
                  width:10.w,
                ),


                Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [


                    Text(

                      "Available Balance",

                      style:
                      AppTextStyles.bodySmall,

                    ),


                    SizedBox(
                      height:4.h,
                    ),


                    Text(

                      "\$25,850",

                      style:
                      AppTextStyles.bodyLarge.copyWith(

                        fontWeight:
                        FontWeight.bold,

                      ),

                    ),

                  ],

                ),

              ],

            ),

          ),



          SizedBox(height:18.h),
          /// Amount Field
          Text(
            "Enter Amount",
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height:8.h,),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.dollar_circle,),

              hintText: "Enter withdrawal amount",
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          SizedBox(height:18.h,),

          /// Bank Selection

          Text(
            "Select Bank Account",
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height:8.h,),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w, vertical: 14.h,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              children: [
                Icon(
                  Iconsax.bank,
                  color: AppColors.primaryColor,
                ),
                SizedBox(width:10.w,),
                Expanded(
                  child: Text(
                    "HBL Bank - ****4582",
                    style:
                    AppTextStyles.bodyMedium,
                  )
                ),
                const Icon(Icons.keyboard_arrow_down),
              ],
            )
          ),
          SizedBox(height:18.h,),

          /// Fee Summary
          _SummaryRow(
            title: "Withdrawal Fee",
            value: "\$5",
          ),
          SizedBox(height:8.h,),
          _SummaryRow(
            title: "You Will Receive",
            value: "\$4,995",
          ),
          SizedBox(height:22.h,),
          /// Button
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton(
              onPressed:(){},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              child: Text(
                "Request Withdrawal",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class _SummaryRow extends StatelessWidget {
  final String title;
  final String value;
  const _SummaryRow({
    required this.title,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: AppTextStyles.bodyMedium,),
        const Spacer(),
        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}