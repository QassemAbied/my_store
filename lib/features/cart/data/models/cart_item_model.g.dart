// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseModel _$CartResponseModelFromJson(Map<String, dynamic> json) =>
    CartResponseModel(
      cart: CartModel.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartResponseModelToJson(CartResponseModel instance) =>
    <String, dynamic>{'cart': instance.cart};

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
  id: json['id'] as String,
  regionId: json['region_id'] as String,
  total: (json['total'] as num).toInt(),
  items: (json['items'] as List<dynamic>)
      .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
  'id': instance.id,
  'region_id': instance.regionId,
  'total': instance.total,
  'items': instance.items,
};

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      id: json['id'] as String,
      title: json['product_title'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['unit_price'] as num).toInt(),
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_title': instance.title,
      'quantity': instance.quantity,
      'thumbnail': instance.thumbnail,
      'unit_price': instance.price,
    };
