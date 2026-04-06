import 'package:my_store/features/auth/domain/entities/auth_entity.dart';
import 'package:my_store/features/auth/domain/entities/requests.dart';
import 'package:my_store/features/auth/domain/repository.dart';

import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';

class RegisterAuthUseCase extends UseCase<AuthEntity, LoginRequest> {
  final AuthRepository _authRepository;
  RegisterAuthUseCase(this._authRepository);

  @override
  Future<ApiResult<AuthEntity>> call(LoginRequest params) async {
    return await _authRepository.registerAuth(params);
  }
}
