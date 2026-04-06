import 'package:my_store/features/auth/domain/entities/customer_entity.dart';
import 'package:my_store/features/auth/domain/entities/requests.dart';
import 'package:my_store/features/auth/domain/repository.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';

class RegisterUseCase extends UseCase<CustomerEntity, RegisterRequest> {
  final AuthRepository _authRepository;
  RegisterUseCase(this._authRepository);

  @override
  Future<ApiResult<CustomerEntity>> call(RegisterRequest params) async {
    return await _authRepository.register(params);
  }
}
