import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class WalletHeaderWidget extends StatefulWidget {
  const WalletHeaderWidget({
    super.key,
  });
  @override
  State<WalletHeaderWidget> createState() =>
      _WalletHeaderWidgetState();
}
class _WalletHeaderWidgetState extends State<WalletHeaderWidget> {
  bool showBalance = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w,),
      padding: EdgeInsets.all(22.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(25.r), boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(.25),
            blurRadius: 15, offset: const Offset(0,8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Seller Wallet",
                      style: AppTextStyles.headlineLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Text(
                      "Manage your earnings",
                      style:
                      AppTextStyles.bodyMedium.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width:48.w,
                height:48.w,
                decoration:BoxDecoration(
                  color: Colors.white.withOpacity(.15),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child:Icon(
                  Iconsax.wallet_3,
                  color: Colors.white,
                )
              ),
            ],
          ),
          SizedBox(height:35.h,),
          /// Balance Title
          Text(
            "Available Balance",
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.white70,
            ),
          ),
          SizedBox(height:8.h,),
          Row(
            children: [
              Text(
                showBalance
                    ? "\$25,850.00"
                    : "******",
                style: AppTextStyles.headlineLarge.copyWith(
                  color: Colors.white,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width:12.w,),
              InkWell(
                onTap:(){
                  setState(() {
                    showBalance = !showBalance;
                  });
                },
                child:Icon(
                  showBalance
                      ? Iconsax.eye
                      : Iconsax.eye_slash,
                  color: Colors.white70,
                  size: 22.sp,
                ),
              ),
            ],
          ),
          SizedBox(height:28.h,),
          /// Withdraw Button
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton.icon(
              onPressed:(){},
              icon: const Icon(Iconsax.money_send,),
              label: const Text("Withdraw Money",),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}