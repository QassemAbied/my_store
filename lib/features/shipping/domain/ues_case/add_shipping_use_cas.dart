import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../entities/shipping_request.dart';
import '../repository.dart';

class AddShippingUseCas extends UseCase<void, AddShippingOptionParams> {
  final ShippingRepository _shippingRepository;
  AddShippingUseCas(this._shippingRepository);
  @override
  Future<ApiResult<void>> call(AddShippingOptionParams params) async {
    return await _shippingRepository.addShippingOptions(params);
  }
}