import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final double walletBalance = 12000.00;

  final List<WalletTransactionGroup> transactionGroups = [
    WalletTransactionGroup(
      title: 'Today',
      transactions: [
        WalletTransactionModel(
          title: 'Money Added to Wallet',
          dateTime: '24 September | 7:30 AM',
          balance: 12000.00,
          amount: 500.00,
          isCredit: true,
        ),
      ],
    ),
    WalletTransactionGroup(
      title: 'Yesterday',
      transactions: [
        WalletTransactionModel(
          title: 'Booking No #34234',
          dateTime: '23 September | 5:30 AM',
          balance: 11250.00,
          amount: 500.00,
          isCredit: false,
        ),
      ],
    ),
    WalletTransactionGroup(
      title: '22 September 2023',
      transactions: [
        WalletTransactionModel(
          title: 'Refund for Booking #34234',
          dateTime: '22 September | 7:30 AM',
          balance: 11250.00,
          amount: 500.00,
          isCredit: true,
        ),
        WalletTransactionModel(
          title: 'Booking #34234',
          dateTime: '22 September | 7:30 AM',
          balance: 11250.00,
          amount: 250.00,
          isCredit: false,
        ),
        WalletTransactionModel(
          title: 'Booking #34234',
          dateTime: '22 September | 7:30 AM',
          balance: 11250.00,
          amount: 250.00,
          isCredit: false,
        ),
        WalletTransactionModel(
          title: 'Booking #34234',
          dateTime: '22 September | 7:30 AM',
          balance: 11250.00,
          amount: 250.00,
          isCredit: false,
        ),
      ],
    ),
  ];

  void addMoney() {
    // TODO: Add money flow / payment gateway later
    context.go(AppRoutes.addMoneyScreen);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.background,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leadingWidth: 65.w,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              top: 6.h,
              bottom: 6.h,
            ),
            child: CustomBackButtonWidget(
              onTap: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go(AppRoutes.userProfileScreen);
                }
              },
            ),
          ),
          title: Text(
            'Wallet',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontSize: 17.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              20.w,
              16.h,
              20.w,
              28.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWalletBalanceCard(),

                SizedBox(height: 18.h),

                _buildTransactionList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWalletBalanceCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.10),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wallet Balance',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      '\$ ${walletBalance.toStringAsFixed(2)}',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: 42.w,
                height: 42.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(9.r),
                ),
                child: Icon(
                  Iconsax.wallet_3,
                  color: AppColors.primaryColor,
                  size: 24.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 14.h),

          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: addMoney,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.r),
                ),
              ),
              child: Text(
                'Add Money',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: transactionGroups.map((WalletTransactionGroup group) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                group.title,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 8.h),

              ListView.separated(
                itemCount: group.transactions.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(height: 9.h);
                },
                itemBuilder: (context, index) {
                  final WalletTransactionModel transaction =
                  group.transactions[index];

                  return WalletTransactionTile(
                    transaction: transaction,
                  );
                },
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class WalletTransactionTile extends StatelessWidget {
  const WalletTransactionTile({
    super.key,
    required this.transaction,
  });

  final WalletTransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    final Color amountColor = transaction.isCredit
        ? AppColors.success
        : AppColors.error;

    final String amountPrefix = transaction.isCredit ? '+' : '-';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 13.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.borderColor.withOpacity(0.65),
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.025),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: 5.h),

                Text(
                  transaction.dateTime,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textHint,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 10.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$amountPrefix \$${transaction.amount.toStringAsFixed(2)}',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: amountColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),

              SizedBox(height: 5.h),

              Text(
                'Balance \$${transaction.balance.toStringAsFixed(2)}',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textHint,
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WalletTransactionGroup {
  WalletTransactionGroup({
    required this.title,
    required this.transactions,
  });

  final String title;
  final List<WalletTransactionModel> transactions;
}

class WalletTransactionModel {
  WalletTransactionModel({
    required this.title,
    required this.dateTime,
    required this.balance,
    required this.amount,
    required this.isCredit,
  });

  final String title;
  final String dateTime;
  final double balance;
  final double amount;
  final bool isCredit;
}