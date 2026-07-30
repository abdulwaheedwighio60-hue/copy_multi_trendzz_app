import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';


class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({super.key});

  @override
  State<SellerProfileScreen> createState() =>
      _SellerProfileScreenState();
}

class _SellerProfileScreenState
    extends State<SellerProfileScreen> {

  final TextEditingController fullNameController =
  TextEditingController(
    text: "Abdul Waheed",
  );

  final TextEditingController emailController =
  TextEditingController(
    text: "abdulwaheed@gmail.com",
  );

  final TextEditingController phoneController =
  TextEditingController(
    text: "+92 300 1234567",
  );

  final TextEditingController storeController =
  TextEditingController(
    text: "Waheed Store",
  );

  final TextEditingController bioController =
  TextEditingController(
    text:
    "Professional Seller on Social Stream Marketplace.",
  );

  final TextEditingController addressController =
  TextEditingController(
    text: "Karachi, Pakistan",
  );

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
          title: const Text("Seller Profile"),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [

              /// Profile Image
              Stack(
                children: [

                  CircleAvatar(
                    radius: 55.r,
                    backgroundImage: const NetworkImage(
                      "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=500",
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18.r,
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Iconsax.camera,
                        color: Colors.white,
                        size: 18.sp,
                      ),
                    ),
                  ),

                ],
              ),

              SizedBox(height: 30.h),

              _textField(
                "Full Name",
                Iconsax.user,
                fullNameController,
              ),

              SizedBox(height: 18.h),

              _textField(
                "Email",
                Iconsax.sms,
                emailController,
              ),

              SizedBox(height: 18.h),

              _textField(
                "Phone Number",
                Iconsax.call,
                phoneController,
              ),

              SizedBox(height: 18.h),

              _textField(
                "Store Name",
                Iconsax.shop,
                storeController,
              ),

              SizedBox(height: 18.h),

              _textField(
                "Bio",
                Iconsax.document_text,
                bioController,
                maxLines: 3,
              ),

              SizedBox(height: 18.h),

              _textField(
                "Address",
                Iconsax.location,
                addressController,
                maxLines: 2,
              ),

              SizedBox(height: 30.h),

              SizedBox(
                width: double.infinity,
                height: 55.h,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Profile Updated Successfully",
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
                    Iconsax.tick_circle,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Update Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(
      String label,
      IconData icon,
      TextEditingController controller, {
        int maxLines = 1,
      }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
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
}