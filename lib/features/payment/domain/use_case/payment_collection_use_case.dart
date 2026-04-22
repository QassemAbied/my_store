import 'package:my_store/core/network/use_case.dart';
import '../../../../core/network/api_result.dart';
import '../entities/payment_collection.dart';
import '../repository.dart';

class CreatePaymentCollectionUseCase
    extends UseCase<PaymentCollectionResponseEntity, String> {
  final PaymentRepository repository;

  CreatePaymentCollectionUseCase(this.repository);

  @override
  Future<ApiResult<PaymentCollectionResponseEntity>> call(String cartId) {
    return repository.createPaymentCollection(cartId);
  }
}
