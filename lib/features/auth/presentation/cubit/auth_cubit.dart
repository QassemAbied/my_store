import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/services/shared_pref.dart';
import 'package:my_store/features/auth/domain/entities/requests.dart';
import 'package:my_store/features/auth/domain/usecases/register_use_case.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_state.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/usecases/login_user_use_case.dart';
import '../../domain/usecases/register_auth_use_case.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterAuthUseCase _registerAuthUseCase;
  final RegisterUseCase _registerUseCase;
  final LoginUserUseCase _loginUserUseCase;

  AuthCubit(this._registerAuthUseCase,
      this._registerUseCase,this._loginUserUseCase)
    : super(AuthInitial());

  Future<void> registerAuth(LoginRequest request) async {
    emit(RegisterAuthLoading());
    final result = await _registerAuthUseCase(request);
    result.result.fold(
      (failure) => emit(RegisterAuthError(failure.toString())),
      (data) {
        emit(RegisterAuthSuccess(data));
      }
    );
  }

  Future<void> createProfile(RegisterRequest request) async {
    emit(RegisterLoading());
    final result = await _registerUseCase(request);
    result.result.fold(
      (failure) => emit(RegisterError(failure.toString())),
      (data) => emit(RegisterSuccess(data)),
    );
  }


  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await _loginUserUseCase(request);
    result.result.fold(
          (failure) => emit(LoginError(failure.toString())),
          (data) {
            emit(LoginSuccess(data));
          }
    );
  }

  Future<void> logout() async {
    await SharedPrefHelper.removeData(AppConstants.tokenKey);
    emit(LogoutSuccess());
  }
}
