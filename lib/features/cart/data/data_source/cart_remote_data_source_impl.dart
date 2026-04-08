import 'package:my_store/core/network/rest_client.dart';
import 'package:my_store/features/cart/data/models/address_model.dart';
import 'package:my_store/features/cart/data/models/cart_item_model.dart';
import 'package:my_store/features/cart/data/models/payment_provider_model.dart';
import 'package:my_store/features/cart/data/models/shipping_model.dart';
import 'package:my_store/features/cart/domain/entities/params.dart';
import 'cart_remote_data_source.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final RestClient _restClient;

  CartRemoteDataSourceImpl(this._restClient);

  @override
  Future<String> getRegions() async {
    return await _restClient.getRegions();
  }

  @override
  Future<String> createCart(Map<String, dynamic> body) async {
    return await _restClient.createCart(body);
  }

  @override
  Future<CartResponseModel> getCartItems(String id) async {
    return await _restClient.getCart(id);
  }

  @override
  Future<void> addToCart(AddCartRequest request) async {
    return await _restClient.addCart(request.cartId, request.body);
  }

  @override
  Future<void> deleteCartItem(DeleteCartParams params) async {
    return await _restClient.deleteCartItem(params.cartId, params.lineId);
  }

  @override
  Future<void> updateCartItem(UpdateCartParams params) async {
    return await _restClient.updateCartItem(
      params.cartId,
      params.lineId,
      params.body,
    );
  }

  @override
  Future<ShippingResponseModel> getShippingOptions(String cartId) async {
    return await _restClient.getShippingOptions(cartId);
  }

  @override
  Future<void> addShippingOptions(AddShippingOptionParams params) async {
    return await _restClient.addShippingMethod(params.cartId, params.body);
  }
  @override
  Future<void> completeCart(String cartId) async {
    await _restClient.completeCart(cartId);
  }

  @override
  Future<void> addAddress(CreateAddressParams body)async {
    return await _restClient.addAddress({
      "first_name": body.firstName,
      "last_name": body.lastName,
      "phone": body.phone,
      "address_1":  body.address1,
      "address_2": body.address2,
      "city": body.city,
      "country_code": body.countryCode,


    });
  }

  @override
  Future<void> deleteAddress(String addressId)async {
    await _restClient.deleteAddress(addressId);
  }

  @override
  Future<AddressResponseModel> getAddresses()async {
    return await _restClient.getAddresses();
  }

  @override
  Future<CartResponseModel> addShippingAddress(
      ShippingAddressCartRequest request)async {
    return await _restClient.addShippingAddress(
      request.cartId,
        {
          "shipping_address": {
            "first_name": request.body.firstName,
            "last_name":  request.body.lastName,
            "address_1":  request.body.address1,
            "city":  request.body.city,
            "country_code":  request.body.countryCode,
          }
        }
    );
  }

  @override
  Future<PaymentProvidersResponseModel>
  getPaymentProviders(String regionId) async{
   return await _restClient.getPaymentProviders(regionId);
  }
}
