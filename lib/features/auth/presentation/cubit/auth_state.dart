import 'package:my_store/features/auth/domain/entities/auth_entity.dart';

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
