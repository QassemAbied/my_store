class AddressResponseEntity {
  final List<AddressEntity> addresses;

  AddressResponseEntity({
    required this.addresses,
  });
}

class AddressEntity {
  final String id;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String address1;
  final String? address2;
  final String city;
  final String countryCode;
  final String? postalCode;

  AddressEntity({
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