import 'package:my_store/features/auth/domain/entities/auth_entity.dart';
import 'package:my_store/features/auth/domain/entities/customer_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterAuthLoading extends AuthState {}

class RegisterAuthSuccess extends AuthState {
  final AuthEntity authEntity;

  RegisterAuthSuccess(this.authEntity);
}

class RegisterAuthError extends AuthState {
  final String message;
  RegisterAuthError(this.message);
}



class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final CustomerEntity customerEntity;

  RegisterSuccess(this.customerEntity);
}

class RegisterError extends AuthState {
  final String message;
  RegisterError(this.message);
}



class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final AuthEntity authEntity;

  LoginSuccess(this.authEntity);
}

class LoginError extends AuthState {
  final String message;
  LoginError(this.message);
}



class LogoutSuccess extends AuthState {}

