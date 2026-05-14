import 'package:hive_ce_flutter/adapters.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/utils/constants.dart';
import '../../models/order_list_local_mode.dart';
import '../../models/order_review_local_model.dart';
import 'order_local_data_source.dart';

class OrderLocalDataSourceImpl implements OrderLocalDataSource {
  final orderReviewBox = Hive.box<OrderReviewResponseLocalModel>(
    AppConstants.orderReviewLocalKey,
  );

  final ordersListBox = Hive.box<OrdersResponseLocalModel>(
    AppConstants.orderLocalKey,
  );

  @override
  Future<void> cacheOrderReview(OrderReviewResponseLocalModel order) async {
    await orderReviewBox.put(order.order.id, order);
  }

  @override
  Future<OrderReviewResponseLocalModel> getOrderReviewLocal(
    String orderId,
  ) async {
    final order = orderReviewBox.get(orderId);

    if (order != null) {
      return order;
    }

    throw CacheException('No Order Review Cached');
  }



  @override
  Future<void> cacheOrdersList(OrdersResponseLocalModel orders) async {
    await ordersListBox.put(AppConstants.orderLocalKey, orders);
  }

  @override
  Future<OrdersResponseLocalModel> getOrdersListLocal() async {
    final orders = ordersListBox.get(AppConstants.orderLocalKey);

    if (orders != null) {
      return orders;
    }

    throw CacheException('No Orders Cached');
  }
}
