import 'package:json_annotation/json_annotation.dart';

part 'payment_provider_model.g.dart';

@JsonSerializable()
class PaymentProvidersResponseModel {
  @JsonKey(name: "payment_providers")
  final List<PaymentProviderModel> paymentProviders;

  final int count;
  final int offset;
  final int limit;

  PaymentProvidersResponseModel({
    required this.paymentProviders,
    required this.count,
    required this.offset,
    required this.limit,
  });

  factory PaymentProvidersResponseModel.fromJson(
      Map<String, dynamic> json) =>
      _$PaymentProvidersResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PaymentProvidersResponseModelToJson(this);
}

@JsonSerializable()
class PaymentProviderModel {
  final String id;

  @JsonKey(name: "is_enabled")
  final bool isEnabled;

  PaymentProviderModel({
    required this.id,
    required this.isEnabled,
  });

  factory PaymentProviderModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentProviderModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentProviderModelToJson(this);
}