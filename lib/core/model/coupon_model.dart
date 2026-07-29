enum CouponDiscountType {
  percentage,
  fixedAmount,
  cashback,
}

class CouponModel {
  CouponModel({
    required this.code,
    required this.description,
    required this.unlockText,
    required this.discountType,
    required this.discountValue,
    required this.minimumOrderAmount,
  });

  final String code;
  final String description;
  final String unlockText;
  final CouponDiscountType discountType;
  final double discountValue;
  final double minimumOrderAmount;
}