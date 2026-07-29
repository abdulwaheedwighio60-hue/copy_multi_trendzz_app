import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/presentation/seller/shipping/widgets/shopping_empty_widget.dart';
import '../../../core/constants/app_colors.dart';
import 'widgets/shipping_card_widget.dart';
import 'widgets/shipping_filter_widget.dart';
import 'widgets/shipping_header_widget.dart';
import 'widgets/shipping_summary_widget.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {

  int selectedFilter = 0;

  /// Change to true to test Empty UI
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xffF7F8FA),

        body: SafeArea(
          child: Column(
            children: [

              /// Header
              ShippingHeaderWidget(
                totalShipments: 156,
                onSearchTap: () {},
                onFilterTap: () {},
                onCreateShipment: () {},
              ),

              Expanded(
                child: isEmpty
                    ? ShippingEmptyWidget(
                  onRefresh: () {},
                  onCreateShipment: () {},
                )
                    : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [

                      const SizedBox(height: 20),

                      /// Summary
                      const ShippingSummaryWidget(),

                      const SizedBox(height: 20),

                      /// Filter
                      ShippingFilterWidget(
                        selectedIndex: selectedFilter,
                        onChanged: (index) {
                          setState(() {
                            selectedFilter = index;
                          });

                          // TODO:
                          // Apply Shipping Filter
                        },
                      ),

                      const SizedBox(height: 20),

                      /// Shipment Cards

                      ShippingCardWidget(
                        trackingNumber: "#TRK-10245",
                        customerName: "Abdul Waheed",
                        courierCompany: "DHL Express",
                        address: "Karachi, Pakistan",
                        shippingCost: "\$12",
                        expectedDelivery: "28 Jul 2026",
                        status: ShippingStatus.inTransit,
                        onTap: () {
                          context.push(AppRoutes.shoppingDetailScreen);
                        },
                      ),

                      ShippingCardWidget(
                        trackingNumber: "#TRK-10246",
                        customerName: "Sara Khan",
                        courierCompany: "TCS Courier",
                        address: "Lahore, Pakistan",
                        shippingCost: "\$8",
                        expectedDelivery: "30 Jul 2026",
                        status: ShippingStatus.delivered,
                        onTap: () {},
                      ),

                      ShippingCardWidget(
                        trackingNumber: "#TRK-10247",
                        customerName: "Ali Ahmed",
                        courierCompany: "Leopards Courier",
                        address: "Islamabad, Pakistan",
                        shippingCost: "\$10",
                        expectedDelivery: "31 Jul 2026",
                        status: ShippingStatus.pending,
                        onTap: () {},
                      ),

                      ShippingCardWidget(
                        trackingNumber: "#TRK-10248",
                        customerName: "Fatima Noor",
                        courierCompany: "BlueEx",
                        address: "Hyderabad, Pakistan",
                        shippingCost: "\$9",
                        expectedDelivery: "01 Aug 2026",
                        status: ShippingStatus.packed,
                        onTap: () {},
                      ),

                      const SizedBox(height: 30),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}