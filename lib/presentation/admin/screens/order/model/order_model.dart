import 'package:flutter/material.dart';

class OrderModel {
  final String orderId;
  final String customerName;
  final String customerImage;
  final String sellerName;
  final double totalAmount;
  final String paymentMethod;
  final String status;
  final String orderDate;

  OrderModel({
    required this.orderId,
    required this.customerName,
    required this.customerImage,
    required this.sellerName,
    required this.totalAmount,
    required this.paymentMethod,
    required this.status,
    required this.orderDate,
  });
}


final List<OrderModel> orders = [

  OrderModel(
    orderId: "ORD-1001",
    customerName: "Ali Ahmed",
    customerImage:
    "https://i.pravatar.cc/150?img=11",
    sellerName: "Fashion Hub",
    totalAmount: 5200,
    paymentMethod: "Paid",
    status: "Delivered",
    orderDate: "01 Aug 2026",
  ),

  OrderModel(
    orderId: "ORD-1002",
    customerName: "Sara Khan",
    customerImage:
    "https://i.pravatar.cc/150?img=32",
    sellerName: "Tech Store",
    totalAmount: 18999,
    paymentMethod: "COD",
    status: "Pending",
    orderDate: "31 Jul 2026",
  ),

  OrderModel(
    orderId: "ORD-1003",
    customerName: "Ahmed Raza",
    customerImage:
    "https://i.pravatar.cc/150?img=15",
    sellerName: "Mobile World",
    totalAmount: 12500,
    paymentMethod: "Paid",
    status: "Processing",
    orderDate: "30 Jul 2026",
  ),

  OrderModel(
    orderId: "ORD-1004",
    customerName: "Fatima Noor",
    customerImage:
    "https://i.pravatar.cc/150?img=48",
    sellerName: "Beauty Shop",
    totalAmount: 4200,
    paymentMethod: "Paid",
    status: "Shipped",
    orderDate: "29 Jul 2026",
  ),

  OrderModel(
    orderId: "ORD-1005",
    customerName: "Usman Ali",
    customerImage:
    "https://i.pravatar.cc/150?img=53",
    sellerName: "Sports Zone",
    totalAmount: 7800,
    paymentMethod: "COD",
    status: "Cancelled",
    orderDate: "28 Jul 2026",
  ),

];