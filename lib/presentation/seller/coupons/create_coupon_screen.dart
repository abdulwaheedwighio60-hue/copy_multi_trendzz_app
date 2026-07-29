import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_style.dart';


class CreateCouponScreen extends StatefulWidget {
  const CreateCouponScreen({super.key});

  @override
  State<CreateCouponScreen> createState() =>
      _CreateCouponScreenState();
}


class _CreateCouponScreenState
    extends State<CreateCouponScreen> {


  String selectedType = "Percentage";


  final couponController =
  TextEditingController();

  final discountController =
  TextEditingController();

  final minimumOrderController =
  TextEditingController();

  final usageLimitController =
  TextEditingController();

  final descriptionController =
  TextEditingController();



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

          title: const Text(
            "Create Coupon",
          ),

          foregroundColor:
          Colors.white,
        ),



        body: SingleChildScrollView(

          padding:
          EdgeInsets.all(20.w),


          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,


            children: [



              _title(
                "Coupon Information",
              ),



              SizedBox(height:15.h),



              _inputField(

                controller:
                couponController,

                label:
                "Coupon Code",

                hint:
                "Example: SUMMER50",

                icon:
                Iconsax.ticket,
              ),



              SizedBox(height:15.h),



              _title(
                "Discount Type",
              ),



              SizedBox(height:10.h),



              Row(

                children: [

                  _typeButton(
                    "Percentage",
                  ),

                  SizedBox(width:12.w),


                  _typeButton(
                    "Flat",
                  ),

                ],
              ),




              SizedBox(height:20.h),



              _inputField(

                controller:
                discountController,

                label:
                "Discount Value",

                hint:
                "Enter discount amount",

                icon:
                Iconsax.discount_shape,

                keyboard:
                TextInputType.number,
              ),




              SizedBox(height:15.h),




              _inputField(

                controller:
                minimumOrderController,

                label:
                "Minimum Order Amount",

                hint:
                "\$100",

                icon:
                Iconsax.wallet_money,

                keyboard:
                TextInputType.number,
              ),




              SizedBox(height:15.h),




              _inputField(

                controller:
                usageLimitController,

                label:
                "Usage Limit",

                hint:
                "Example: 500",

                icon:
                Iconsax.chart,

                keyboard:
                TextInputType.number,
              ),





              SizedBox(height:20.h),



              _title(
                "Coupon Validity",
              ),



              SizedBox(height:15.h),



              Row(

                children: [

                  Expanded(
                    child:
                    _dateBox(
                      "Start Date",
                    ),
                  ),


                  SizedBox(width:12.w),


                  Expanded(
                    child:
                    _dateBox(
                      "End Date",
                    ),
                  ),

                ],
              ),





              SizedBox(height:20.h),




              _inputField(

                controller:
                descriptionController,

                label:
                "Description",

                hint:
                "Enter coupon description",

                icon:
                Iconsax.note_text,

                maxLines:
                4,
              ),




              SizedBox(height:30.h),





              SizedBox(

                width:
                double.infinity,

                height:
                55.h,


                child:
                ElevatedButton(

                  onPressed: (){


                    // UI Only

                  },


                  style:
                  ElevatedButton.styleFrom(

                    backgroundColor:
                    AppColors.primaryColor,

                    foregroundColor:
                    Colors.white,


                    shape:
                    RoundedRectangleBorder(

                      borderRadius:
                      BorderRadius.circular(15.r),

                    ),

                  ),


                  child:
                  const Text(
                    "Create Coupon",
                  ),

                ),
              ),




            ],
          ),
        ),
      ),
    );
  }





  Widget _title(String text){

    return Text(

      text,

      style:
      AppTextStyles.titleMedium.copyWith(

        fontWeight:
        FontWeight.bold,

      ),

    );
  }





  Widget _inputField({

    required TextEditingController controller,

    required String label,

    required String hint,

    required IconData icon,

    TextInputType keyboard =
        TextInputType.text,

    int maxLines = 1,

  }){


    return TextField(

      controller:
      controller,

      keyboardType:
      keyboard,

      maxLines:
      maxLines,


      decoration:
      InputDecoration(

        labelText:
        label,


        hintText:
        hint,


        prefixIcon:
        Icon(icon),



        filled:
        true,


        fillColor:
        Colors.white,


        border:
        OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(14.r),

          borderSide:
          BorderSide.none,

        ),

      ),
    );
  }





  Widget _typeButton(String type){

    bool selected =
        selectedType == type;


    return Expanded(

      child:
      GestureDetector(

        onTap: (){

          setState(() {

            selectedType =
                type;

          });

        },


        child:
        Container(

          height:
          50.h,


          alignment:
          Alignment.center,


          decoration:
          BoxDecoration(

            color:
            selected

                ?
            AppColors.primaryColor

                :
            Colors.white,


            borderRadius:
            BorderRadius.circular(14.r),


            border:
            Border.all(

              color:
              selected

                  ?
              AppColors.primaryColor

                  :
              Colors.grey.shade300,

            ),

          ),



          child:
          Text(

            type,

            style:
            TextStyle(

              color:
              selected

                  ?
              Colors.white

                  :
              Colors.black,

              fontWeight:
              FontWeight.w600,

            ),

          ),

        ),
      ),
    );
  }






  Widget _dateBox(String title){

    return Container(

      height:
      55.h,


      padding:
      EdgeInsets.symmetric(
        horizontal:15.w,
      ),


      decoration:
      BoxDecoration(

        color:
        Colors.white,

        borderRadius:
        BorderRadius.circular(14.r),

      ),


      child:
      Row(

        children: [

          const Icon(
            Iconsax.calendar,
          ),


          SizedBox(
            width:10.w,
          ),


          Text(
            title,
          ),

        ],
      ),
    );
  }

}