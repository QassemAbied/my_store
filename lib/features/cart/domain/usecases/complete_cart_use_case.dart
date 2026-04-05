import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../repository.dart';

class CompleteCartUseCase extends UseCase<void, String> {
  final CartRepository repository;

  CompleteCartUseCase(this.repository);

  @override
  Future<ApiResult<void>> call(String cartId) async {
    return await repository.completeCart(cartId);
  }
}