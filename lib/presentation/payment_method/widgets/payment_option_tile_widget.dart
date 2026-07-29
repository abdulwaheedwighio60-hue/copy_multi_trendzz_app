import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/model/payment_option_model.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/presentation/payment_method/widgets/radio_indicator_widget.dart';

class PaymentOptionTileWidget extends StatelessWidget {
  const PaymentOptionTileWidget({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  final PaymentOptionModel option;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isAction = option.type == PaymentType.action;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 14.h,
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: option.imagePath == null
                    ? (option.iconBackgroundColor ??
                    AppColors.primaryColor.withOpacity(0.12))
                    : Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: option.imagePath != null
                  ? Padding(
                padding: EdgeInsets.all(4.w),
                child: Image.asset(
                  option.imagePath!,
                  fit: BoxFit.contain,
                ),
              )
                  : Icon(
                option.icon,
                color: option.iconColor ?? AppColors.primaryColor,
                size: 20.sp,
              ),
            ),

            SizedBox(width: 14.w),

            Expanded(
              child: Text(
                option.title,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            if (isAction)
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.primaryColor,
                size: 18.sp,
              )
            else
              RadioIndicator(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}
