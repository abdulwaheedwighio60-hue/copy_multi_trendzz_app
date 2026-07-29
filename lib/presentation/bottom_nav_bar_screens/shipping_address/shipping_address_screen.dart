import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() =>
      _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  int selectedAddressIndex = 0;

  final List<ShippingAddressModel> addresses = [
    ShippingAddressModel(
      title: 'Home',
      address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
    ),
    ShippingAddressModel(
      title: 'Office',
      address: '4517 Washington Ave. Manchester, Kentucky 39495',
    ),
    ShippingAddressModel(
      title: 'Parent’s House',
      address: '8502 Preston Rd. Inglewood, Maine 98380',
    ),
    ShippingAddressModel(
      title: 'Friend’s House',
      address: '2464 Royal Ln. Mesa, New Jersey 45463',
    ),
  ];

  void selectAddress(int index) {
    setState(() {
      selectedAddressIndex = index;
    });
  }

  void addNewAddress() {
    debugPrint('Add New Shipping Address clicked');

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: const Text('Add new address screen will open here.'),
          backgroundColor: AppColors.primaryColor,
          behavior: SnackBarBehavior.floating,
        ),
      );

    // TODO: Navigate to add address screen
    context.push(AppRoutes.addNewShippingAddress);
  }

  void applyAddress() {
    final ShippingAddressModel selectedAddress =
    addresses[selectedAddressIndex];

    debugPrint('SELECTED ADDRESS: ${selectedAddress.title}');
    debugPrint('ADDRESS DETAIL: ${selectedAddress.address}');

    context.pop(selectedAddress);

    // Agar pop data pass nahi karna, sirf back jana ho:
    // context.pop();
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
                if (Navigator.canPop(context)) {
                  context.pop();
                }
              },
            ),
          ),
          title: Text(
            'Shipping Address',
            style: AppTextStyles.bodyLarge.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  24.w,
                  16.h,
                  24.w,
                  120.h,
                ),
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: addresses.length,
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 18.h),
                          child: Divider(
                            color: AppColors.dividerColor,
                            thickness: 1.h,
                          ),
                        );
                      },
                      itemBuilder: (context, index) {
                        final ShippingAddressModel address =
                        addresses[index];

                        return ShippingAddressTileWidget(
                          address: address,
                          isSelected: selectedAddressIndex == index,
                          onTap: () => selectAddress(index),
                        );
                      },
                    ),

                    SizedBox(height: 26.h),

                    _buildAddNewAddressButton(),
                  ],
                ),
              ),
            ),

            _buildBottomApplyButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddNewAddressButton() {
    return InkWell(
      onTap: addNewAddress,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: double.infinity,
        height: 58.h,
        decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.65),
            width: 1.2.w,
            style: BorderStyle.solid,
          ),
        ),
        child: CustomPaint(
          painter: DashedBorderPainter(
            color: AppColors.primaryColor.withOpacity(0.65),
            radius: 12.r,
            strokeWidth: 1.2.w,
            dashWidth: 6.w,
            dashGap: 4.w,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.primaryColor,
                  size: 18.sp,
                ),
                SizedBox(width: 6.w),
                Text(
                  'Add New Shipping Address',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomApplyButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        24.w,
        12.h,
        24.w,
        24.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.r),
          topRight: Radius.circular(18.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 20.r,
            offset: Offset(0, -8.h),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: applyAddress,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            child: Text(
              'Apply',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShippingAddressTileWidget extends StatelessWidget {
  const ShippingAddressTileWidget({
    super.key,
    required this.address,
    required this.isSelected,
    required this.onTap,
  });

  final ShippingAddressModel address;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.textSecondary.withOpacity(0.45),
                  width: 1.2.w,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.location_on,
                  color: AppColors.primaryColor,
                  size: 15.sp,
                ),
              ),
            ),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.title,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    address.address,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 13.sp,
                      height: 1.25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 12.w),

            _AddressRadioIndicator(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}

class _AddressRadioIndicator extends StatelessWidget {
  const _AddressRadioIndicator({
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      width: 24.w,
      height: 24.w,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.primaryColor.withOpacity(0.85),
          width: 2.w,
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.transparent,
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  DashedBorderPainter({
    required this.color,
    required this.radius,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashGap,
  });

  final Color color;
  final double radius;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final RRect rRect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );

    final Path path = Path()..addRRect(rRect);

    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0;

      while (distance < metric.length) {
        final double nextDistance = distance + dashWidth;

        canvas.drawPath(
          metric.extractPath(distance, nextDistance),
          paint,
        );

        distance = nextDistance + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedBorderPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.radius != radius ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashGap != dashGap;
  }
}

class ShippingAddressModel {
  ShippingAddressModel({
    required this.title,
    required this.address,
  });

  final String title;
  final String address;
}