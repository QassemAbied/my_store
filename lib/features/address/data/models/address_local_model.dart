import 'package:hive_ce_flutter/adapters.dart';

part 'address_local_model.g.dart';

@HiveType(typeId: 12)
class AddressResponseLocalModel extends HiveObject {

  @HiveField(0)
  final List<AddressItemLocalModel> addresses;

  AddressResponseLocalModel({
    required this.addresses,
  });
}

@HiveType(typeId: 13)
class AddressItemLocalModel extends HiveObject {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String? firstName;

  @HiveField(2)
  final String? lastName;

  @HiveField(3)
  final String? phone;

  @HiveField(4)
  final String address1;

  @HiveField(5)
  final String? address2;

  @HiveField(6)
  final String city;

  @HiveField(7)
  final String countryCode;

  @HiveField(8)
  final String? postalCode;

  AddressItemLocalModel({
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
}