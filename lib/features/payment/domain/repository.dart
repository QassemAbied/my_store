import 'package:my_store/core/network/api_result.dart';
import '../../orders/domain/entitiy/order_review_entities.dart';
import 'entities/payment_collection.dart';
import 'entities/payment_provider_entities.dart';
import 'entities/payment_session.dart';
import 'entities/payment_session_input.dart';

abstract class PaymentRepository {
  Future<ApiResult<PaymentProvidersResponseEntity>> getPaymentProviders(
    String regionId,
  );

  Future<ApiResult<PaymentSession>> createPaymentSession(
    PaymentSessionInput paymentSessionInput,
  );
  Future<ApiResult<OrderReviewEntity>> completeOrder(String cartId);
  Future<ApiResult<PaymentCollectionResponseEntity>> createPaymentCollection(
    String cartId,
  );
}
