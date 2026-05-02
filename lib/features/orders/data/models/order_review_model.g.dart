// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderReviewResponseModel _$OrderReviewResponseModelFromJson(
  Map<String, dynamic> json,
) => OrderReviewResponseModel(
  order: OrderModel.fromJson(json['order'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderReviewResponseModelToJson(
  OrderReviewResponseModel instance,
) => <String, dynamic>{'order': instance.order};

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  id: json['id'] as String,
  status: json['status'] as String,
  currencyCode: json['currency_code'] as String,
  createdAt: json['created_at'] as String,
  total: (json['total'] as num).toInt(),
  items: (json['items'] as List<dynamic>)
      .map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  shippingAddress: json['shipping_address'] == null
      ? null
      : ShippingAddressModel.fromJson(
          json['shipping_address'] as Map<String, dynamic>,
        ),
  customer: json['customer'] == null
      ? null
      : CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'currency_code': instance.currencyCode,
      'created_at': instance.createdAt,
      'total': instance.total,
      'items': instance.items,
      'shipping_address': instance.shippingAddress,
      'customer': instance.customer,
    };

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(email: json['email'] as String?);

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{'email': instance.email};

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

ShippingAddressModel _$ShippingAddressModelFromJson(
  Map<String, dynamic> json,
) => ShippingAddressModel(
  address1: json['address_1'] as String,
  city: json['city'] as String,
  countryCode: json['country_code'] as String,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
);

Map<String, dynamic> _$ShippingAddressModelToJson(
  ShippingAddressModel instance,
) => <String, dynamic>{
  'address_1': instance.address1,
  'city': instance.city,
  'country_code': instance.countryCode,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
};
