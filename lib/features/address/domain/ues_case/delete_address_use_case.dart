import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../repository.dart';

class DeleteAddressUseCase extends UseCase<void, String> {
  final AddressRepository _addressRepository;

  DeleteAddressUseCase(this._addressRepository);

  @override
  Future<ApiResult<void>> call(String addressId) async {
    return await _addressRepository.deleteAddress(addressId);
  }
}