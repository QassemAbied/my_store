import '../../../core/error/error_handler.dart';
import '../../../core/network/api_result.dart';
import '../../../core/network/network_info.dart';
import '../domain/entitiy/order_list_entitiy.dart';
import '../domain/entitiy/order_review_entities.dart';
import '../domain/mapper/order_list_local_mapper.dart';
import '../domain/mapper/order_list_mapper.dart';
import '../domain/mapper/order_review_local_mapper.dart';
import '../domain/mapper/order_review_mapper.dart';
import '../domain/repository.dart';
import 'data_source/local_data_source/order_local_data_source.dart';
import 'data_source/remoter_data_source/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource _remote;

  final OrderLocalDataSource _local;

  final NetworkInfo _networkInfo;

  OrderRepositoryImpl(this._remote, this._local, this._networkInfo);

  // =========================
  // Order Review
  // =========================

  @override
  Future<ApiResult<OrderReviewEntity>> getOrderReview(String orderId) async {
    if (await _networkInfo.isServerAlive) {
      try {
        final res = await _remote.getOrderReview(orderId);

        final localModel = OrderReviewLocalMapper.toLocalModel(res);

        await _local.cacheOrderReview(localModel);

        return ApiResult.success(res.order.toEntity());
      } catch (e) {
        try {
          final cached = await _local.getOrderReviewLocal(orderId);

          final entity = OrderReviewLocalMapper.toLocalEntity(cached);

          return ApiResult.success(entity);
        } catch (_) {
          return ApiResult.failure(ErrorHandler.handle(e));
        }
      }
    } else {
      try {
        final cached = await _local.getOrderReviewLocal(orderId);

        final entity = OrderReviewLocalMapper.toLocalEntity(cached);

        return ApiResult.success(entity);
      } catch (e) {
        return ApiResult.failure(ErrorHandler.handle(e));
      }
    }
  }

  // =========================
  // Orders List
  // =========================

  @override
  Future<ApiResult<OrdersEntity>> getOrderList() async {
    if (await _networkInfo.isServerAlive) {
      try {
        final res = await _remote.getOrderList();

        final localModel = OrdersLocalMapper.toLocalModel(res);

        await _local.cacheOrdersList(localModel);

        return ApiResult.success(res.toEntity());
      } catch (e) {
        try {
          final cached = await _local.getOrdersListLocal();

          final entity = OrdersLocalMapper.toLocalEntity(cached);

          return ApiResult.success(entity);
        } catch (_) {
          return ApiResult.failure(ErrorHandler.handle(e));
        }
      }
    } else {
      try {
        final cached = await _local.getOrdersListLocal();

        final entity = OrdersLocalMapper.toLocalEntity(cached);

        return ApiResult.success(entity);
      } catch (e) {
        return ApiResult.failure(ErrorHandler.handle(e));
      }
    }
  }
}
