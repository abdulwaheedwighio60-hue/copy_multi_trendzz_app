import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';


class BankAccountScreen extends StatefulWidget {
  const BankAccountScreen({super.key});

  @override
  State<BankAccountScreen> createState() => _BankAccountScreenState();
}

class _BankAccountScreenState extends State<BankAccountScreen> {

  final bankNameController = TextEditingController(
    text: "Habib Bank Limited",
  );

  final accountHolderController = TextEditingController(
    text: "Abdul Waheed",
  );

  final accountNumberController = TextEditingController(
    text: "28654123654789",
  );

  final ibanController = TextEditingController(
    text: "PK36HABB0001234567890123",
  );

  final swiftController = TextEditingController(
    text: "HABBPKKA",
  );

  final branchController = TextEditingController(
    text: "Karachi Main Branch",
  );

  bool defaultPayout = true;

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
          title: const Text("Bank Account"),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [

              _buildField(
                "Bank Name",
                Iconsax.bank,
                bankNameController,
              ),

              SizedBox(height: 16.h),

              _buildField(
                "Account Holder Name",
                Iconsax.user,
                accountHolderController,
              ),

              SizedBox(height: 16.h),

              _buildField(
                "Account Number",
                Iconsax.card,
                accountNumberController,
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 16.h),

              _buildField(
                "IBAN",
                Iconsax.document_text,
                ibanController,
              ),

              SizedBox(height: 16.h),

              _buildField(
                "SWIFT Code",
                Iconsax.code,
                swiftController,
              ),

              SizedBox(height: 16.h),

              _buildField(
                "Branch Name",
                Iconsax.location,
                branchController,
              ),

              SizedBox(height: 20.h),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 5.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: SwitchListTile(
                  value: defaultPayout,
                  activeColor: AppColors.primaryColor,
                  contentPadding: EdgeInsets.zero,
                  secondary: const Icon(Iconsax.wallet),
                  title: const Text("Default Payout Account"),
                  subtitle: const Text(
                    "Use this account for all payouts",
                  ),
                  onChanged: (value) {
                    setState(() {
                      defaultPayout = value;
                    });
                  },
                ),
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
                          "Bank Account Updated Successfully",
                        ),
                      ),
                    );

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
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
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
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

  Widget _buildField(
      String label,
      IconData icon,
      TextEditingController controller, {
        TextInputType keyboardType = TextInputType.text,
      }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
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