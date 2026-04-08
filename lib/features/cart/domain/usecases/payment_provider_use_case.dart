import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../entities/payment_provider_entities.dart';
import '../repository.dart';

class PaymentProviderUseCase extends UseCase<PaymentProvidersResponseEntity, String> {
  final CartRepository _cartRepository;
  PaymentProviderUseCase(this._cartRepository);
  @override
  Future<ApiResult<PaymentProvidersResponseEntity>> call(String params) async {
    return await _cartRepository.getPaymentProviders(params);
  }
}