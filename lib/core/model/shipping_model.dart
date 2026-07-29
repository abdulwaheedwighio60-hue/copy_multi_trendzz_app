class ShippingAddressModel {
  ShippingAddressModel({
    required this.title,
    required this.address,
  });

  final String title;
  final String address;
}

class ShippingTypeModel {
  ShippingTypeModel({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.price,
  });

  final String title;
  final String subtitle;
  final String date;
  final double price;
}

class CheckoutOrderItemModel {
  CheckoutOrderItemModel({
    required this.imagePath,
    required this.title,
    required this.category,
    required this.price,
  });

  final String imagePath;
  final String title;
  final String category;
  final double price;
}