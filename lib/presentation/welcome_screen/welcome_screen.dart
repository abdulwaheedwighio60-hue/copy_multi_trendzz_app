import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_texts.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_elevated_button_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<void> _onContinuePressed() async {
    await Future.delayed(const Duration(seconds: 2));

    // TODO: Navigate to next screen
    // Navigator.pushReplacementNamed(context, Routes.signUp);
    context.go(AppRoutes.onboardingScreen);
  }

  void _onSignInPressed() {
    // TODO: Navigate to sign in screen
    // Navigator.pushNamed(context, Routes.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightColor,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/get_started_image.png',
                fit: BoxFit.cover,
              ),
            ),

            /// Soft bottom gradient for better readability
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.lightColor.withOpacity(0.05),
                      AppColors.lightColor.withOpacity(0.10),
                      AppColors.lightColor.withOpacity(0.85),
                      AppColors.lightColor,
                    ],
                    stops: const [0.0, 0.45, 0.72, 1.0],
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                top: false,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(24.w, 26.h, 24.w, 18.h),
                  decoration: BoxDecoration(
                    color: AppColors.lightColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(34.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.08),
                        blurRadius: 35,
                        spreadRadius: 4,
                        offset: const Offset(0, -12),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 44.w,
                        height: 4.h,
                        margin: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                          color: AppColors.darkColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),

                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppStrings.yourShoppingText,
                              style: AppTextStyles.headlineLarge.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w800,
                                height: 1.15,
                              ),
                            ),
                            TextSpan(
                              text: '${AppStrings.destinationText}\n',
                              style: AppTextStyles.headlineLarge.copyWith(
                                color: AppColors.darkColor,
                                fontWeight: FontWeight.w800,
                                height: 1.15,
                              ),
                            ),
                            TextSpan(
                              text: '${AppStrings.forEverythingText}',
                              style: AppTextStyles.headlineLarge.copyWith(
                                color: AppColors.darkColor,
                                fontWeight: FontWeight.w800,
                                height: 1.15,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 14.h),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Text(
                          '${AppStrings.welcomeDescription}',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.darkColor.withOpacity(0.70),
                            fontSize: 13.5.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.45,
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      ElevatedButtonWidget(
                        text: 'Continue',
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
                        onPressed: _onContinuePressed,
                      ),

                      SizedBox(height: 18.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              AppStrings.alreadyHaveAccount,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.black.withOpacity(0.75),
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _onSignInPressed,
                            child: Text(
                              AppStrings.signIn,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.primaryColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}