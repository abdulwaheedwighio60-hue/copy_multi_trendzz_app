import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/model/payment_option_model.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/presentation/payment_method/widgets/payment_option_tile_widget.dart';

class PaymentSectionWidget extends StatelessWidget {
  const PaymentSectionWidget({
    super.key,
    required this.title,
    required this.options,
    required this.selectedPaymentMethod,
    required this.onSelect,
    required this.onActionTap,
  });

  final String title;
  final List<PaymentOptionModel> options;
  final String selectedPaymentMethod;
  final ValueChanged<String> onSelect;
  final VoidCallback onActionTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 17.sp,
            fontWeight: FontWeight.w800,
          ),
        ),

        SizedBox(height: 12.h),

        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: AppColors.borderColor.withOpacity(0.55),
              width: 1.w,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.025),
                blurRadius: 12.r,
                offset: Offset(0, 5.h),
              ),
            ],
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: options.length,
            separatorBuilder: (context, index) {
              return Divider(
                height: 1.h,
                thickness: 1.h,
                color: AppColors.dividerColor,
                indent: 52.w,
              );
            },
            itemBuilder: (context, index) {
              final PaymentOptionModel option = options[index];

              return PaymentOptionTileWidget(
                option: option,
                isSelected: selectedPaymentMethod == option.title,
                onTap: () {
                  if (option.type == PaymentType.action) {
                    onActionTap();
                    return;
                  }

                  onSelect(option.title);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
