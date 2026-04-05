import 'package:my_store/core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../entities/params.dart';
import '../repository.dart';

class AddCartUseCase extends UseCase<void, AddCartRequest> {
  final CartRepository _cartRepository;
  AddCartUseCase(this._cartRepository);

  @override
  Future<ApiResult<void>> call(AddCartRequest params) async {
    return await _cartRepository.addToCart(params);
  }
}
