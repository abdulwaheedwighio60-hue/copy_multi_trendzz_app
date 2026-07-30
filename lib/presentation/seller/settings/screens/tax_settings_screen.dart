import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';


class TaxSettingsScreen extends StatefulWidget {
  const TaxSettingsScreen({super.key});

  @override
  State<TaxSettingsScreen> createState() =>
      _TaxSettingsScreenState();
}

class _TaxSettingsScreenState
    extends State<TaxSettingsScreen> {

  final taxNameController = TextEditingController(
    text: "Sales Tax",
  );

  final taxRateController = TextEditingController(
    text: "15",
  );

  final taxNumberController = TextEditingController(
    text: "GST-45879632",
  );

  final countryController = TextEditingController(
    text: "Pakistan",
  );

  final stateController = TextEditingController(
    text: "Sindh",
  );

  bool enableTax = true;
  bool includeTaxInPrice = false;

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
          title: const Text("Tax Settings"),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [

              _buildField(
                "Tax Name",
                Iconsax.receipt_item,
                taxNameController,
              ),

              SizedBox(height: 16.h),

              _buildField(
                "Tax Rate (%)",
                Iconsax.percentage_circle,
                taxRateController,
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 16.h),

              _buildField(
                "Tax Registration Number",
                Iconsax.document_text,
                taxNumberController,
              ),

              SizedBox(height: 16.h),

              _buildField(
                "Country",
                Iconsax.global,
                countryController,
              ),

              SizedBox(height: 16.h),

              _buildField(
                "State / Province",
                Iconsax.location,
                stateController,
              ),

              SizedBox(height: 20.h),

              _buildSwitchTile(
                title: "Enable Tax",
                subtitle: "Apply tax on all products",
                icon: Iconsax.receipt,
                value: enableTax,
                onChanged: (value) {
                  setState(() {
                    enableTax = value;
                  });
                },
              ),

              SizedBox(height: 12.h),

              _buildSwitchTile(
                title: "Include Tax in Price",
                subtitle: "Display prices including tax",
                icon: Iconsax.money_recive,
                value: includeTaxInPrice,
                onChanged: (value) {
                  setState(() {
                    includeTaxInPrice = value;
                  });
                },
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
                          "Tax Settings Updated Successfully",
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
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
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

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
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