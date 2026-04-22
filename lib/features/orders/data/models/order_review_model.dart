import 'package:json_annotation/json_annotation.dart';

part 'order_review_model.g.dart';

@JsonSerializable()
class OrderReviewResponseModel {
  final OrderModel order;

  OrderReviewResponseModel({required this.order});

  factory OrderReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrderReviewResponseModelFromJson(json);
}

@JsonSerializable()
class OrderModel {
  final String id;

  @JsonKey(name: "currency_code")
  final String currencyCode;

  final String status;
  final String? email;

  final List<OrderItemModel> items;

  @JsonKey(name: "shipping_address")
  final ShippingAddressModel? shippingAddress;

  OrderModel({
    required this.id,
    required this.currencyCode,
    required this.status,
    required this.items,
    this.email,
    this.shippingAddress,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@JsonSerializable()
class OrderItemModel {
  final String title;
  final int quantity;

  @JsonKey(name: "unit_price")
  final int unitPrice;

  final String? thumbnail;

  OrderItemModel({
    required this.title,
    required this.quantity,
    required this.unitPrice,
    this.thumbnail,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
}

@JsonSerializable()
class ShippingAddressModel {
  @JsonKey(name: "address_1")
  final String address1;

  final String city;

  @JsonKey(name: "country_code")
  final String countryCode;

  ShippingAddressModel({
    required this.address1,
    required this.city,
    required this.countryCode,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressModelFromJson(json);
}
