import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/app_snack_bar.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';
import 'package:multi_trendzz/core/widgets/custom_elevated_button_widget.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final List<TextEditingController> otpControllers =
  List.generate(4, (_) => TextEditingController());

  final List<FocusNode> focusNodes =
  List.generate(4, (_) => FocusNode());

  bool isLoading = false;
  int remainingSeconds = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();

    for (final TextEditingController controller in otpControllers) {
      controller.dispose();
    }

    for (final FocusNode focusNode in focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  String get otpCode {
    return otpControllers.map((controller) {
      return controller.text.trim();
    }).join();
  }

  String get maskedEmail {
    final String email = widget.email.trim();

    if (!email.contains('@')) {
      return email;
    }

    final List<String> parts = email.split('@');
    final String name = parts.first;
    final String domain = parts.last;

    if (name.length <= 2) {
      return '$name@$domain';
    }

    return '${name.substring(0, 2)}****@$domain';
  }

  void startTimer() {
    timer?.cancel();

    setState(() {
      remainingSeconds = 60;
    });

    timer = Timer.periodic(
      const Duration(seconds: 1),
          (Timer timer) {
        if (remainingSeconds <= 0) {
          timer.cancel();
          return;
        }

        setState(() {
          remainingSeconds--;
        });
      },
    );
  }

  Future<void> verifyOtp() async {
    FocusScope.of(context).unfocus();

    if (otpCode.length != 4) {
      AppSnackBar.show(
        context: context,
        type: AppSnackBarType.warning,
        title: 'OTP Required',
        message: 'Please enter the complete verification code.',
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    AppSnackBar.show(
      context: context,
      type: AppSnackBarType.success,
      title: 'OTP Verified',
      message: 'Your verification code has been verified successfully.',
    );

    await Future.delayed(const Duration(milliseconds: 900));

    if (!mounted) return;

    context.push(
      AppRoutes.resetPasswordScreen,
      extra: widget.email,
    );
  }

  Future<void> resendOtp() async {
    if (remainingSeconds > 0) {
      return;
    }

    for (final TextEditingController controller in otpControllers) {
      controller.clear();
    }

    FocusScope.of(context).requestFocus(focusNodes.first);

    startTimer();

    showMessage('OTP has been sent again.');
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.primaryColor,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  void onOtpChanged({
    required String value,
    required int index,
  }) {
    if (value.isNotEmpty && index < otpControllers.length - 1) {
      focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardOpen =
        MediaQuery.of(context).viewInsets.bottom > 0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightColor,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: AppColors.lightColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
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
        ),
        body: SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.manual,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                      top: 35.h,
                      bottom: isKeyboardOpen ? 24.h : 120.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildHeader(),

                        SizedBox(height: 34.h),

                        _buildOtpBoxes(),

                        SizedBox(height: 24.h),

                        _buildResendOtp(),
                      ],
                    ),
                  ),
                ),

                if (!isKeyboardOpen) _buildBottomButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 92.w,
          height: 92.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.10),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Iconsax.shield_tick,
            color: AppColors.primaryColor,
            size: 42.sp,
          ),
        ),

        SizedBox(height: 24.h),

        Text(
          'Enter Verification Code',
          textAlign: TextAlign.center,
          style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
          ),
        ),

        SizedBox(height: 10.h),

        Text(
          'We have sent a 4-digit verification code to',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            fontSize: 14.sp,
            height: 1.45,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: 4.h),

        Text(
          maskedEmail,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.primaryColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildOtpBoxes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        4,
            (int index) {
          return SizedBox(
            width: 68.w,
            height: 64.h,
            child: TextFormField(
              controller: otpControllers[index],
              focusNode: focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              textInputAction: index == 3
                  ? TextInputAction.done
                  : TextInputAction.next,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1),
              ],
              cursorColor: AppColors.primaryColor,
              style: AppTextStyles.titleLarge.copyWith(
                color: AppColors.textPrimary,
                fontSize: 22.sp,
                fontWeight: FontWeight.w800,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                counterText: '',
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                    width: 1.w,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                    width: 1.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 1.4.w,
                  ),
                ),
              ),
              onChanged: (String value) {
                onOtpChanged(
                  value: value,
                  index: index,
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildResendOtp() {
    final bool canResend = remainingSeconds == 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          canResend
              ? 'Didn’t receive the code? '
              : 'Resend code in ',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

        InkWell(
          onTap: canResend ? resendOtp : null,
          child: Text(
            canResend
                ? 'Resend'
                : '${remainingSeconds}s',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
              decoration: canResend
                  ? TextDecoration.underline
                  : TextDecoration.none,
              decorationColor: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 18.h),
      child: ElevatedButtonWidget(
        text: isLoading ? 'Verifying...' : 'Verify OTP',
        expand: true,
        height: 54.h,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.lightColor,
        borderRadius: 100.r,
        textStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.lightColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        onPressed: isLoading ? null : verifyOtp,
      ),
    );
  }
}