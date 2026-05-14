import 'package:hive_ce_flutter/adapters.dart';

part 'cart_local_model.g.dart';

@HiveType(typeId: 6)
class CartResponseLocalModel extends HiveObject {

  @HiveField(0)
  final CartLocalModel cart;

  CartResponseLocalModel({
    required this.cart,
  });
}

@HiveType(typeId: 7)
class CartLocalModel extends HiveObject {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String regionId;

  @HiveField(2)
  final String? currencyCode;

  @HiveField(3)
  final String? email;

  @HiveField(4)
  final int total;

  @HiveField(5)
  final int? subtotal;

  @HiveField(6)
  final int? shippingTotal;

  @HiveField(7)
  final List<CartItemLocalModel> items;

  @HiveField(8)
  final AddressLocalModel? shippingAddress;

  @HiveField(9)
  final AddressLocalModel? billingAddress;

  CartLocalModel({
    required this.id,
    required this.regionId,
    required this.total,
    required this.items,
    this.currencyCode,
    this.email,
    this.subtotal,
    this.shippingTotal,
    this.shippingAddress,
    this.billingAddress,
  });
}

@HiveType(typeId: 8)
class CartItemLocalModel extends HiveObject {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String variantId;

  @HiveField(3)
  final int quantity;

  @HiveField(4)
  final String productId;

  @HiveField(5)
  final String thumbnail;

  @HiveField(6)
  final int price;

  CartItemLocalModel({
    required this.id,
    required this.title,
    required this.variantId,
    required this.quantity,
    required this.productId,
    required this.thumbnail,
    required this.price,
  });
}

@HiveType(typeId: 9)
class AddressLocalModel extends HiveObject {

  @HiveField(0)
  final String? firstName;

  @HiveField(1)
  final String? lastName;

  @HiveField(2)
  final String? address1;

  @HiveField(3)
  final String? city;

  @HiveField(4)
  final String? countryCode;

  AddressLocalModel({
    this.firstName,
    this.lastName,
    this.address1,
    this.city,
    this.countryCode,
  });
}