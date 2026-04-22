import 'package:my_store/core/network/rest_client.dart';
import 'package:my_store/features/payment/data/data_source/remote_payment_data_source.dart';
import 'package:my_store/features/payment/data/models/payment_collection_model.dart';
import '../../../orders/data/models/order_review_model.dart';
import '../../domain/entities/payment_session_input.dart';
import '../models/payment_provider_model.dart';
import '../models/payment_session_model.dart';

class RemotePaymentDataSourceImpl implements RemotePaymentDataSource {
  final RestClient _restClient;

  RemotePaymentDataSourceImpl(this._restClient);

  @override
  Future<PaymentProvidersResponseModel> getPaymentProviders(
    String regionId,
  ) async {
    return await _restClient.getPaymentProviders(regionId);
  }

  @override
  Future<PaymentSessionResponseModel> createPaymentSession(
    PaymentSessionInput paymentSessionInput,
  ) async {
    return await _restClient.createPaymentSession(
      paymentSessionInput.paymentId,
      {"provider_id": paymentSessionInput.providerId},
    );
  }

  @override
  Future<OrderReviewResponseModel> completeOrder(String cartId) async {
    return await _restClient.completeCart(cartId);
  }

  @override
  Future<PaymentCollectionResponse> createPaymentCollection(
    String cartId,
  ) async {
    return await _restClient.createPaymentCollection({"cart_id": cartId});
  }
}
