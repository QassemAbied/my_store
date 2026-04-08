import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/features/cart/domain/entities/cart_item.dart';

import 'entities/address_entities.dart';
import 'entities/params.dart';
import 'entities/payment_provider_entities.dart';
import 'entities/shipping_entites.dart';

abstract class CartRepository {
  Future<ApiResult<String>> getRegions();
  Future<ApiResult<String>> createCart(Map<String, dynamic> body);
  Future<ApiResult<CartResponseEntity>> getCartItems(String id);

  Future<ApiResult<void>> addToCart(AddCartRequest request);
  Future<ApiResult<void>> deleteCartItem(DeleteCartParams params);
  Future<ApiResult<void>> updateCartItem(UpdateCartParams params);
  Future<ApiResult<ShippingEntity>> getShippingOptions(String cartId);
  Future<ApiResult<void>> addShippingOptions(AddShippingOptionParams params);
  Future<ApiResult<void>> completeCart(String cartId);



  Future<ApiResult<AddressResponseEntity>> getAddresses();
  Future<ApiResult<void>> addAddress(CreateAddressParams body);
  Future<ApiResult<void>> deleteAddress(String addressId);


  Future<ApiResult<CartResponseEntity>> addShippingAddress(
      ShippingAddressCartRequest request,
      );

  Future<ApiResult<PaymentProvidersResponseEntity>>
  getPaymentProviders(String regionId);
}
