import '../../../core/error/failures.dart';
import '../../../core/network/api_result.dart';
import '../../cart/domain/entities/cart_item.dart';
import '../../cart/domain/mappers/cart_item_mapper.dart';
import '../domain/entities/shipping_entites.dart';
import '../domain/entities/shipping_request.dart';
import '../domain/mapper/shipping_mapper.dart';
import '../domain/repository.dart';
import 'data_source/remote_data_source.dart';

class ShippingRepositoryImpl implements ShippingRepository{
  final ShippingRemoteDataSource _shippingRemoteDataSource;

  ShippingRepositoryImpl(this._shippingRemoteDataSource);

  @override
  Future<ApiResult<ShippingEntity>> getShippingOptions(String cartId)async {
    try {
      final res = await _shippingRemoteDataSource.getShippingOptions(cartId);
      final shippingEntity = ShippingMapper.toEntity(res);
      return ApiResult.success(shippingEntity);
    } catch (failure) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<void>> addShippingOptions(AddShippingOptionParams params)async {
    try {
      final res =await _shippingRemoteDataSource.addShippingOptions(params);
      return ApiResult.success(res);
    } catch (failure) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<CartResponseEntity>>
  addShippingAddress( request)async {
    try {
      final res = await _shippingRemoteDataSource.addShippingAddress( request);
      final cartResponseEntity = CartMapper.toResponseEntity(res);
      return ApiResult.success(cartResponseEntity);
    } catch (failure) {
      return ApiResult.failure(ServerFailure());
    }
  }
}