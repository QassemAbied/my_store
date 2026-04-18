import 'package:my_store/features/shipping/domain/entities/shipping_entites.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../repository.dart';

class ShippingUseCase extends UseCase<ShippingEntity, String> {
  final ShippingRepository _shippingRepository;
  ShippingUseCase(this._shippingRepository);
  @override
  Future<ApiResult<ShippingEntity>> call(String params) async {
    return await _shippingRepository.getShippingOptions(params);
  }
}