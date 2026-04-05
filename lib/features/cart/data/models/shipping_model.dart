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
  final int amount;

  ShippingOptionModel({
    required this.id,
    required this.name,
    required this.amount,
  });

  factory ShippingOptionModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingOptionModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ShippingOptionModelToJson(this);
}