import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../../../cart/domain/entities/cart_item.dart';
import '../entities/shipping_request.dart';
import '../repository.dart';

class AddShippingAddressUseCase extends UseCase<CartResponseEntity, ShippingAddressCartRequest> {
  final ShippingRepository _shippingRepository;
  AddShippingAddressUseCase(this._shippingRepository);
  @override
  Future<ApiResult<CartResponseEntity>> call( params) async {
    return await _shippingRepository.addShippingAddress(params);
  }
}