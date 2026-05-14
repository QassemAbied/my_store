import '../../models/order_list_local_mode.dart';
import '../../models/order_review_local_model.dart';

abstract class OrderLocalDataSource {

  Future<void> cacheOrderReview(OrderReviewResponseLocalModel order);

  Future<OrderReviewResponseLocalModel> getOrderReviewLocal(String orderId);

  Future<void> cacheOrdersList(OrdersResponseLocalModel orders);

  Future<OrdersResponseLocalModel> getOrdersListLocal();
}
