import '../../../orders/data/models/order_review_model.dart';
import '../../domain/entities/payment_session_input.dart';
import '../models/payment_collection_model.dart';
import '../models/payment_provider_model.dart';
import '../models/payment_session_model.dart';

abstract class RemotePaymentDataSource {
  Future<PaymentProvidersResponseModel> getPaymentProviders(String regionId);
  Future<PaymentSessionResponseModel> createPaymentSession(
      PaymentSessionInput paymentSessionInput,
      );
  Future<OrderReviewResponseModel> completeOrder(String cartId);
  Future<PaymentCollectionResponse> createPaymentCollection(String cartId);
}
