import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../entities/params.dart';
import '../repository.dart';

class AddAddressUseCase extends UseCase<void, CreateAddressParams> {
  final CartRepository _cartRepository;

  AddAddressUseCase(this._cartRepository);

  @override
  Future<ApiResult<void>> call(CreateAddressParams params) async {
    return await _cartRepository.addAddress(params);
  }
}