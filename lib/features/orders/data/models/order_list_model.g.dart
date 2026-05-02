// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersResponseModel _$OrdersResponseModelFromJson(Map<String, dynamic> json) =>
    OrdersResponseModel(
      orders: (json['orders'] as List<dynamic>)
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$OrdersResponseModelToJson(
  OrdersResponseModel instance,
) => <String, dynamic>{'orders': instance.orders, 'count': instance.count};

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  id: json['id'] as String,
  status: json['status'] as String,
  total: (json['total'] as num).toInt(),
  createdAt: json['created_at'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'total': instance.total,
      'created_at': instance.createdAt,
      'items': instance.items,
    };

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    OrderItemModel(
      title: json['title'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unit_price'] as num).toInt(),
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$OrderItemModelToJson(OrderItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      'thumbnail': instance.thumbnail,
    };
