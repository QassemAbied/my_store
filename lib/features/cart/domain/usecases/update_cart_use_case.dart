import 'package:my_store/features/cart/domain/entities/params.dart';

import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../repository.dart';

class UpdateCartUseCase extends UseCase<void, UpdateCartParams> {
  final CartRepository _cartRepository;
  UpdateCartUseCase(this._cartRepository);
  @override
  Future<ApiResult<void>> call(UpdateCartParams params) async {
    return await _cartRepository.updateCartItem(params);
  }
}
