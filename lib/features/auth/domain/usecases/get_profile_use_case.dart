import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../entities/customer_entity.dart';
import '../repository.dart';

class GetProfileUseCase extends UseCase<CustomerEntity, NoParams> {
  final AuthRepository _authRepository;
  GetProfileUseCase(this._authRepository);

  @override
  Future<ApiResult<CustomerEntity>> call(NoParams params) async {
    return await _authRepository.getProfile();
  }
}
