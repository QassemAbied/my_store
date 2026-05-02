import 'package:json_annotation/json_annotation.dart';

part 'order_list_model.g.dart';

@JsonSerializable()
class OrdersResponseModel {
  final List<OrderModel> orders;
  final int count;

  OrdersResponseModel({
    required this.orders,
    required this.count,
  });

  factory OrdersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseModelFromJson(json);
}

@JsonSerializable()
class OrderModel {
  final String id;
  final String status;
  final int total;

  @JsonKey(name: "created_at")
  final String createdAt;

  final List<OrderItemModel> items;

  OrderModel({
    required this.id,
    required this.status,
    required this.total,
    required this.createdAt,
    required this.items,
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