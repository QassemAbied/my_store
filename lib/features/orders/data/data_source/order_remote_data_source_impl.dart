import 'package:my_store/features/orders/data/models/order_list_model.dart';

import '../../../../core/network/rest_client.dart';
import '../models/order_review_model.dart';
import 'order_remote_data_source.dart';

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final RestClient _restClient;

  OrderRemoteDataSourceImpl(this._restClient);

  @override
  Future<OrderReviewResponseModel> getOrderReview(String orderId) async {
    return await _restClient.getOrderDetails(orderId);
  }

  @override
  Future<OrdersResponseModel> getOrderList() async{
    return await _restClient.getOrderList();
  }
}
