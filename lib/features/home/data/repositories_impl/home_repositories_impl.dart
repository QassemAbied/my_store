import 'package:my_store/core/error/failures.dart';
import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/features/home/data/data_source/remote_data_source.dart';
import 'package:my_store/core/common_models/entities/product_entities.dart';
import 'package:my_store/features/home/domain/repositories/home_repositories.dart';

import '../../domain/entities/product_param.dart';
import '../../../../core/common_models/mapper/product_mapper.dart';

class HomeRepositoriesImpl implements HomeRepositories{
  final RemoteDataSource remoteDataSource;

  HomeRepositoriesImpl(this.remoteDataSource);
  @override
  Future<ApiResult<ProductResponseEntity>> getProducts(ProductParams params) async{
    try {
      final result = await remoteDataSource.getProducts(params);
      final productEntities = ProductMapper.productResponseItemEntity(result);
      return ApiResult.success(productEntities);
    } catch (e) {
      return ApiResult.failure((ServerFailure()) );
    }

  }
}