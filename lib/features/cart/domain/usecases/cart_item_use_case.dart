import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/core/network/use_case.dart';
import 'package:my_store/features/cart/domain/entities/cart_item.dart';

import '../repository.dart';

class CartItemUseCase  extends UseCase<CartResponseEntity, String>{
  final CartRepository _cartRepository;
  CartItemUseCase(this._cartRepository);
  @override
  Future<ApiResult<CartResponseEntity>> call(String params)async {
    return await _cartRepository.getCartItems(params);

  }

}