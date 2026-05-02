import '../models/order_list_model.dart';
import '../models/order_review_model.dart';

abstract class OrderRemoteDataSource {
  Future<OrderReviewResponseModel> getOrderReview(String orderId);
  Future<OrdersResponseModel> getOrderList();

}
