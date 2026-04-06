// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      phone: json['phone'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'phone': instance.phone,
      'country': instance.country,
    };
