import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';


class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {

  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _currentPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;

  bool _twoFactorAuthentication = false;
  bool _loginAlerts = true;
  bool _biometricLogin = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(

      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),

      child: Scaffold(

        backgroundColor: const Color(0xffF5F6FA),

        appBar: AppBar(

          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,

          title: const Text(
            "Security",
          ),

        ),

        body: SingleChildScrollView(

          padding: EdgeInsets.all(20.w),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                "Change Password",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 18.h),

              _passwordField(
                controller: _currentPasswordController,
                label: "Current Password",
                visible: _currentPasswordVisible,
                onToggle: () {
                  setState(() {
                    _currentPasswordVisible =
                    !_currentPasswordVisible;
                  });
                },
              ),

              SizedBox(height: 18.h),

              _passwordField(
                controller: _newPasswordController,
                label: "New Password",
                visible: _newPasswordVisible,
                onToggle: () {
                  setState(() {
                    _newPasswordVisible =
                    !_newPasswordVisible;
                  });
                },
              ),

              SizedBox(height: 18.h),

              _passwordField(
                controller: _confirmPasswordController,
                label: "Confirm Password",
                visible: _confirmPasswordVisible,
                onToggle: () {
                  setState(() {
                    _confirmPasswordVisible =
                    !_confirmPasswordVisible;
                  });
                },
              ),

              SizedBox(height: 30.h),

              Text(
                "Security Options",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 15.h),

              _switchTile(
                title: "Two-Factor Authentication",
                subtitle:
                "Add extra protection to your account",
                icon: Iconsax.security_safe,
                value: _twoFactorAuthentication,
                onChanged: (value) {
                  setState(() {
                    _twoFactorAuthentication = value;
                  });
                },
              ),

              SizedBox(height: 12.h),

              _switchTile(
                title: "Login Alerts",
                subtitle:
                "Receive alerts for every login",
                icon: Iconsax.notification,
                value: _loginAlerts,
                onChanged: (value) {
                  setState(() {
                    _loginAlerts = value;
                  });
                },
              ),

              SizedBox(height: 12.h),

              _switchTile(
                title: "Biometric Login",
                subtitle:
                "Use fingerprint or Face ID",
                icon: Iconsax.finger_cricle,
                value: _biometricLogin,
                onChanged: (value) {
                  setState(() {
                    _biometricLogin = value;
                  });
                },
              ),

              SizedBox(height: 35.h),

              SizedBox(

                width: double.infinity,
                height: 55.h,

                child: ElevatedButton.icon(

                  onPressed: () {

                    ScaffoldMessenger.of(context)
                        .showSnackBar(

                      const SnackBar(

                        content: Text(
                          "Security Settings Updated Successfully",
                        ),

                      ),

                    );

                  },

                  style: ElevatedButton.styleFrom(

                    backgroundColor:
                    AppColors.primaryColor,

                    shape: RoundedRectangleBorder(

                      borderRadius:
                      BorderRadius.circular(14.r),

                    ),

                  ),

                  icon: const Icon(
                    Iconsax.lock,
                    color: Colors.white,
                  ),

                  label: Text(

                    "Update Security",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),

                  ),

                ),

              ),

              SizedBox(height: 30.h),

            ],

          ),

        ),

      ),

    );

  }

  Widget _passwordField({

    required TextEditingController controller,
    required String label,
    required bool visible,
    required VoidCallback onToggle,

  }) {

    return TextFormField(

      controller: controller,

      obscureText: !visible,

      decoration: InputDecoration(

        labelText: label,

        prefixIcon: const Icon(Iconsax.lock),

        suffixIcon: IconButton(

          icon: Icon(

            visible
                ? Iconsax.eye
                : Iconsax.eye_slash,

          ),

          onPressed: onToggle,

        ),

        filled: true,

        fillColor: Colors.white,

        border: OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(14.r),

          borderSide: BorderSide.none,

        ),

      ),

    );

  }

  Widget _switchTile({

    required String title,
    required String subtitle,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,

  }) {

    return Container(

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
        BorderRadius.circular(14.r),

      ),

      child: SwitchListTile(

        value: value,

        onChanged: onChanged,

        activeColor: AppColors.primaryColor,

        secondary: Icon(icon),

        title: Text(title),

        subtitle: Text(subtitle),

      ),

    );

  }

}