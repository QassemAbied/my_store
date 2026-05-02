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
  final String status;

  @JsonKey(name: "currency_code")
  final String currencyCode;

  @JsonKey(name: "created_at")
  final String createdAt;

  final int total;

  final List<OrderItemModel> items;

  @JsonKey(name: "shipping_address")
  final ShippingAddressModel? shippingAddress;

  final CustomerModel? customer;

  OrderModel({
    required this.id,
    required this.status,
    required this.currencyCode,
    required this.createdAt,
    required this.total,
    required this.items,
    this.shippingAddress,
    this.customer,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@JsonSerializable()
class CustomerModel {
  final String? email;

  CustomerModel({this.email});

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
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

  @JsonKey(name: "first_name")
  final String? firstName;

  @JsonKey(name: "last_name")
  final String? lastName;

  ShippingAddressModel({
    required this.address1,
    required this.city,
    required this.countryCode,
    this.firstName,
    this.lastName,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressModelFromJson(json);
}