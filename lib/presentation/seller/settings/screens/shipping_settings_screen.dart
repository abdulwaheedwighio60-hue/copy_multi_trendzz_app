import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';


class ShippingSettingsScreen extends StatefulWidget {
  const ShippingSettingsScreen({super.key});

  @override
  State<ShippingSettingsScreen> createState() =>
      _ShippingSettingsScreenState();
}

class _ShippingSettingsScreenState
    extends State<ShippingSettingsScreen> {

  final shippingCompanyController =
  TextEditingController(
    text: "DHL Express",
  );

  final shippingZoneController =
  TextEditingController(
    text: "Pakistan",
  );

  final shippingChargesController =
  TextEditingController(
    text: "250",
  );

  final freeShippingController =
  TextEditingController(
    text: "5000",
  );

  final deliveryTimeController =
  TextEditingController(
    text: "3 - 5 Business Days",
  );

  bool cashOnDelivery = true;
  bool freeShipping = true;
  bool internationalShipping = false;

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
          title: const Text("Shipping Settings"),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [

              _buildField(
                "Shipping Company",
                Iconsax.truck,
                shippingCompanyController,
              ),

              SizedBox(height: 16.h),

              _buildField(
                "Shipping Zone",
                Iconsax.global,
                shippingZoneController,
              ),

              SizedBox(height: 16.h),

              _buildField(
                "Shipping Charges",
                Iconsax.wallet_money,
                shippingChargesController,
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 16.h),

              _buildField(
                "Free Shipping Above",
                Iconsax.discount_shape,
                freeShippingController,
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 16.h),

              _buildField(
                "Estimated Delivery Time",
                Iconsax.timer_1,
                deliveryTimeController,
              ),

              SizedBox(height: 20.h),

              _buildSwitchTile(
                title: "Cash on Delivery",
                subtitle: "Allow customers to pay on delivery",
                icon: Iconsax.money_send,
                value: cashOnDelivery,
                onChanged: (value) {
                  setState(() {
                    cashOnDelivery = value;
                  });
                },
              ),

              SizedBox(height: 12.h),

              _buildSwitchTile(
                title: "Free Shipping",
                subtitle: "Enable free shipping option",
                icon: Iconsax.box,
                value: freeShipping,
                onChanged: (value) {
                  setState(() {
                    freeShipping = value;
                  });
                },
              ),

              SizedBox(height: 12.h),

              _buildSwitchTile(
                title: "International Shipping",
                subtitle: "Ship products internationally",
                icon: Iconsax.airplane,
                value: internationalShipping,
                onChanged: (value) {
                  setState(() {
                    internationalShipping = value;
                  });
                },
              ),

              SizedBox(height: 30.h),

              SizedBox(
                width: double.infinity,
                height: 55.h,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Shipping Settings Updated Successfully",
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