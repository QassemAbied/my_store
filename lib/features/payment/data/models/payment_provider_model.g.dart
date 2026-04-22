// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentProvidersResponseModel _$PaymentProvidersResponseModelFromJson(
  Map<String, dynamic> json,
) => PaymentProvidersResponseModel(
  paymentProviders: (json['payment_providers'] as List<dynamic>)
      .map((e) => PaymentProviderModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  count: (json['count'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$PaymentProvidersResponseModelToJson(
  PaymentProvidersResponseModel instance,
) => <String, dynamic>{
  'payment_providers': instance.paymentProviders,
  'count': instance.count,
  'offset': instance.offset,
  'limit': instance.limit,
};

PaymentProviderModel _$PaymentProviderModelFromJson(
  Map<String, dynamic> json,
) => PaymentProviderModel(
  id: json['id'] as String,
  isEnabled: json['is_enabled'] as bool,
);

Map<String, dynamic> _$PaymentProviderModelToJson(
  PaymentProviderModel instance,
) => <String, dynamic>{'id': instance.id, 'is_enabled': instance.isEnabled};
