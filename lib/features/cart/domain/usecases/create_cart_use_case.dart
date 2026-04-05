import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../repository.dart';

class CreateCartUseCase extends UseCase<String,Map<String, dynamic>>{
  final CartRepository _cartRepository;
  CreateCartUseCase(this._cartRepository);

  @override
  Future<ApiResult<String>> call(Map<String, dynamic> body)async {
    return await _cartRepository.createCart(body);



  }

}