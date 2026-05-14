import 'package:hive_ce_flutter/adapters.dart';
import 'package:my_store/core/utils/constants.dart';
import 'package:my_store/features/cart/data/models/cart_local_model.dart';
import '../../../../../core/error/exceptions.dart';
import 'cart_local_data_source.dart';

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final cartBox = Hive.box<CartResponseLocalModel>(AppConstants.cartLocalKey);
  @override
  Future<void> cacheCartItemsLocal(CartResponseLocalModel cart,String id) async {
    return await cartBox.put(id, cart);
  }

  @override
  Future<CartResponseLocalModel> getCartItemsLocal(String id) async {
    final carts = cartBox.get(id);

    if (carts != null) {
      return carts;
    } else {
       throw CacheException('No cart cached');
    }
  }
}
