import '../../models/cart_local_model.dart';

abstract class CartLocalDataSource {
  Future<CartResponseLocalModel> getCartItemsLocal(String id);
  Future<void> cacheCartItemsLocal(CartResponseLocalModel cart,String id);
}
