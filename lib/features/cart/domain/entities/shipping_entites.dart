class ShippingEntity {
  final List<ShippingOptionEntity> options;

  ShippingEntity({required this.options});
}

class ShippingOptionEntity {
  final String id;
  final String name;
  final int amount;

  ShippingOptionEntity({
    required this.id,
    required this.name,
    required this.amount,
  });
}