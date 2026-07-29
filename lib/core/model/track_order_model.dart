import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TrackOrderModel {
  TrackOrderModel({
    required this.productName,
    required this.category,
    required this.quantity,
    required this.price,
    required this.imageUrl,
    required this.expectedDeliveryDate,
    required this.trackingId,
    required this.statuses,
  });

  final String productName;
  final String category;
  final int quantity;
  final double price;
  final String imageUrl;
  final String expectedDeliveryDate;
  final String trackingId;
  final List<OrderStatusModel> statuses;

  factory TrackOrderModel.dummy() {
    return TrackOrderModel(
      productName: 'Arm Chair',
      category: 'Chair',
      quantity: 2,
      price: 180.00,
      imageUrl:
      'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=300',
      expectedDeliveryDate: '03 Sep 2023',
      trackingId: 'TRK452126542',
      statuses: [
        OrderStatusModel(
          title: 'Order Placed',
          dateTime: '23 Sep 2023, 04:25 PM',
          isCompleted: true,
          icon: Iconsax.receipt_text,
        ),
        OrderStatusModel(
          title: 'In Progress',
          dateTime: '23 Sep 2023, 03:54 PM',
          isCompleted: true,
          icon: Iconsax.box,
        ),
        OrderStatusModel(
          title: 'Shipped',
          dateTime: 'Expected 24 Sep 2023',
          isCompleted: false,
          icon: Iconsax.truck_fast,
        ),
        OrderStatusModel(
          title: 'Delivered',
          dateTime: '24 Sep 2023, 20:23',
          isCompleted: false,
          icon: Iconsax.box_tick,
        ),
      ],
    );
  }
}

class OrderStatusModel {
  OrderStatusModel({
    required this.title,
    required this.dateTime,
    required this.isCompleted,
    required this.icon,
  });

  final String title;
  final String dateTime;
  final bool isCompleted;
  final IconData icon;
}