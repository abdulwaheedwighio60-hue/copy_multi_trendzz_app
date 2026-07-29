class CartItemModel {
  CartItemModel({
    required this.imagePath,
    required this.title,
    required this.category,
    required this.price,
    this.quantity = 1,
  });

  final String imagePath;
  final String title;
  final String category;
  final double price;
  int quantity;

  double get totalPrice => price * quantity;
}