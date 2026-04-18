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
      type: json['type'] == null
          ? null
          : ShippingTypeModel.fromJson(json['type'] as Map<String, dynamic>),
      calculatedPrice: json['calculated_price'] == null
          ? null
          : CalculatedPriceModel.fromJson(
              json['calculated_price'] as Map<String, dynamic>,
            ),
      isTaxInclusive: json['is_tax_inclusive'] as bool?,
    );

Map<String, dynamic> _$ShippingOptionModelToJson(
  ShippingOptionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'amount': instance.amount,
  'type': instance.type,
  'calculated_price': instance.calculatedPrice,
  'is_tax_inclusive': instance.isTaxInclusive,
};

ShippingTypeModel _$ShippingTypeModelFromJson(Map<String, dynamic> json) =>
    ShippingTypeModel(
      label: json['label'] as String?,
      description: json['description'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$ShippingTypeModelToJson(ShippingTypeModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'description': instance.description,
      'code': instance.code,
    };

CalculatedPriceModel _$CalculatedPriceModelFromJson(
  Map<String, dynamic> json,
) => CalculatedPriceModel(
  currencyCode: json['currency_code'] as String?,
  amount: (json['calculated_amount'] as num?)?.toInt(),
);

Map<String, dynamic> _$CalculatedPriceModelToJson(
  CalculatedPriceModel instance,
) => <String, dynamic>{
  'currency_code': instance.currencyCode,
  'calculated_amount': instance.amount,
};
