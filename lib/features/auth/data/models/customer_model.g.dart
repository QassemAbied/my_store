// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerResponseModel _$CustomerResponseModelFromJson(
  Map<String, dynamic> json,
) => CustomerResponseModel(
  customer: CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CustomerResponseModelToJson(
  CustomerResponseModel instance,
) => <String, dynamic>{'customer': instance.customer};

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'country': instance.country,
    };
