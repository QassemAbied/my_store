import '../../../core/network/api_result.dart';
import '../../cart/domain/entities/cart_item.dart';
import '../../cart/domain/entities/params.dart';
import 'entities/shipping_entites.dart';
import 'entities/shipping_request.dart';


abstract class ShippingRepository{
  Future<ApiResult<ShippingEntity>> getShippingOptions(String cartId);
  Future<ApiResult<void>> addShippingOptions(AddShippingOptionParams params);
  Future<ApiResult<CartResponseEntity>> addShippingAddress(
      ShippingAddressCartRequest request,
      );

}