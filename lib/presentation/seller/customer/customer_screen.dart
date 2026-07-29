import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/app_colors.dart';
import 'widgets/customer_header_widget.dart';
import 'widgets/customer_list_widget.dart';
import 'widgets/customer_summary_cards_widget.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {

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

        body: Column(
          children: [

            CustomerHeaderWidget(

              onSearch: (value) {

                // Search Customer

              },

              onNotificationTap: () {

                // Open Notifications

              },

              onFilterTap: () {

                // Open Filter

              },

              onAddCustomerTap: () {

                // Navigate to Add Customer

              },

            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    /// Summary Cards
                    const CustomerSummaryCardsWidget(),

                    const SizedBox(height: 25),

                    /// Customer List Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "All Customers",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// Customer List
                    const CustomerListWidget(),

                    const SizedBox(height: 30),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}