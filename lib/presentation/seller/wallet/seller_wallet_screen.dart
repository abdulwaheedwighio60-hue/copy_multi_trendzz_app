import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/presentation/seller/wallet/widgets/wallet_summary_card_widget.dart';
import 'package:multi_trendzz/presentation/seller/wallet/widgets/withdraw_request_widget.dart';

import '../../../core/constants/app_colors.dart';
import 'widgets/bank_account_widget.dart';
import 'widgets/transaction_history_widget.dart';
import 'widgets/wallet_header_widget.dart';
import 'widgets/withdraw_money_widget.dart';

class SellerWalletScreen extends StatefulWidget {
  const SellerWalletScreen({super.key});

  @override
  State<SellerWalletScreen> createState() =>
      _SellerWalletScreenState();
}

class _SellerWalletScreenState
    extends State<SellerWalletScreen> {

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(

      value: const SystemUiOverlayStyle(

        statusBarColor: AppColors.primaryColor,

        statusBarIconBrightness:
        Brightness.light,

        statusBarBrightness:
        Brightness.light,

      ),

      child: Scaffold(

        backgroundColor:
        const Color(0xffF7F8FA),

        body: SafeArea(

          child: SingleChildScrollView(

            physics:
            const BouncingScrollPhysics(),

            child: Column(

              children: [

                SizedBox(height: 20.h),

                /// Wallet Header
                const WalletHeaderWidget(),

                SizedBox(height: 20.h),

                /// Summary Cards
                const WalletSummaryCardsWidget(),

                SizedBox(height: 20.h),

                /// Withdraw Money
                const WithdrawMoneyWidget(),

                SizedBox(height: 20.h),

                /// Bank Account
                const BankAccountWidget(),

                SizedBox(height: 20.h),

                /// Transaction History
                const TransactionHistoryWidget(),

                SizedBox(height: 20.h),

                /// Withdraw Requests
                const WithdrawRequestsWidget(),

                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}