// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressResponseModel _$AddressResponseModelFromJson(
  Map<String, dynamic> json,
) => AddressResponseModel(
  addresses: (json['addresses'] as List<dynamic>)
      .map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AddressResponseModelToJson(
  AddressResponseModel instance,
) => <String, dynamic>{'addresses': instance.addresses};

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
  id: json['id'] as String,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  phone: json['phone'] as String?,
  address1: json['address_1'] as String,
  address2: json['address_2'] as String?,
  city: json['city'] as String,
  countryCode: json['country_code'] as String,
  postalCode: json['postal_code'] as String?,
);

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'address_1': instance.address1,
      'address_2': instance.address2,
      'city': instance.city,
      'country_code': instance.countryCode,
      'postal_code': instance.postalCode,
    };
