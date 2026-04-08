import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../entities/cart_item.dart';
import '../entities/params.dart';
import '../repository.dart';

class AddShippingAddressUseCase extends UseCase<CartResponseEntity, ShippingAddressCartRequest> {
  final CartRepository _cartRepository;
  AddShippingAddressUseCase(this._cartRepository);
  @override
  Future<ApiResult<CartResponseEntity>> call( params) async {
    return await _cartRepository.addShippingAddress(params);
  }
}