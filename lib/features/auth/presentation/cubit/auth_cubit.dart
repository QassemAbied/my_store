import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/auth/domain/entities/requests.dart';
import 'package:my_store/features/auth/domain/usecases/register_use_case.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_state.dart';
import '../../domain/usecases/register_auth_use_case.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterAuthUseCase _registerAuthUseCase;
  final RegisterUseCase _registerUseCase;
  AuthCubit(this._registerAuthUseCase, this._registerUseCase)
    : super(AuthInitial());

  Future<void> registerAuth(LoginRequest request) async {
    emit(RegisterAuthLoading());
    final result = await _registerAuthUseCase(request);
    result.result.fold(
      (failure) => emit(RegisterAuthError(failure.toString())),
      (data) => emit(RegisterAuthSuccess(data)),
    );
  }

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    final result = await _registerUseCase(request);
    result.result.fold(
      (failure) => emit(RegisterError(failure.toString())),
      (data) => emit(RegisterSuccess(data)),
    );
  }
}
