import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/utils/app_validators.dart';
import 'package:multi_trendzz/core/widgets/app_snack_bar.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';
import 'package:multi_trendzz/core/widgets/custom_elevated_button_widget.dart';
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> sendOtp() async {
    FocusScope.of(context).unfocus();

    if (!(formKey.currentState?.validate() ?? false)) {
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
      type: AppSnackBarType.info,
      title: 'OTP Sent',
      message: 'Verification code has been sent to your email.',
    );
    context.push(
      AppRoutes.verifyOtpScreen,
      extra: emailController.text.trim(),
    );

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
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildHeader(),

                          SizedBox(height: 34.h),

                          _buildEmailForm(),
                        ],
                      ),
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
            Iconsax.sms,
            color: AppColors.primaryColor,
            size: 42.sp,
          ),
        ),

        SizedBox(height: 24.h),

        Text(
          'Verify Your Email',
          textAlign: TextAlign.center,
          style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
          ),
        ),

        SizedBox(height: 10.h),

        Text(
          'Enter your registered email address. We will send you a verification code to reset your password.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            fontSize: 14.sp,
            height: 1.45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.darkColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 8.h),

        CustomTextFormFieldWidget(
          controller: emailController,
          hintText: 'example@gmail.com',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          prefixIcon: Icon(
            Iconsax.sms,
            color: AppColors.primaryColor,
            size: 20.sp,
          ),
          validator: AppValidators.validateEmail,
        ),

        SizedBox(height: 18.h),

        Container(
          width: double.infinity,
          padding: EdgeInsets.all(14.sp),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: AppColors.primaryColor.withOpacity(0.18),
              width: 1.w,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.info_circle,
                color: AppColors.primaryColor,
                size: 22.sp,
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: Text(
                  'Please use the email linked with your account.',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 13.sp,
                    height: 1.35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 18.h),
      child: ElevatedButtonWidget(
        text: isLoading ? 'Sending OTP...' : 'Continue',
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
        onPressed: isLoading ? null : sendOtp,
      ),
    );
  }
}