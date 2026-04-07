import 'package:my_store/core/network/use_case.dart';
import '../../../../core/network/api_result.dart';
import '../entities/address_entities.dart';
import '../repository.dart';

class GetAddressUseCase extends UseCase<AddressResponseEntity, NoParams> {
  final CartRepository _cartRepository;
  GetAddressUseCase(this._cartRepository);

  @override
  Future<ApiResult<AddressResponseEntity>> call(NoParams params) async {
    return await _cartRepository.getAddresses();
  }
}