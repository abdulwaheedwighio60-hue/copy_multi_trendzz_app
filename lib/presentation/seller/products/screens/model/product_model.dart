class ProductModel {
  final String id;
  final String name;
  final String sku;
  final double price;
  final double discountPrice;
  final double costPrice;
  final double tax;
  int stock;

  final double weight;
  final double length;
  final double width;
  final double height;

  final String? category;
  final String? brand;
  final String? resolution;

  final String description;
  final String tags;

  final String? image;

  bool active;
  bool featured;

  final String score;

  ProductModel({
    required this.id,
    required this.name,
    required this.sku,
    required this.price,
    this.discountPrice = 0,
    this.costPrice = 0,
    this.tax = 0,
    required this.stock,
    this.weight = 0,
    this.length = 0,
    this.width = 0,
    this.height = 0,
    this.category,
    this.brand,
    this.resolution,
    this.description = '',
    this.tags = '',
    this.image,
    required this.active,
    this.featured = false,
    this.score = 'To be Improved',
  });
}