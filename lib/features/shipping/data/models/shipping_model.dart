import 'package:json_annotation/json_annotation.dart';

part 'shipping_model.g.dart';

@JsonSerializable()
class ShippingResponseModel {
  @JsonKey(name: "shipping_options")
  final List<ShippingOptionModel> options;

  ShippingResponseModel({required this.options});

  factory ShippingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ShippingResponseModelToJson(this);
}

@JsonSerializable()
class ShippingOptionModel {
  final String id;
  final String name;

  @JsonKey(name: "amount")
  final int amount;

  final ShippingTypeModel? type;

  @JsonKey(name: "calculated_price")
  final CalculatedPriceModel? calculatedPrice;

  @JsonKey(name: "is_tax_inclusive")
  final bool? isTaxInclusive;

  ShippingOptionModel({
    required this.id,
    required this.name,
    required this.amount,
    this.type,
    this.calculatedPrice,
    this.isTaxInclusive,
  });

  factory ShippingOptionModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingOptionModelFromJson(json);
}

@JsonSerializable()
class ShippingTypeModel {
  final String? label;
  final String? description;
  final String? code;

  ShippingTypeModel({
    this.label,
    this.description,
    this.code,
  });

  factory ShippingTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingTypeModelFromJson(json);
}

@JsonSerializable()
class CalculatedPriceModel {
  @JsonKey(name: "currency_code")
  final String? currencyCode;

  @JsonKey(name: "calculated_amount")
  final int? amount;

  CalculatedPriceModel({
    this.currencyCode,
    this.amount,
  });

  factory CalculatedPriceModel.fromJson(Map<String, dynamic> json) =>
      _$CalculatedPriceModelFromJson(json);
}