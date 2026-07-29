import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/presentation/seller/order/widgets/custom_information_widget.dart';
import 'package:multi_trendzz/presentation/seller/order/widgets/order_action_button_widget.dart';
import 'package:multi_trendzz/presentation/seller/order/widgets/order_status_header_widget.dart';
import 'package:multi_trendzz/presentation/seller/order/widgets/order_summary_widget.dart';
import 'package:multi_trendzz/presentation/seller/order/widgets/ordered_products_widget.dart';
import 'package:multi_trendzz/presentation/seller/order/widgets/payment_information_widget.dart';
import 'package:multi_trendzz/presentation/seller/order/widgets/shipping_address_widget.dart';
import 'package:multi_trendzz/presentation/seller/order/widgets/shipping_timeline_widget.dart';
import 'package:multi_trendzz/presentation/seller/order/widgets/update_order_status_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      appBar: AppBar(
        title: const Text("Order Details"),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),

        child: Column(
          children: const [

            OrderStatusHeaderWidget(),

            SizedBox(height: 18),

            CustomerInformationWidget(),

            SizedBox(height: 18),

            ShippingAddressWidget(),

            SizedBox(height: 18),

            OrderedProductsWidget(),

            SizedBox(height: 18),

            PaymentInformationWidget(),

            SizedBox(height: 18),

            ShippingTimelineWidget(),

            SizedBox(height: 18),

            UpdateOrderStatusWidget(),

            SizedBox(height: 18),

            OrderSummaryWidget(),

            SizedBox(height: 18),

            OrderActionButtonsWidget(),

          ],
        ),
      ),
    );
  }
}