import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/features/payment/domain/entities/payment_collection.dart';
import 'package:my_store/features/payment/domain/entities/payment_provider_entities.dart';
import '../../../core/error/failures.dart';
import '../../orders/domain/entitiy/order_review_entities.dart';
import '../../orders/domain/mapper/order_review_mapper.dart';
import '../domain/entities/payment_session.dart';
import '../domain/entities/payment_session_input.dart';
import '../domain/mappers/payment_collection_mapper.dart';
import '../domain/mappers/payment_provider_mapper.dart';
import '../domain/mappers/payment_session_mapper.dart';
import '../domain/repository.dart';
import 'data_source/remote_payment_data_source.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final RemotePaymentDataSource _remotePaymentDataSource;
  PaymentRepositoryImpl(this._remotePaymentDataSource);
  @override
  Future<ApiResult<PaymentProvidersResponseEntity>> getPaymentProviders(
    String regionId,
  ) async {
    try {
      final res = await _remotePaymentDataSource.getPaymentProviders(regionId);
      final paymentProvidersResponseEntity = PaymentProvidersMapper.toEntity(
        res,
      );
      return ApiResult.success(paymentProvidersResponseEntity);
    } catch (failure) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<PaymentSession>> createPaymentSession(
    PaymentSessionInput paymentSessionInput,
  ) async {
    try {
      final res = await _remotePaymentDataSource.createPaymentSession(
        paymentSessionInput,
      );
      return ApiResult.success(res.toEntity());
    } catch (failure) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<OrderReviewEntity>> completeOrder(String cartId) async {
    try {
      final res = await _remotePaymentDataSource.completeOrder(cartId);
      return ApiResult.success(res.toEntity());
    } catch (e) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<PaymentCollectionResponseEntity>> createPaymentCollection(
    String cartId,
  ) async {
    try {
      final res = await _remotePaymentDataSource.createPaymentCollection(
        cartId,
      );
      final paymentCollection = res.toEntity();
      return ApiResult.success(paymentCollection);
    } catch (e) {
      return ApiResult.failure(ServerFailure());
    }
  }
}
