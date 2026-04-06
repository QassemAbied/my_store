import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/auth/domain/entities/requests.dart';
import 'package:my_store/features/auth/presentation/cubit/auth_state.dart';
import '../../domain/usecases/register_auth_use_case.dart';

class AuthCubit  extends Cubit<AuthState>{
  final RegisterAuthUseCase registerAuthUseCase;
  AuthCubit(this.registerAuthUseCase) : super(AuthInitial());


  Future<void> registerAuth(LoginRequest request) async {
    emit(RegisterAuthLoading());
    final result = await registerAuthUseCase(request);
result.result.fold((failure)=>emit(RegisterAuthError(failure.toString())),
    (data)=>emit(RegisterAuthSuccess(data)),
    );
  }


}