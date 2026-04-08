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
  currencyCode: json['currency_code'] as String?,
  email: json['email'] as String?,
  subtotal: (json['subtotal'] as num?)?.toInt(),
  shippingTotal: (json['shipping_total'] as num?)?.toInt(),
  shippingAddress: json['shipping_address'] == null
      ? null
      : AddressModel.fromJson(json['shipping_address'] as Map<String, dynamic>),
  billingAddress: json['billing_address'] == null
      ? null
      : AddressModel.fromJson(json['billing_address'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
  'id': instance.id,
  'region_id': instance.regionId,
  'currency_code': instance.currencyCode,
  'email': instance.email,
  'total': instance.total,
  'subtotal': instance.subtotal,
  'shipping_total': instance.shippingTotal,
  'items': instance.items,
  'shipping_address': instance.shippingAddress,
  'billing_address': instance.billingAddress,
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

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  address1: json['address_1'] as String?,
  city: json['city'] as String?,
  countryCode: json['country_code'] as String?,
);

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'address_1': instance.address1,
      'city': instance.city,
      'country_code': instance.countryCode,
    };
