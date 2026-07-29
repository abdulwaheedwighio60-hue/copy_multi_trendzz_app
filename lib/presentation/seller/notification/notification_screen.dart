import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/app_colors.dart';
import 'widgets/notification_card_widget.dart';
import 'widgets/notification_empty_widget.dart';
import 'widgets/notification_filter_widget.dart';
import 'widgets/notification_header_widget.dart';
import 'widgets/notification_summary_widget.dart';

class SellerNotificationScreen extends StatefulWidget {
  const SellerNotificationScreen({super.key});

  @override
  State<SellerNotificationScreen> createState() => _SellerNotificationScreenState();
}

class _SellerNotificationScreenState extends State<SellerNotificationScreen> {
  int selectedFilter = 0;

  /// Change to true to test Empty Screen
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
              // NotificationHeaderWidget(
              //   unreadCount: 12,
              //   onSearchTap: () {},
              //   onMarkAllRead: () {},
              // ),

              Expanded(
                child: isEmpty
                    ? NotificationEmptyWidget(
                  onRefresh: () {},
                )
                    : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [

                      const SizedBox(height: 20),

                      /// Summary
                      // const NotificationSummaryWidget(),

                      const SizedBox(height: 20),

                      /// Filters
                      NotificationFilterWidget(
                        selectedIndex: selectedFilter,
                        onChanged: (index) {
                          setState(() {
                            selectedFilter = index;
                          });

                          // TODO:
                          // Apply Filter Logic
                        },
                      ),

                      const SizedBox(height: 20),

                      /// Notifications
                      NotificationCardWidget(
                        type: NotificationType.order,
                        title: "New Order Received",
                        description:
                        "Order #ORD-1025 has been placed successfully.",
                        time: "2 min ago",
                        isRead: false,
                        onTap: () {},
                      ),

                      NotificationCardWidget(
                        type: NotificationType.payment,
                        title: "Payment Received",
                        description:
                        "You received \$245 successfully.",
                        time: "15 min ago",
                        isRead: true,
                        onTap: () {},
                      ),

                      NotificationCardWidget(
                        type: NotificationType.review,
                        title: "New Product Review",
                        description:
                        "A customer rated your product 5 stars.",
                        time: "1 hour ago",
                        isRead: false,
                        onTap: () {},
                      ),

                      NotificationCardWidget(
                        type: NotificationType.inventory,
                        title: "Low Stock Alert",
                        description:
                        "Nike Air Max has only 3 items remaining.",
                        time: "Yesterday",
                        isRead: false,
                        onTap: () {},
                      ),

                      NotificationCardWidget(
                        type: NotificationType.shipping,
                        title: "Shipment Delivered",
                        description:
                        "Order #ORD-1018 has been delivered successfully.",
                        time: "Yesterday",
                        isRead: true,
                        onTap: () {},
                      ),

                      NotificationCardWidget(
                        type: NotificationType.system,
                        title: "System Update",
                        description:
                        "A new seller application update is available.",
                        time: "2 days ago",
                        isRead: true,
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