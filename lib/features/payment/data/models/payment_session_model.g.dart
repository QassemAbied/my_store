// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentSessionResponseModel _$PaymentSessionResponseModelFromJson(
  Map<String, dynamic> json,
) => PaymentSessionResponseModel(
  PaymentCollectionModel.fromJson(
    json['payment_collection'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PaymentSessionResponseModelToJson(
  PaymentSessionResponseModel instance,
) => <String, dynamic>{'payment_collection': instance.paymentCollection};

PaymentCollectionModel _$PaymentCollectionModelFromJson(
  Map<String, dynamic> json,
) => PaymentCollectionModel(
  id: json['id'] as String,
  paymentSessions: (json['payment_sessions'] as List<dynamic>)
      .map((e) => PaymentSessionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaymentCollectionModelToJson(
  PaymentCollectionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'payment_sessions': instance.paymentSessions,
};

PaymentSessionModel _$PaymentSessionModelFromJson(Map<String, dynamic> json) =>
    PaymentSessionModel(
      id: json['id'] as String,
      providerId: json['provider_id'] as String,
      data: PaymentDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentSessionModelToJson(
  PaymentSessionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'provider_id': instance.providerId,
  'data': instance.data,
};

PaymentDataModel _$PaymentDataModelFromJson(Map<String, dynamic> json) =>
    PaymentDataModel(
      clientSecret: json['client_secret'] as String,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$PaymentDataModelToJson(PaymentDataModel instance) =>
    <String, dynamic>{
      'client_secret': instance.clientSecret,
      'amount': instance.amount,
    };
