import '../../../../core/network/rest_client.dart';
import '../models/order_review_model.dart';
import 'order_remote_data_source.dart';

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final RestClient _restClient;

  OrderRemoteDataSourceImpl(this._restClient);

  @override
  Future<OrderReviewResponseModel> getOrderReview(String orderId) async {
    return await _restClient.getOrder(orderId);
  }
}
