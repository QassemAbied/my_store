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

  final int total;

  final List<CartItemModel> items;

  CartModel({
    required this.id,
    required this.regionId,
    required this.total,
    required this.items,
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

  final int quantity;
  final String thumbnail;
  @JsonKey(name: 'unit_price')
  final int price;

  CartItemModel({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price, required this.thumbnail,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}