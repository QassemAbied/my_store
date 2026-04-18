import 'package:my_store/core/network/use_case.dart';
import '../../../../core/network/api_result.dart';
import '../entities/address_entities.dart';
import '../repository.dart';

class GetAddressUseCase extends UseCase<AddressResponseEntity, NoParams> {
  final AddressRepository _addressRepository;

  GetAddressUseCase(this._addressRepository);

  @override
  Future<ApiResult<AddressResponseEntity>> call(NoParams params) async {
    return await _addressRepository.getAddresses();
  }
}
