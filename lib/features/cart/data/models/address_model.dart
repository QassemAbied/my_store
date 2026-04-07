import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressResponseModel {
  final List<AddressModel> addresses;

  AddressResponseModel({
    required this.addresses,
  });

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseModelToJson(this);
}

@JsonSerializable()
class AddressModel {
  final String id;

  @JsonKey(name: "first_name")
  final String? firstName;

  @JsonKey(name: "last_name")
  final String? lastName;

  final String? phone;

  @JsonKey(name: "address_1")
  final String address1;

  @JsonKey(name: "address_2")
  final String? address2;

  final String city;

  @JsonKey(name: "country_code")
  final String countryCode;

  @JsonKey(name: "postal_code")
  final String? postalCode;

  AddressModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.phone,
    required this.address1,
    this.address2,
    required this.city,
    required this.countryCode,
    this.postalCode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}