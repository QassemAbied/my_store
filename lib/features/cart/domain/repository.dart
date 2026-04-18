import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/features/cart/domain/entities/cart_item.dart';

import '../../address/domain/entities/address_entities.dart';
import 'entities/params.dart';
import 'entities/payment_provider_entities.dart';
import '../../shipping/domain/entities/shipping_entites.dart';

abstract class CartRepository {
  Future<ApiResult<String>> getRegions();
  Future<ApiResult<String>> createCart(Map<String, dynamic> body);
  Future<ApiResult<CartResponseEntity>> getCartItems(String id);

  Future<ApiResult<void>> addToCart(AddCartRequest request);
  Future<ApiResult<void>> deleteCartItem(DeleteCartParams params);
  Future<ApiResult<void>> updateCartItem(UpdateCartParams params);

  Future<ApiResult<void>> completeCart(String cartId);







  Future<ApiResult<PaymentProvidersResponseEntity>>
  getPaymentProviders(String regionId);
}
