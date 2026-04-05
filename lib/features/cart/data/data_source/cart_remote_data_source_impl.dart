import 'package:my_store/core/network/rest_client.dart';
import 'package:my_store/features/cart/data/models/cart_item_model.dart';
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
}
