class CustomerEntity {
  final String email;
  final String firstName;
  final String lastName;
  final String? phone;
  final String? country;

  CustomerEntity({
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phone,
    this.country,
  });
}