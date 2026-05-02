class OrderReviewEntity {
  final String id;
  final String status;
  final String currencyCode;
  final String createdAt;
  final String? email;
  final int total;

  final List<OrderItemEntity> items;
  final ShippingAddressEntity? address;

  OrderReviewEntity({
    required this.id,
    required this.status,
    required this.currencyCode,
    required this.createdAt,
    required this.items,
    required this.total,
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
  final String? firstName;
  final String? lastName;

  ShippingAddressEntity({
    required this.address,
    required this.city,
    required this.country,
    this.firstName,
    this.lastName,
  });
}