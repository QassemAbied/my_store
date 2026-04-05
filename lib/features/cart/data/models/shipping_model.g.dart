// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingResponseModel _$ShippingResponseModelFromJson(
  Map<String, dynamic> json,
) => ShippingResponseModel(
  options: (json['shipping_options'] as List<dynamic>)
      .map((e) => ShippingOptionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ShippingResponseModelToJson(
  ShippingResponseModel instance,
) => <String, dynamic>{'shipping_options': instance.options};

ShippingOptionModel _$ShippingOptionModelFromJson(Map<String, dynamic> json) =>
    ShippingOptionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$ShippingOptionModelToJson(
  ShippingOptionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'amount': instance.amount,
};
