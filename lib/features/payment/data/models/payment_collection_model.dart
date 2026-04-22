import 'package:json_annotation/json_annotation.dart';

part 'payment_collection_model.g.dart';

@JsonSerializable()
class PaymentCollectionResponse {
  @JsonKey(name: 'payment_collection')
  final PaymentCollectionModel paymentCollection;

  PaymentCollectionResponse(this.paymentCollection);

  factory PaymentCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentCollectionResponseFromJson(json);
}

@JsonSerializable()
class PaymentCollectionModel {
  final String id;

  @JsonKey(name: 'currency_code')
  final String currencyCode;

  final int amount;

  PaymentCollectionModel({
    required this.id,
    required this.currencyCode,
    required this.amount,
  });

  factory PaymentCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentCollectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentCollectionModelToJson(this);
}
