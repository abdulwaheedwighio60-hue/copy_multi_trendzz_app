import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_trendzz/presentation/seller/inventory/widgets/out_of_stock_products_widgt.dart';
import '../../../core/constants/app_colors.dart';
import 'widgets/inventory_analytics_widget.dart';
import 'widgets/inventory_header_widget.dart';
import 'widgets/inventory_products_widget.dart';
import 'widgets/inventory_summary_cards_widget.dart';
import 'widgets/low_stock_products_widget.dart';
import 'widgets/stock_activity_widget.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {

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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                /// Inventory Header
                InventoryHeaderWidget(
                  onSearch: (value) {},
                  onFilterTap: () {},
                  onAddProductTap: () {
                    /// Navigate to Add Product Screen
                  },
                ),
                const SizedBox(height: 20),
                /// Summary Cards
                const InventorySummaryCardsWidget(),
                const SizedBox(height: 20),
                /// Low Stock Products
                const LowStockProductsWidget(),
                const SizedBox(height: 20),
                /// Out Of Stock Products
                const OutOfStockProductsWidget(),
                const SizedBox(height: 20),
                /// Inventory Products
                const InventoryProductsWidget(),
                const SizedBox(height: 20),
                /// Stock Activity
                const StockActivityWidget(),
                const SizedBox(height: 20),
                /// Inventory Analytics
                const InventoryAnalyticsWidget(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      )
    );
  }

}