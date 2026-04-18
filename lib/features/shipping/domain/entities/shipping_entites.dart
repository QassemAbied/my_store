class ShippingEntity {
  final List<ShippingOptionEntity> options;

  ShippingEntity({required this.options});
}

class ShippingOptionEntity {
  final String id;
  final String name;
  final String? description;
  final String? type;
  final int amount;
  final String? currencyCode;
  final bool isTaxInclusive;

  ShippingOptionEntity({
    required this.id,
    required this.name,
    required this.amount,
    this.description,
    this.type,
    this.currencyCode,
    this.isTaxInclusive = false,
  });
}