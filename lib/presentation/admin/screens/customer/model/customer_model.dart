class CustomerModel {
  final String image;
  final String name;
  final String email;
  final String phone;
  final int orders;
  final bool active;
  final String joinDate;

  CustomerModel({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
    required this.orders,
    required this.active,
    required this.joinDate,
  });
}