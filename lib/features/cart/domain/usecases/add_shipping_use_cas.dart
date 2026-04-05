import 'package:my_store/features/cart/domain/entities/params.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../repository.dart';

class AddShippingUseCas extends UseCase<void, AddShippingOptionParams> {
  final CartRepository _cartRepository;
  AddShippingUseCas(this._cartRepository);
  @override
  Future<ApiResult<void>> call(AddShippingOptionParams params) async {
    return await _cartRepository.addShippingOptions(params);
  }
}