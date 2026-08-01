class SellerCategoryModel {
  final String id;
  final String image;
  final String categoryName;
  final String slug;
  final String description;
  final int totalProducts;
  final int totalSales;
  final bool active;
  final String createdDate;

  SellerCategoryModel({
    required this.id,
    required this.image,
    required this.categoryName,
    required this.slug,
    required this.description,
    required this.totalProducts,
    required this.totalSales,
    required this.active,
    required this.createdDate,
  });
}