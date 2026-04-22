class OrderReviewEntity {
  final String id;
  final String status;
  final String? email;
  final List<OrderItemEntity> items;
  final ShippingAddressEntity? address;

  OrderReviewEntity({
    required this.id,
    required this.status,
    required this.items,
    this.email,
    this.address,
  });
}

class OrderItemEntity {
  final String title;
  final int quantity;
  final int price;
  final String? thumbnail;

  OrderItemEntity({
    required this.title,
    required this.quantity,
    required this.price,
    this.thumbnail,
  });
}

class ShippingAddressEntity {
  final String address;
  final String city;
  final String country;

  ShippingAddressEntity({
    required this.address,
    required this.city,
    required this.country,
  });
}
