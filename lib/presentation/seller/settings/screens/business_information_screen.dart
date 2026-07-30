import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';


class BusinessInformationScreen extends StatefulWidget {
  const BusinessInformationScreen({super.key});

  @override
  State<BusinessInformationScreen> createState() =>
      _BusinessInformationScreenState();
}

class _BusinessInformationScreenState
    extends State<BusinessInformationScreen> {

  final businessNameController = TextEditingController(
    text: "Waheed Store",
  );

  final ownerNameController = TextEditingController(
    text: "Abdul Waheed",
  );

  final businessTypeController = TextEditingController(
    text: "Retail Store",
  );

  final registrationController = TextEditingController(
    text: "REG-2026-1001",
  );

  final taxController = TextEditingController(
    text: "TX-445566",
  );

  final websiteController = TextEditingController(
    text: "www.waheedstore.com",
  );

  final emailController = TextEditingController(
    text: "info@waheedstore.com",
  );

  final phoneController = TextEditingController(
    text: "+92 300 1234567",
  );

  final addressController = TextEditingController(
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
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          title: const Text("Business Information"),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [

              _field(
                "Business Name",
                Iconsax.shop,
                businessNameController,
              ),

              SizedBox(height: 16.h),

              _field(
                "Owner Name",
                Iconsax.user,
                ownerNameController,
              ),

              SizedBox(height: 16.h),

              _field(
                "Business Type",
                Iconsax.building,
                businessTypeController,
              ),

              SizedBox(height: 16.h),

              _field(
                "Registration Number",
                Iconsax.document,
                registrationController,
              ),

              SizedBox(height: 16.h),

              _field(
                "Tax ID",
                Iconsax.receipt_item,
                taxController,
              ),

              SizedBox(height: 16.h),

              _field(
                "Website",
                Iconsax.global,
                websiteController,
              ),

              SizedBox(height: 16.h),

              _field(
                "Business Email",
                Iconsax.sms,
                emailController,
              ),

              SizedBox(height: 16.h),

              _field(
                "Business Phone",
                Iconsax.call,
                phoneController,
              ),

              SizedBox(height: 16.h),

              _field(
                "Business Address",
                Iconsax.location,
                addressController,
                maxLines: 3,
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
                          "Business Information Updated",
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
                    "Save Changes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25.h),

            ],
          ),
        ),
      ),
    );
  }

  Widget _field(
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
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}