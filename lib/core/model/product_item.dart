class ProductItem {
  final String imagePath;
  final String productName;
  final String price;
  final String rating;
  final String category;
  final bool isFavorite;

  final String sellerName;
  final String sellerRole;
  final String sellerImage;
  final String description;

  ProductItem({
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.rating,
    required this.category,
    this.isFavorite = false,
    this.sellerName = 'Joshua Doe',
    this.sellerRole = 'Verified Seller',
    this.sellerImage =
    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300',
    this.description =
    'This product is made with premium quality material and designed for daily use. It provides comfort, durability, and a modern look.',
  });
}