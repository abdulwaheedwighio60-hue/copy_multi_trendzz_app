class Product {
  final String name;
  final String sku;
  final double price;
  int stock;
  final String? image;
  bool active;
  final String score;

  Product({
    required this.name,
    required this.sku,
    required this.price,
    required this.stock,
    required this.image,
    required this.active,
    required this.score,
  });
}

class StatusTab {
  final String title;
  final int count;

  const StatusTab(
      this.title,
      this.count,
      );
}