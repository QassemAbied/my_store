import '../models/order_review_model.dart';

abstract class OrderRemoteDataSource {
  Future<OrderReviewResponseModel> getOrderReview(String orderId);
}
