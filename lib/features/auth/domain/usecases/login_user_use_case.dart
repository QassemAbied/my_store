import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../entities/auth_entity.dart';
import '../entities/requests.dart';
import '../repository.dart';

class LoginUserUseCase extends UseCase<AuthEntity, LoginRequest> {
  final AuthRepository _authRepository;
  LoginUserUseCase(this._authRepository);

  @override
  Future<ApiResult<AuthEntity>> call(LoginRequest params) async {
    return await _authRepository.login(params);
  }
}
