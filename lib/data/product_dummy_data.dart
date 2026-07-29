import 'package:multi_trendzz/core/model/product_item.dart';

class ProductDummyData {
  ProductDummyData._();

  static final List<ProductItem> products = [
    // Clothes
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500',
      productName: 'Red T-Shirt',
      price: '\$25.00',
      rating: '4.8',
      category: 'Clothes',
      isFavorite: true,
    ),
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=500',
      productName: 'Light Brown Coat',
      price: '\$120.00',
      rating: '4.7',
      category: 'Clothes',
    ),
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1543076447-215ad9ba6923?w=500',
      productName: 'Denim Jacket',
      price: '\$85.00',
      rating: '4.6',
      category: 'Clothes',
    ),

    // Shoes
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500',
      productName: 'Nike Pegasus 39',
      price: '\$90.00',
      rating: '4.9',
      category: 'Shoes',
      isFavorite: true,
    ),
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=500',
      productName: 'White Sneakers',
      price: '\$65.00',
      rating: '4.5',
      category: 'Shoes',
    ),
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?w=500',
      productName: 'Running Shoes',
      price: '\$75.00',
      rating: '4.7',
      category: 'Shoes',
    ),

    // Electronics
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=500',
      productName: 'Canon Camera',
      price: '\$180.00',
      rating: '4.8',
      category: 'Electronics',
    ),
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500',
      productName: 'Wireless Headphones',
      price: '\$55.00',
      rating: '4.6',
      category: 'Electronics',
    ),
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1545454675-3531b543be5d?w=500',
      productName: 'Bluetooth Speaker',
      price: '\$40.00',
      rating: '4.4',
      category: 'Electronics',
    ),

    // Watch
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500',
      productName: 'Smart Watch',
      price: '\$120.00',
      rating: '4.5',
      category: 'Watch',
    ),
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1524592094714-0f0654e20314?w=500',
      productName: 'Classic Watch',
      price: '\$95.00',
      rating: '4.4',
      category: 'Watch',
    ),
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1434056886845-dac89ffe9b56?w=500',
      productName: 'Sports Watch',
      price: '\$110.00',
      rating: '4.7',
      category: 'Watch',
    ),

    // Bags
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500',
      productName: 'Travel Bag',
      price: '\$45.00',
      rating: '4.6',
      category: 'Bags',
    ),
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1594223274512-ad4803739b7c?w=500',
      productName: 'Hand Bag',
      price: '\$60.00',
      rating: '4.5',
      category: 'Bags',
    ),
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1622560480605-d83c853bc5c3?w=500',
      productName: 'School Bag',
      price: '\$35.00',
      rating: '4.3',
      category: 'Bags',
    ),

    // Furniture
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=500',
      productName: 'Arm Chair',
      price: '\$120.00',
      rating: '4.6',
      category: 'Furniture',
    ),
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1506439773649-6e0eb8cfb237?w=500',
      productName: 'Wood Chair',
      price: '\$120.00',
      rating: '4.5',
      category: 'Furniture',
    ),
    ProductItem(
      imagePath:
      'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=500',
      productName: 'Modern Sofa',
      price: '\$250.00',
      rating: '4.8',
      category: 'Furniture',
    ),
  ];

  static List<ProductItem> getProductsByCategory(String categoryTitle) {
    return products.where((ProductItem product) {
      return product.category.toLowerCase() ==
          categoryTitle.toLowerCase();
    }).toList();
  }

  static List<ProductItem> getFavoriteProducts() {
    return products.where((ProductItem product) {
      return product.isFavorite;
    }).toList();
  }

  static List<ProductItem> searchProducts(String query) {
    final String searchQuery = query.toLowerCase().trim();

    if (searchQuery.isEmpty) {
      return products;
    }

    return products.where((ProductItem product) {
      return product.productName.toLowerCase().contains(searchQuery) ||
          product.category.toLowerCase().contains(searchQuery);
    }).toList();
  }
}