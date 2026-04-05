import 'package:my_store/features/cart/data/models/cart_item_model.dart';
import 'package:my_store/features/cart/domain/entities/params.dart';

abstract class CartRemoteDataSource {
  Future<String> getRegions();
  Future<String> createCart(Map<String, dynamic> body);
  Future<CartResponseModel> getCartItems(String id);
  Future<void> addToCart(AddCartRequest request);
  Future<void> deleteCartItem(DeleteCartParams params);
  Future<void> updateCartItem(UpdateCartParams params);
}
