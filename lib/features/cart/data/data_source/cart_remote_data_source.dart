import 'package:my_store/features/cart/data/models/cart_item_model.dart';
import 'package:my_store/features/cart/domain/entities/params.dart';

import '../models/address_model.dart';
import '../models/shipping_model.dart';

abstract class CartRemoteDataSource {
  Future<String> getRegions();
  Future<String> createCart(Map<String, dynamic> body);
  Future<CartResponseModel> getCartItems(String id);
  Future<void> addToCart(AddCartRequest request);
  Future<void> deleteCartItem(DeleteCartParams params);
  Future<void> updateCartItem(UpdateCartParams params);
  Future<ShippingResponseModel> getShippingOptions(String cartId);
  Future<void> addShippingOptions(AddShippingOptionParams params);
  Future<void> completeCart(String cartId);

  Future<AddressResponseModel> getAddresses();
  Future<void> addAddress(CreateAddressParams body);
  Future<void> deleteAddress(String addressId);
}
