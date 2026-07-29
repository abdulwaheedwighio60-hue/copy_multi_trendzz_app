import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/presentation/seller/shipping/widgets/shopping_company_widget.dart';
import 'package:multi_trendzz/presentation/seller/shipping/widgets/shopping_tracking_widget.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_style.dart';


class ShoppingDetailScreen extends StatefulWidget {
  const ShoppingDetailScreen({super.key});

  @override
  State<ShoppingDetailScreen> createState() =>
      _ShoppingDetailScreenState();
}

class _ShoppingDetailScreenState
    extends State<ShoppingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,

        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),

        title: Text(
          "Shipment Details",
          style: AppTextStyles.titleMedium,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 20.h),

            /// Shipment Information
            _section(
              title: "Shipment Information",
              child: Column(
                children: [

                  _tile(
                    Iconsax.barcode,
                    "Tracking Number",
                    "#TRK-10245",
                  ),

                  _divider(),

                  _tile(
                    Icons.local_shipping,
                    "Courier",
                    "DHL Express",
                  ),

                  _divider(),

                  _tile(
                    Iconsax.wallet_money,
                    "Shipping Cost",
                    "\$12",
                  ),

                  _divider(),

                  _tile(
                    Iconsax.calendar,
                    "Expected Delivery",
                    "28 Jul 2026",
                  ),

                  _divider(),

                  _tile(
                    Iconsax.tick_circle,
                    "Status",
                    "In Transit",
                    valueColor: Colors.blue,
                  ),

                ],
              ),
            ),

            SizedBox(height: 20.h),

            /// Customer Information
            _section(
              title: "Customer Information",
              child: Column(
                children: [

                  _tile(
                    Iconsax.user,
                    "Customer",
                    "Abdul Waheed",
                  ),

                  _divider(),

                  _tile(
                    Iconsax.call,
                    "Phone",
                    "+92 300 1234567",
                  ),

                  _divider(),

                  _tile(
                    Iconsax.sms,
                    "Email",
                    "abdul@example.com",
                  ),

                ],
              ),
            ),

            SizedBox(height: 20.h),

            /// Address
            _section(
              title: "Shipping Address",
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Icon(
                    Iconsax.location,
                    color: AppColors.primaryColor,
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: Text(
                      "House #21, Block A, Gulshan-e-Iqbal, Karachi, Pakistan",
                      style: AppTextStyles.bodyMedium,
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(height: 20.h),

            /// Timeline
            const ShippingTrackingWidget(),

            SizedBox(height: 20.h),

            /// Courier Company
            const ShippingCompanyWidget(
              companyName: "DHL Express",
              logoUrl:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/DHL_Logo.svg/512px-DHL_Logo.svg.png",
              contactNumber: "+92 300 1234567",
              website: "www.dhl.com",
              deliveryTime: "2-3 Business Days",
              rating: 4.8,
            ),

            SizedBox(height: 25.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton.icon(
                  onPressed: () {},

                  icon: const Icon(Iconsax.map),

                  label: const Text(
                    "Track Shipment",
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(14.r),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: double.infinity,
                height: 52.h,
                child: OutlinedButton.icon(
                  onPressed: () {},

                  icon: const Icon(Iconsax.document_download),

                  label: const Text(
                    "Download Invoice",
                  ),

                  style: OutlinedButton.styleFrom(
                    foregroundColor:
                    AppColors.primaryColor,
                    side: const BorderSide(
                      color: AppColors.primaryColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(14.r),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30.h),

          ],
        ),
      ),
    );
  }

  Widget _section({
    required String title,
    required Widget child,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 18.h),

          child,

        ],
      ),
    );
  }

  Widget _tile(
      IconData icon,
      String title,
      String value, {
        Color? valueColor,
      }) {
    return Row(
      children: [

        Icon(
          icon,
          color: AppColors.primaryColor,
        ),

        SizedBox(width: 12.w),

        Expanded(
          child: Text(
            title,
            style: AppTextStyles.bodyMedium,
          ),
        ),

        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),

      ],
    );
  }

  Widget _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Divider(
        color: Colors.grey.shade300,
        height: 1,
      ),
    );
  }
}