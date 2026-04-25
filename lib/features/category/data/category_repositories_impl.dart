import 'package:my_store/core/common_models/entities/product_entities.dart';
import 'package:my_store/core/error/failures.dart';
import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/features/category/data/data_source/category_remote_data_source.dart';
import 'package:my_store/features/category/domain/entities/category_entities.dart';
import 'package:my_store/features/category/domain/entities/product_by_category_request.dart';
import 'package:my_store/features/category/domain/mapper/category_mapper.dart';

import '../../../core/common_models/mapper/product_mapper.dart';
import '../domain/category_repositories.dart';

class CategoryRepositoriesImpl implements CategoryRepositories {
  final CategoryRemoteDataSource _categoryRemoteDataSource;

  CategoryRepositoriesImpl(this._categoryRemoteDataSource);

  @override
  Future<ApiResult<List<CategoryEntities>>> getCategories() async {
    try {
      final response = await _categoryRemoteDataSource.getCategories();
      final categories = CategoryMapper.toEntityList(response);
      return ApiResult.success(categories);
    } catch (error) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<ProductResponseEntity>> getProductsByCategory(
    ProductByCategoryRequest request,
  ) async {
    try {
      final response = await _categoryRemoteDataSource.getProductsByCategory(
        request,
      );
      final products = ProductMapper.productResponseItemEntity(response);
      return ApiResult.success(products);
    } catch (error) {
      return ApiResult.failure(ServerFailure());
    }
  }
}
