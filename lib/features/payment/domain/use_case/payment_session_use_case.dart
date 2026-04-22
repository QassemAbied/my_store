import 'package:my_store/features/payment/domain/entities/payment_session_input.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../entities/payment_session.dart';
import '../repository.dart';

class PaymentSessionUseCase
    extends UseCase<PaymentSession, PaymentSessionInput> {
  final PaymentRepository _paymentRepository;
  PaymentSessionUseCase(this._paymentRepository);
  @override
  Future<ApiResult<PaymentSession>> call(PaymentSessionInput params) async {
    return await _paymentRepository.createPaymentSession(params);
  }
}
