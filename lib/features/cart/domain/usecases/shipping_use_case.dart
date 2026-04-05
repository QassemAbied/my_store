import 'package:my_store/features/cart/domain/entities/shipping_entites.dart';

import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../repository.dart';

class ShippingUseCase extends UseCase<ShippingEntity, String> {
  final CartRepository _cartRepository;
  ShippingUseCase(this._cartRepository);
  @override
  Future<ApiResult<ShippingEntity>> call(String params) async {
    return await _cartRepository.getShippingOptions(params);
  }
}