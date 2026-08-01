import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final String description;
  final int products;
  final bool status;
  final String createdDate;
  final IconData icon;
  final String image;

  CategoryModel({
    required this.name,
    required this.description,
    required this.products,
    required this.status,
    required this.createdDate,
    required this.icon,
    required this.image,
  });
}