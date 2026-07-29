import 'package:multi_trendzz/core/model/product_color_model.dart';

class ProductDetailModel {
  ProductDetailModel({
    required this.category,
    required this.title,
    required this.rating,
    required this.totalPrice,
    required this.sellerName,
    required this.sellerRole,
    required this.sellerImage,
    required this.description,
    required this.images,
    required this.colors,
    this.isFavorite = false,
  });

  final String category;
  final String title;
  final double rating;
  final double totalPrice;
  final String sellerName;
  final String sellerRole;
  final String sellerImage;
  final String description;
  final List<String> images;
  final List<ProductColorModel> colors;
  final bool isFavorite;
}
