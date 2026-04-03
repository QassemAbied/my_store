import 'package:my_store/core/error/failures.dart';
import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/features/home/data/data_source/remote_data_source.dart';
import 'package:my_store/features/home/domain/entities/product_entities.dart';
import 'package:my_store/features/home/domain/repositories/home_repositories.dart';

import '../../domain/mappers/product_mapper.dart';

class HomeRepositoriesImpl implements HomeRepositories{
  final RemoteDataSource remoteDataSource;

  HomeRepositoriesImpl(this.remoteDataSource);
  @override
  Future<ApiResult<ProductResponseEntity>> getProducts() async{
    try {
      final result = await remoteDataSource.getProducts();
      final productEntities = ProductMapper.productResponseItemEntity(result);
      return ApiResult.success(productEntities);
    } catch (e) {
      return ApiResult.failure((ServerFailure()) );
    }

  }
}