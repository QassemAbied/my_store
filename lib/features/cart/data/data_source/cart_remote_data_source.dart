import 'package:my_store/features/cart/data/models/cart_item_model.dart';
import 'package:my_store/features/cart/domain/entities/add_cart_request.dart';

import '../models/regions_model.dart';

abstract class CartRemoteDataSource {
  Future<String> getRegions();
  Future<String> createCart(Map<String, dynamic> body);

  Future<CartResponseModel> getCartItems(String id);
  Future<void> addToCart(AddCartRequest request);
}
