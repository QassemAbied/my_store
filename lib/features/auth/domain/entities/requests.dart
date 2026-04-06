class LoginRequest {
  final String email;
  final String password;
  LoginRequest({required this.email,required this.password});
}

class RegisterRequest{
  final String email;
  final String password;
  final String firstName;
  final String phone;
  final String country;

  RegisterRequest({ required this.email,required this.password,
    required this.firstName, required this.phone,required this.country}
      );
}
