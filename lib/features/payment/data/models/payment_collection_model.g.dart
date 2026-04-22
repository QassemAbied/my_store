// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentCollectionResponse _$PaymentCollectionResponseFromJson(
  Map<String, dynamic> json,
) => PaymentCollectionResponse(
  PaymentCollectionModel.fromJson(
    json['payment_collection'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PaymentCollectionResponseToJson(
  PaymentCollectionResponse instance,
) => <String, dynamic>{'payment_collection': instance.paymentCollection};

PaymentCollectionModel _$PaymentCollectionModelFromJson(
  Map<String, dynamic> json,
) => PaymentCollectionModel(
  id: json['id'] as String,
  currencyCode: json['currency_code'] as String,
  amount: (json['amount'] as num).toInt(),
);

Map<String, dynamic> _$PaymentCollectionModelToJson(
  PaymentCollectionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'currency_code': instance.currencyCode,
  'amount': instance.amount,
};
