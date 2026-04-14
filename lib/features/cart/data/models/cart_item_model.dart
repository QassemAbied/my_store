import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartResponseModel {
  final CartModel cart;

  CartResponseModel({required this.cart});

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseModelToJson(this);
}

@JsonSerializable()
class CartModel {
  final String id;

  @JsonKey(name: 'region_id')
  final String regionId;

  @JsonKey(name: 'currency_code')
  final String? currencyCode;

  final String? email;

  final int total;

  @JsonKey(name: 'subtotal')
  final int? subtotal;

  @JsonKey(name: 'shipping_total')
  final int? shippingTotal;

  final List<CartItemModel> items;

  @JsonKey(name: 'shipping_address')
  final AddressModel? shippingAddress;

  @JsonKey(name: 'billing_address')
  final AddressModel? billingAddress;

  CartModel({
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

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}

@JsonSerializable()
class CartItemModel {
  final String id;

  @JsonKey(name: 'product_title')
  final String title;
  @JsonKey(name: 'variant_id')
  final String variantId;
  final int quantity;

  final String thumbnail;

  @JsonKey(name: 'unit_price')
  final int price;

  CartItemModel({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.thumbnail, required this.variantId,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}

@JsonSerializable()
class AddressModel {
  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  @JsonKey(name: 'address_1')
  final String? address1;

  final String? city;

  @JsonKey(name: 'country_code')
  final String? countryCode;

  AddressModel({
    this.firstName,
    this.lastName,
    this.address1,
    this.city,
    this.countryCode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}