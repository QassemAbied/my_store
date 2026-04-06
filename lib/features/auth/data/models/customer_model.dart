import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable()
class CustomerModel {
  final String email;

  @JsonKey(name: "first_name")
  final String firstName;

  final String phone;
  final String country;

  CustomerModel({
    required this.email,
    required this.firstName,
    required this.phone,
    required this.country,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}