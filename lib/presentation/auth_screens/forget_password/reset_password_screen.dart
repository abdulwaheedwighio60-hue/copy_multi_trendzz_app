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
import 'package:multi_trendzz/core/widgets/custom_text_form_field_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController newPasswordController =
  TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;
  bool isLoading = false;

  String get newPassword => newPasswordController.text.trim();

  bool get hasMinLength => newPassword.length >= 8;

  bool get hasUpperAndLower {
    return RegExp(r'[A-Z]').hasMatch(newPassword) &&
        RegExp(r'[a-z]').hasMatch(newPassword);
  }

  bool get hasNumber {
    return RegExp(r'[0-9]').hasMatch(newPassword);
  }

  bool get hasSpecialCharacter {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(newPassword);
  }

  int get completedRules {
    int count = 0;

    if (hasMinLength) count++;
    if (hasUpperAndLower) count++;
    if (hasNumber) count++;
    if (hasSpecialCharacter) count++;

    return count;
  }

  double get passwordProgress {
    if (newPassword.isEmpty) return 0;

    return completedRules / 4;
  }

  Color get passwordProgressColor {
    if (completedRules <= 1) {
      return AppColors.error;
    }

    if (completedRules <= 3) {
      return AppColors.warning;
    }

    return AppColors.success;
  }

  String get passwordSecurityText {
    if (newPassword.isEmpty) {
      return 'Password security';
    }

    if (completedRules <= 1) {
      return 'Needs more security';
    }

    if (completedRules <= 3) {
      return 'Almost secure';
    }

    return 'Secure password';
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  String? validatePassword(String? value) {
    final String password = value?.trim() ?? '';

    if (password.isEmpty) {
      return 'Please enter new password';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!hasUpperAndLower || !hasNumber || !hasSpecialCharacter) {
      return 'Please complete all password requirements';
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    final String confirmPassword = value?.trim() ?? '';
    final String newPassword = newPasswordController.text.trim();

    if (confirmPassword.isEmpty) {
      return 'Please confirm password';
    }

    if (confirmPassword != newPassword) {
      return 'Password does not match';
    }

    return null;
  }
  //
  // Future<void> updatePassword() async {
  //   FocusScope.of(context).unfocus();
  //
  //   if (!(formKey.currentState?.validate() ?? false)) {
  //     return;
  //   }
  //
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   await Future.delayed(const Duration(seconds: 1));
  //
  //   if (!mounted) return;
  //
  //   setState(() {
  //     isLoading = false;
  //   });
  //
  //   ScaffoldMessenger.of(context)
  //     ..hideCurrentSnackBar()
  //     ..showSnackBar(
  //       SnackBar(
  //         content: const Text('Password updated successfully.'),
  //         backgroundColor: AppColors.primaryColor,
  //         behavior: SnackBarBehavior.floating,
  //       ),
  //     );
  //
  //   context.go(AppRoutes.loginScreen);
  // }
  Future<void> updatePassword() async {
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

    showPasswordUpdatedDialog();
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

                          _buildPasswordForm(),
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
            Iconsax.lock_1,
            color: AppColors.primaryColor,
            size: 42.sp,
          ),
        ),

        SizedBox(height: 24.h),

        Text(
          'Create New Password',
          textAlign: TextAlign.center,
          style: AppTextStyles.titleLarge.copyWith(
            color: AppColors.textPrimary,
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
          ),
        ),

        SizedBox(height: 10.h),

        Text(
          'Set a secure password to protect your account.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            fontSize: 14.sp,
            height: 1.45,
            fontWeight: FontWeight.w500,
          ),
        ),

        if (widget.email.trim().isNotEmpty) ...[
          SizedBox(height: 8.h),
          Text(
            widget.email,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primaryColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ],
    );
  }
  void showPasswordUpdatedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
          backgroundColor: AppColors.transparent,
          elevation: 0,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.14),
                  blurRadius: 30.r,
                  spreadRadius: -6.r,
                  offset: Offset(0, 16.h),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 5.h,
                  width: double.infinity,
                  color: AppColors.success,
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(
                    22.w,
                    26.h,
                    22.w,
                    22.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 86.w,
                        height: 86.w,
                        decoration: BoxDecoration(
                          color: AppColors.success.withOpacity(0.10),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            width: 62.w,
                            height: 62.w,
                            decoration: BoxDecoration(
                              color: AppColors.success.withOpacity(0.14),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Iconsax.tick_circle,
                              color: AppColors.success,
                              size: 38.sp,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 22.h),

                      Text(
                        'Password Updated',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.titleLarge.copyWith(
                          color: AppColors.textPrimary,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      Text(
                        'Your password has been changed successfully. Please sign in again using your new password.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 14.sp,
                          height: 1.45,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 18.h),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 13.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(14.r),
                          border: Border.all(
                            color: AppColors.primaryColor.withOpacity(0.14),
                            width: 1.w,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 34.w,
                              height: 34.w,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withOpacity(0.10),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Icon(
                                Iconsax.shield_tick,
                                color: AppColors.primaryColor,
                                size: 19.sp,
                              ),
                            ),

                            SizedBox(width: 10.w),

                            Expanded(
                              child: Text(
                                'For your security, you need to sign in again.',
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.textSecondary,
                                  fontSize: 12.5.sp,
                                  height: 1.35,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 24.h),

                      SizedBox(
                        width: double.infinity,
                        height: 52.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                            context.go(AppRoutes.loginScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: AppColors.white,
                            elevation: 0,
                            shadowColor: AppColors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                          ),
                          child: Text(
                            'Back to Sign In',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget _buildPasswordForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel('New Password'),

        SizedBox(height: 8.h),

        CustomTextFormFieldWidget(
          controller: newPasswordController,
          hintText: 'Enter new password',
          obscureText: obscureNewPassword,
          obscuringCharacter: '*',
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Iconsax.lock,
            color: AppColors.primaryColor,
            size: 20.sp,
          ),
          suffixIcon: IconButton(
            splashRadius: 22.r,
            onPressed: () {
              setState(() {
                obscureNewPassword = !obscureNewPassword;
              });
            },
            icon: Icon(
              obscureNewPassword ? Iconsax.eye_slash : Iconsax.eye,
              color: AppColors.textHint,
              size: 22.sp,
            ),
          ),
          validator: validatePassword,
          onChanged: (_) {
            setState(() {});
          },
        ),

        SizedBox(height: 12.h),

        _buildPasswordSecurityCard(),

        SizedBox(height: 18.h),

        _buildFieldLabel('Confirm Password'),

        SizedBox(height: 8.h),

        CustomTextFormFieldWidget(
          controller: confirmPasswordController,
          hintText: 'Confirm new password',
          obscureText: obscureConfirmPassword,
          obscuringCharacter: '*',
          textInputAction: TextInputAction.done,
          prefixIcon: Icon(
            Iconsax.lock,
            color: AppColors.primaryColor,
            size: 20.sp,
          ),
          suffixIcon: IconButton(
            splashRadius: 22.r,
            onPressed: () {
              setState(() {
                obscureConfirmPassword = !obscureConfirmPassword;
              });
            },
            icon: Icon(
              obscureConfirmPassword ? Iconsax.eye_slash : Iconsax.eye,
              color: AppColors.textHint,
              size: 22.sp,
            ),
          ),
          validator: validateConfirmPassword,
        ),

        SizedBox(height: 18.h),

        _buildPasswordHint(),
      ],
    );
  }

  Widget _buildFieldLabel(String text) {
    return Text(
      text,
      style: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.darkColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildPasswordSecurityCard() {
    if (newPassword.isEmpty) {
      return const SizedBox.shrink();
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: double.infinity,
      padding: EdgeInsets.all(14.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: passwordProgressColor.withOpacity(0.35),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34.w,
                height: 34.w,
                decoration: BoxDecoration(
                  color: passwordProgressColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  completedRules == 4
                      ? Iconsax.shield_tick
                      : Iconsax.shield_security,
                  color: passwordProgressColor,
                  size: 19.sp,
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: Text(
                  passwordSecurityText,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              Text(
                '$completedRules/4',
                style: AppTextStyles.bodySmall.copyWith(
                  color: passwordProgressColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: LinearProgressIndicator(
              value: passwordProgress,
              minHeight: 6.h,
              backgroundColor: AppColors.borderColor.withOpacity(0.65),
              valueColor: AlwaysStoppedAnimation<Color>(
                passwordProgressColor,
              ),
            ),
          ),

          SizedBox(height: 12.h),

          _buildRequirementRow(
            title: 'At least 8 characters',
            isCompleted: hasMinLength,
          ),

          SizedBox(height: 8.h),

          _buildRequirementRow(
            title: 'Uppercase and lowercase letters',
            isCompleted: hasUpperAndLower,
          ),

          SizedBox(height: 8.h),

          _buildRequirementRow(
            title: 'At least one number',
            isCompleted: hasNumber,
          ),

          SizedBox(height: 8.h),

          _buildRequirementRow(
            title: 'At least one special character',
            isCompleted: hasSpecialCharacter,
          ),
        ],
      ),
    );
  }

  Widget _buildRequirementRow({
    required String title,
    required bool isCompleted,
  }) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 19.w,
          height: 19.w,
          decoration: BoxDecoration(
            color: isCompleted
                ? AppColors.success
                : AppColors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: isCompleted
                  ? AppColors.success
                  : AppColors.borderColor,
              width: 1.2.w,
            ),
          ),
          child: isCompleted
              ? Icon(
            Icons.check,
            color: AppColors.white,
            size: 13.sp,
          )
              : null,
        ),

        SizedBox(width: 9.w),

        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodySmall.copyWith(
              color: isCompleted
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
              fontSize: 12.sp,
              fontWeight:
              isCompleted ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordHint() {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Iconsax.info_circle,
            color: AppColors.primaryColor,
            size: 22.sp,
          ),

          SizedBox(width: 10.w),

          Expanded(
            child: Text(
              'For better security, avoid using your name, phone number, or common passwords.',
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
    );
  }

  Widget _buildBottomButton() {
    return Padding(
      padding: EdgeInsets.only(bottom: 18.h),
      child: ElevatedButtonWidget(
        text: isLoading ? 'Updating...' : 'Update Password',
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
        onPressed: isLoading ? null : updatePassword,
      ),
    );
  }
}