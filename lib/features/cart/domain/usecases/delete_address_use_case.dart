import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../repository.dart';

class DeleteAddressUseCase extends UseCase<void, String> {
  final CartRepository _cartRepository;

  DeleteAddressUseCase(this._cartRepository);

  @override
  Future<ApiResult<void>> call(String addressId) async {
    return await _cartRepository.deleteAddress(addressId);
  }
}