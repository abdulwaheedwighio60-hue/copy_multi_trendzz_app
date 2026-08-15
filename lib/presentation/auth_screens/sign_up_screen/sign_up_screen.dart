import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_images.dart';
import 'package:multi_trendzz/core/constants/app_texts.dart';
import 'package:multi_trendzz/core/enums/user_role.dart';
import 'package:multi_trendzz/core/provider/auth_provider.dart' show AuthProvider;
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/utils/app_validators.dart';
import 'package:multi_trendzz/core/widgets/app_snack_bar.dart';
import 'package:multi_trendzz/core/widgets/custom_elevated_button_widget.dart';
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';
import 'package:multi_trendzz/core/widgets/social_icon_button_widget.dart';
import 'package:multi_trendzz/presentation/auth_screens/sign_up_screen/verify_email_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscureText = true;
  bool isLoading = false;
  bool isTermsAccepted = false;
  UserRole selectedRole = UserRole.buyer;


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _onSignInPressed() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!isTermsAccepted) {
      AppSnackBar.show(
        context: context,
        type: AppSnackBarType.warning,
        message: "Please accept the Terms & Conditions to continue.",
      );
      return;
    }

    try {
      final authProvider = context.read<AuthProvider>();

      // Create Account
      await authProvider.signUp(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Send OTP to Email
      final otpResult = await authProvider.sendOtp(
        email: emailController.text.trim(),
      );

      if (otpResult != null) {
        throw otpResult;
      }

      if (!mounted) return;

      AppSnackBar.show(
        context: context,
        type: AppSnackBarType.success,
        message: "Account created successfully. OTP has been sent to your email.",
      );

      // context.go(
      //   AppRoutes.verifyEmailOTPScreen,
      //   extra: emailController.text.trim(),
      // );

      Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyEmailOtpScreen(email: emailController.text.trim())));

    } catch (e) {
      if (!mounted) return;

      AppSnackBar.show(
        context: context,
        type: AppSnackBarType.error,
        message: e.toString(),
      );

      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(),

                    SizedBox(height: 26.h),

                    _buildLoginForm(),

                    SizedBox(height: 30.h),

                    _buildDivider(),

                    SizedBox(height: 30.h),

                    _buildSocialButtons(),

                    SizedBox(height: 30.h),

                    _buildSignUpText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          AppStrings.createAccount,
          textAlign: TextAlign.center,
          style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 12.h),

        Text(
          AppStrings.signUpText,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        _buildFieldLabel(AppStrings.name),

        SizedBox(height: 5.h),

        CustomTextFormFieldWidget(
          controller: nameController,
          hintText: AppStrings.fullName,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
        ),

        SizedBox(height: 15.h),

        _buildFieldLabel(AppStrings.email),

        SizedBox(height: 5.h),

        CustomTextFormFieldWidget(
          controller: emailController,
          hintText: AppStrings.hintEmailString,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: AppValidators.validateEmail,
        ),

        SizedBox(height: 15.h),

        _buildFieldLabel(AppStrings.password),

        SizedBox(height: 5.h),

        CustomTextFormFieldWidget(
          controller: passwordController,
          hintText: AppStrings.hintPasswordString,
          obscureText: obscureText,
          obscuringCharacter: '*',
          textInputAction: TextInputAction.done,
          suffixIcon: IconButton(
            splashRadius: 22.r,
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText ? Iconsax.eye_slash : Iconsax.eye,
              color: AppColors.textHint,
              size: 22.sp,
            ),
          ),
          validator: AppValidators.validatePassword,
        ),


        SizedBox(height: 13.h),

        _buildTermsAndCondition(),

        SizedBox(height: 25.h),
        Text(
          'Account Type',
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.darkColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: 8.h),

        Row(
          children: [
            Expanded(
              child: RadioListTile<UserRole>(
                contentPadding: EdgeInsets.zero,
                title: const Text('Buyer'),
                value: UserRole.buyer,
                groupValue: selectedRole,
                onChanged: (value) {
                  setState(() {
                    selectedRole = value!;
                  });
                },
              ),
            ),

            Expanded(
              child: RadioListTile<UserRole>(
                contentPadding: EdgeInsets.zero,
                title: const Text('Seller'),
                value: UserRole.seller,
                groupValue: selectedRole,
                onChanged: (value) {
                  setState(() {
                    selectedRole = value!;
                  });
                },
              ),
            ),
          ],
        ),
        ElevatedButtonWidget(
          text: isLoading ? 'Please wait...' : AppStrings.signUp,
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
          onPressed: isLoading ? null : _onSignInPressed,
        ),
      ],
    );
  }

  Widget _buildFieldLabel(String text) {
    return Text(
      text,
      style: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.darkColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTermsAndCondition() {
    return InkWell(
      onTap: () {
        setState(() {
          isTermsAccepted = !isTermsAccepted;
        });
      },
      borderRadius: BorderRadius.circular(8.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 22.w,
            height: 22.w,
            child: Checkbox(
              value: isTermsAccepted,
              activeColor: AppColors.primaryColor,
              checkColor: AppColors.white,
              side: BorderSide(
                color: AppColors.greyColor.withValues(alpha: 0.50),
                width: 1.2.w,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              onChanged: (bool? value) {
                setState(() {
                  isTermsAccepted = value ?? false;
                });
              },
            ),
          ),

          SizedBox(width: 8.w),

          Expanded(
            child: RichText(
              text: TextSpan(
                text: 'I agree to the ',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.greyColor.withValues(alpha: 0.40),
          ),
        ),

        SizedBox(width: 10.w),

        Text(
          AppStrings.orSignInWith,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textHint,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(width: 10.w),

        Expanded(
          child: Divider(
            color: AppColors.greyColor.withValues(alpha: 0.40),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIconButtonWidget(
          imagePath: AppImages.appleLogo,
          onTap: () {},
        ),

        SizedBox(width: 16.w),

        SocialIconButtonWidget(
          imagePath: AppImages.googleLogo,
          onTap: () {},
        ),

        SizedBox(width: 16.w),

        SocialIconButtonWidget(
          imagePath: AppImages.facebookLogo,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSignUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.alreadyHaveAccount,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 14.sp,
          ),
        ),

        SizedBox(width: 4.w),

        InkWell(
          onTap: () {
            // TODO: Navigate to signup screen
            context.go(AppRoutes.loginScreen);
          },
          child: Text(
            AppStrings.signIn,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.primaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}