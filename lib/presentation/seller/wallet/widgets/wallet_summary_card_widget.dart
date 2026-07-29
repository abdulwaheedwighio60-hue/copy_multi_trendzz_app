import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class WalletSummaryCardsWidget extends StatelessWidget {
  const WalletSummaryCardsWidget({super.key,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w,),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 14.w,
        mainAxisSpacing: 14.h,
        childAspectRatio: 1.30,
        children: const [
          _WalletCard(
            title: "Total Earnings",
            amount: "\$85,200",
            icon: Iconsax.wallet_money,
            color: Colors.green,
            growth: "+18%",
          ),
          _WalletCard(
            title: "This Month",
            amount: "\$12,500",
            icon: Iconsax.chart_2,
            color: Colors.blue,
            growth: "+12%",
          ),
          _WalletCard(
            title: "Pending",
            amount: "\$5,200",
            icon: Iconsax.clock,
            color: Colors.orange,
            growth: "Pending",
          ),
          _WalletCard(
            title: "Withdrawn",
            amount: "\$45,000",
            icon: Iconsax.money_send,
            color: Colors.purple,
            growth: "Completed",
          ),
        ],
      ),
    );
  }
}

class _WalletCard extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;
  final Color color;
  final String growth;

  const _WalletCard({
    required this.title,
    required this.amount,
    required this.icon,
    required this.color,
    required this.growth,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0,4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 45.w,
                height: 45.w,
                decoration: BoxDecoration(
                  color: color.withOpacity(.12),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Icon(icon, color: color, size: 24.sp,),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(.12),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  growth,
                  style: TextStyle(
                    color: color,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            amount,
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height:5.h,),
          Text(title,
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}