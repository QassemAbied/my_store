import 'package:my_store/features/cart/domain/entities/params.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../repository.dart';

class DeleteCartUseCase extends UseCase<void, DeleteCartParams> {
  final CartRepository _cartRepository;
  DeleteCartUseCase(this._cartRepository);
  @override
  Future<ApiResult<void>> call(DeleteCartParams params) async {
    return await _cartRepository.deleteCartItem(params);
  }
}
