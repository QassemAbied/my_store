import 'package:my_store/features/orders/domain/entitiy/order_list_entitiy.dart';

import '../../../core/error/failures.dart';
import '../../../core/network/api_result.dart';
import '../domain/entitiy/order_review_entities.dart';
import '../domain/mapper/order_list_mapper.dart';
import '../domain/mapper/order_review_mapper.dart';
import '../domain/repository.dart';
import 'data_source/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource _remote;

  OrderRepositoryImpl(this._remote);

  @override
  Future<ApiResult<OrderReviewEntity>> getOrderReview(String orderId) async {
    try {
      final res = await _remote.getOrderReview(orderId);

      return ApiResult.success(res.order.toEntity());
    } catch (failure) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<OrdersEntity>> getOrderList() async {
    try {
      final res = await _remote.getOrderList();

      return ApiResult.success(res.toEntity());
    } catch (failure) {
      return ApiResult.failure(ServerFailure());
    }
  }
}
