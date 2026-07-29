import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderModel {
  OrderModel({
    required this.name,
    required this.category,
    required this.qty,
    required this.price,
    required this.imageUrl,
  });

  final String name;
  final String category;
  final int qty;
  final double price;
  final String imageUrl;
}