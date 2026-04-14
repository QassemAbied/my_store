import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/network/use_case.dart';
import 'package:my_store/core/services/shared_pref.dart';
import 'package:my_store/features/auth/domain/entities/requests.dart';
import 'package:my_store/features/auth/domain/usecases/get_profile_use_case.dart';
import 'package:my_store/features/auth/domain/usecases/register_use_case.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../domain/usecases/login_user_use_case.dart';
import '../../domain/usecases/register_auth_use_case.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterAuthUseCase _registerAuthUseCase;
  final RegisterUseCase _registerUseCase;
  final LoginUserUseCase _loginUserUseCase;
  final GetProfileUseCase _getProfileUseCase;

  AuthCubit(
    this._registerAuthUseCase,
    this._registerUseCase,
    this._loginUserUseCase,
    this._getProfileUseCase,
  ) : super(AuthInitial());

  Future<void> registerAuth(LoginRequest request) async {
    emit(RegisterAuthLoading());
    final result = await _registerAuthUseCase(request);
    result.result.fold(
      (failure) => emit(RegisterAuthError(failure.toString())),
      (data) {
        emit(RegisterAuthSuccess(data));
      },
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

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final result = await _getProfileUseCase(NoParams());
    result.result.fold((failure) => emit(ProfileError(failure.toString())), (
      data,
    ) {
      if (data.email.isEmpty) {
        emit(ProfileError("No profile"));
      }

      return emit(ProfileSuccess(data));
    });
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await _loginUserUseCase(request);
    result.result.fold((failure) => emit(LoginError(failure.toString())), (
      data,
    ) {
      emit(LoginSuccess(data));
    });
  }

  Future<void> logout() async {
    await SharedPrefHelper.removeData(AppConstants.tokenKey);
    emit(LogoutSuccess());
  }
}
