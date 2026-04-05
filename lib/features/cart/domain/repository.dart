import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/features/cart/domain/entities/cart_item.dart';


abstract class CartRepository {
  Future<ApiResult<String >> getRegions();
  Future<ApiResult<String >> createCart(Map<String, dynamic> body);
  Future<ApiResult<CartResponseEntity >> getCartItems(String id);
}