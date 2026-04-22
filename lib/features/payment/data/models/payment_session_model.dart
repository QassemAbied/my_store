import 'package:json_annotation/json_annotation.dart';

part 'payment_session_model.g.dart';

@JsonSerializable()
class PaymentSessionResponseModel {
  @JsonKey(name: 'payment_collection')
  final PaymentCollectionModel paymentCollection;

  PaymentSessionResponseModel(this.paymentCollection);

  factory PaymentSessionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentSessionResponseModelFromJson(json);
}

@JsonSerializable()
class PaymentCollectionModel {
  final String id;

  @JsonKey(name: 'payment_sessions')
  final List<PaymentSessionModel> paymentSessions;

  PaymentCollectionModel({required this.id, required this.paymentSessions});

  factory PaymentCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentCollectionModelFromJson(json);
}

@JsonSerializable()
class PaymentSessionModel {
  final String id;

  @JsonKey(name: 'provider_id')
  final String providerId;

  final PaymentDataModel data;

  PaymentSessionModel({
    required this.id,
    required this.providerId,
    required this.data,
  });

  factory PaymentSessionModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentSessionModelFromJson(json);
}

@JsonSerializable()
class PaymentDataModel {
  @JsonKey(name: 'client_secret')
  final String clientSecret;

  final int amount;

  PaymentDataModel({required this.clientSecret, required this.amount});

  factory PaymentDataModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentDataModelFromJson(json);
}
