import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/features/home/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:my_store/core/common_models/entities/product_entities.dart';
import 'package:my_store/features/home/domain/repositories/home_repositories.dart';
import '../../../../core/common_models/mapper/product_local_mapper.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product_param.dart';
import '../../../../core/common_models/mapper/product_mapper.dart';
import '../data_source/local_data_sourece/local_data_source.dart';

class HomeRepositoriesImpl implements HomeRepositories {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  HomeRepositoriesImpl(
      this.remoteDataSource,
      this._localDataSource,
      this._networkInfo,
      );
  @override
  Future<ApiResult<ProductResponseEntity>> getProducts(
    ProductParams params,
  ) async {
    if(await _networkInfo.isServerAlive){
      try {
        final result = await remoteDataSource.getProducts(params);
        final productEntities = ProductMapper.productResponseItemEntity(result);
        final productLocal = ProductLocalMapper.toLocalModel(result);

        await _localDataSource.cacheProducts(productLocal);
        print('productEntities  ${productEntities.products?.length}');
        return ApiResult.success(productEntities);
      } catch (e) {
        try {
          final cachedProducts = await _localDataSource.getProducts();

          final cachedEntities = ProductLocalMapper.toEntity(cachedProducts);
          print('cachedProducts  ${cachedProducts.products?.length}');
          return ApiResult.success(cachedEntities);
        } catch (e) {
          return ApiResult.failure(ErrorHandler.handle(e));
        }
      }
    }else{
      try {

        final cachedProducts =
        await _localDataSource
            .getProducts();

        final cachedEntities =
        ProductLocalMapper
            .toEntity(cachedProducts);
        print('cachedEntities2  ${cachedEntities.products?.length}');

        return ApiResult.success(
            cachedEntities);

      } catch (e) {

        return ApiResult.failure(
            ErrorHandler.handle(e));
      }
    }

  }
}
