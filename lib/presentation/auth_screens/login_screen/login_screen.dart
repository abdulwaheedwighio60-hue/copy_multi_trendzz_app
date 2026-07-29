import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/buyer_root_screen.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_images.dart';
import 'package:multi_trendzz/core/constants/app_texts.dart';
import 'package:multi_trendzz/core/provider/auth_provider.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/utils/app_validators.dart';
import 'package:multi_trendzz/core/widgets/app_snack_bar.dart';
import 'package:multi_trendzz/core/widgets/custom_elevated_button_widget.dart';
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';
import 'package:multi_trendzz/core/widgets/social_icon_button_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscureText = true;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _onSignInPressed() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    // TODO: Navigate or call login API here

    try {
      final authProvider = context.read<AuthProvider>();

      // Create Account
      await authProvider.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // // Send OTP to Email
      // final otpResult = await authProvider.sendOtp(
      //   email: emailController.text.trim(),
      // );
      //
      // if (otpResult != null) {
      //   throw otpResult;
      // }

      if (!mounted) return;

      AppSnackBar.show(
        context: context,
        type: AppSnackBarType.success,
        message: "Login Successful................!",
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RootScreen()));
    } catch (e) {
      if (!mounted) return;

      AppSnackBar.show(
        context: context,
        type: AppSnackBarType.error,
        message: e.toString(),
      );
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
          AppStrings.signIn,
          textAlign: TextAlign.center,
          style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 12.h),

        Text(
          AppStrings.loginText,
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
        _buildFieldLabel(AppStrings.email),

        SizedBox(height: 5.h),

        CustomTextFormFieldWidget(
          controller: emailController,
          hintText: 'example@gmail.com',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: AppValidators.validateEmail,
        ),

        SizedBox(height: 15.h),

        _buildFieldLabel(AppStrings.password),

        SizedBox(height: 5.h),

        CustomTextFormFieldWidget(
          controller: passwordController,
          hintText: 'Password',
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

        _buildForgetPassword(),

        SizedBox(height: 25.h),

        ElevatedButtonWidget(
          text: isLoading ? 'Please wait...' : AppStrings.signIn,
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

  Widget _buildForgetPassword() {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          // TODO: Navigate to forgot password screen
          context.go(AppRoutes.verifyEmailScreen);
        },
        borderRadius: BorderRadius.circular(6.r),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppStrings.forgetPassword,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 1.5.h),

              Container(
                height: 1.h,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
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
          AppStrings.dontHaveAnAccount,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 14.sp,
          ),
        ),

        SizedBox(width: 4.w),

        InkWell(
          onTap: () {
            // TODO: Navigate to signup screen
            context.go(AppRoutes.signUpScreen);
          },
          child: Text(
            AppStrings.signUp,
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