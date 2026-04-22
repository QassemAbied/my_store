import 'package:my_store/core/network/api_result.dart';

import 'entitiy/order_review_entities.dart';

abstract class OrderRepository {
  Future<ApiResult<OrderReviewEntity>> getOrderReview(String orderId);
}
