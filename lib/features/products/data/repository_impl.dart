import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/features/products/domain/entities/product_details_entities.dart';
import 'package:my_store/features/products/domain/entities/product_details_request.dart';
import '../../../core/error/failures.dart';
import '../domain/mappers/product_details_mapper.dart';
import '../domain/repository.dart';
import 'data_source/product_details_remote_data_source.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository{
  final ProductDetailsRemoteDataSource _productDetailsRemoteDataSource;

  ProductDetailsRepositoryImpl(this._productDetailsRemoteDataSource);
  @override
  Future<ApiResult<ProductDetailsEntities>> getProductDetails(ProductDetailsRequest params) async{
    try {
      final res = await _productDetailsRemoteDataSource.getProductDetails(params);
      final productDetailsEntities = ProductDetailsMapper.toEntity(res);
      return ApiResult.success(productDetailsEntities);
    } catch (e) {
      return ApiResult.failure(ServerFailure());
    }


  }

}