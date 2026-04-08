class CartResponseEntity {
  final CartEntity cart;

  CartResponseEntity({required this.cart});
}

class CartEntity {
  final String id;
  final String regionId;
  final int total;
  final int? subtotal;
  final int? shippingTotal;

  final String? currencyCode;
  final String? email;

  final List<CartItemEntity> items;

  final AddressEntity? shippingAddress;
  final AddressEntity? billingAddress;

  CartEntity({
    required this.id,
    required this.regionId,
    required this.total,
    required this.items,
    this.subtotal,
    this.shippingTotal,
    this.currencyCode,
    this.email,
    this.shippingAddress,
    this.billingAddress,
  });
}

class CartItemEntity {
  final String id;
  final String thumbnail;
  final String title;
  final int quantity;
  final int price;

  CartItemEntity({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.thumbnail,
  });
}

class AddressEntity {
  final String? firstName;
  final String? lastName;
  final String? address1;
  final String? city;
  final String? countryCode;

  AddressEntity({
    this.firstName,
    this.lastName,
    this.address1,
    this.city,
    this.countryCode,
  });
}