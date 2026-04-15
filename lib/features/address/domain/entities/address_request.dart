
class CreateAddressParams {
  final String firstName;
  final String lastName;
  final String address1;
  final String? address2;
  final String city;
  final String countryCode;
  final String? phone;

  CreateAddressParams({
    required this.firstName,
    required this.lastName,
    required this.address1,
    this.address2,
    required this.city,
    required this.countryCode,
    this.phone,
  });
}