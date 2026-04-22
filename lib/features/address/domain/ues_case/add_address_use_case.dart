import 'package:my_store/features/address/domain/repository.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../entities/address_request.dart';

class AddAddressUseCase extends UseCase<void, CreateAddressParams> {
  final AddressRepository _addressRepository;

  AddAddressUseCase(this._addressRepository);

  @override
  Future<ApiResult<void>> call(CreateAddressParams params) async {
    return await _addressRepository.addAddress(params);
  }
}
