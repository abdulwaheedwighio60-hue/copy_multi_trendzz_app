import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/model/coupon_model.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/app_snack_bar.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/coupon/widgets/coupon_ticket_widget.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  final List<CouponModel> coupons = [
    CouponModel(
      code: 'WELCOME200',
      description: 'Get 50% OFF',
      unlockText: 'Add items worth \$2 more to unlock',
      discountType: CouponDiscountType.percentage,
      discountValue: 50,
      minimumOrderAmount: 2,
    ),
    CouponModel(
      code: 'CASHBACK12',
      description: 'Up to \$12.00 cashback',
      unlockText: 'Add items worth \$2 more to unlock',
      discountType: CouponDiscountType.cashback,
      discountValue: 12,
      minimumOrderAmount: 2,
    ),
    CouponModel(
      code: 'FEST20COST',
      description: 'Get 50% OFF for Combo',
      unlockText: 'Add items worth \$28 more to unlock',
      discountType: CouponDiscountType.percentage,
      discountValue: 50,
      minimumOrderAmount: 28,
    ),
    CouponModel(
      code: 'WELCOME200',
      description: 'Get 50% OFF',
      unlockText: 'Add items worth \$2 more to unlock',
      discountType: CouponDiscountType.percentage,
      discountValue: 50,
      minimumOrderAmount: 2,
    ),
  ];

  void copyCouponCode(CouponModel coupon) {
    Clipboard.setData(
      ClipboardData(text: coupon.code),
    );

    AppSnackBar.show(
      context: context,
      type: AppSnackBarType.success,
      title: 'Coupon Copied',
      message: '${coupon.code} has been copied. Apply it at checkout.',
    );
  }

  void selectCoupon(CouponModel coupon) {
    context.pop(coupon);
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
            'Coupon',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontSize: 17.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        body: SafeArea(
          top: false,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(
              20.w,
              14.h,
              20.w,
              28.h,
            ),
            itemCount: coupons.length + 1,
            separatorBuilder: (context, index) {
              return SizedBox(height: 12.h);
            },
            itemBuilder: (context, index) {
              if (index == 0) {
                return Text(
                  'Best offers for you',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                  ),
                );
              }

              final CouponModel coupon = coupons[index - 1];

              return CouponTicketWidget(
                coupon: coupon,
                onCopy: () => copyCouponCode(coupon),
                onTap: () => selectCoupon(coupon),
              );
            },
          ),
        ),
      ),
    );
  }
}