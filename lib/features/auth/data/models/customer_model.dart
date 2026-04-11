import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';
@JsonSerializable()
class CustomerResponseModel {
  final CustomerModel customer;

  CustomerResponseModel({required this.customer});

  factory CustomerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CustomerResponseModelToJson(this);
}
@JsonSerializable()
class CustomerModel {
  final String email;

  @JsonKey(name: "first_name")
  final String firstName;

  @JsonKey(name: "last_name")
  final String lastName;

  final String? phone;
  final String? country;

  CustomerModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phone,
    this.country,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}