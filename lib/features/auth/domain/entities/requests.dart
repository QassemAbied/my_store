class LoginRequest {
  final String email;
  final String password;
  LoginRequest({required this.email,required this.password});
}

class RegisterRequest{
  final String email;
  final String firstName;
  final String lastName;
  final String authIdentityId;
  final String phone;
  final String country;

  RegisterRequest({ required this.email,
    required this.firstName, required this.phone,required this.country,
    required this.lastName, required this.authIdentityId}
      );
}
