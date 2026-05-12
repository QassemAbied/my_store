import 'package:hive_ce_flutter/adapters.dart';

part 'customer_local_model.g.dart';

@HiveType(typeId: 30)
class CustomerResponseLocalModel extends HiveObject {

  @HiveField(0)
  final CustomerLocalModel customer;

  CustomerResponseLocalModel({
    required this.customer,
  });
}

@HiveType(typeId: 31)
class CustomerLocalModel extends HiveObject {

  @HiveField(0)
  final String email;

  @HiveField(1)
  final String firstName;

  @HiveField(2)
  final String lastName;

  @HiveField(3)
  final String? phone;

  @HiveField(4)
  final String? country;

  CustomerLocalModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phone,
    this.country,
  });
}