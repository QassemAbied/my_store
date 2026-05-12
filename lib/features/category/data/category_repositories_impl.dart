import 'package:my_store/core/common_models/entities/product_entities.dart';
import 'package:my_store/core/common_models/mapper/product_local_mapper.dart';
import 'package:my_store/core/common_models/mapper/product_mapper.dart';
import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/core/error/error_handler.dart';
import 'package:my_store/core/network/network_info.dart';

import 'package:my_store/features/category/data/data_source/local_data_source/category_local_data_source.dart';
import 'package:my_store/features/category/data/data_source/remote_data_source/category_remote_data_source.dart';

import 'package:my_store/features/category/domain/entities/category_entities.dart';
import 'package:my_store/features/category/domain/entities/product_by_category_request.dart';

import 'package:my_store/features/category/domain/mapper/category_local_mapper.dart';
import 'package:my_store/features/category/domain/mapper/category_mapper.dart';

import '../domain/category_repositories.dart';

class CategoryRepositoriesImpl implements CategoryRepositories {

  final CategoryRemoteDataSource
  _categoryRemoteDataSource;

  final CategoryLocalDataSource
  _categoryLocalDataSource;
  final NetworkInfo _networkInfo;

  CategoryRepositoriesImpl(
      this._categoryRemoteDataSource,
      this._categoryLocalDataSource,
      this._networkInfo,
      );

  @override
  Future<ApiResult<List<CategoryEntities>>>
  getCategories() async {
    if(await _networkInfo.isServerAlive){
      try {

        final response =
        await _categoryRemoteDataSource
            .getCategories();

        final categories =
        CategoryMapper.toEntityList(
            response);

        final localCategories =
        CategoryLocalMapper.toLocalModel(
            response);

        await _categoryLocalDataSource
            .cacheCategoriesLocal(
            localCategories);

        return ApiResult.success(categories);

      } catch (e) {

        try {

          final cachedCategories =
          await _categoryLocalDataSource
              .getCategoriesLocal();

          final entities =
          CategoryLocalMapper.toEntityList(
              cachedCategories);

          return ApiResult.success(entities);

        } catch (_) {

          return ApiResult.failure(
            ErrorHandler.handle(e),
          );
        }
      }
    }else{
      try{
        final cachedCategories =
        await _categoryLocalDataSource
            .getCategoriesLocal();

        final entities =
        CategoryLocalMapper.toEntityList(
            cachedCategories);

        return ApiResult.success(entities);
      }catch(e){
        return ApiResult.failure(
          ErrorHandler.handle(e),
        );
      }
    }


  }

  @override
  Future<ApiResult<ProductResponseEntity>>
  getProductsByCategory(
      ProductByCategoryRequest request,
      ) async {
    if(await _networkInfo.isServerAlive){
      try {

        final response =
        await _categoryRemoteDataSource
            .getProductsByCategory(
            request);

        final products =
        ProductMapper
            .productResponseItemEntity(
            response);

        final localProducts =
        ProductLocalMapper
            .toLocalModel(response);

        await _categoryLocalDataSource.cacheProductsByCategoryLocal(

          localProducts,
          request.categoryId,
        );

        return ApiResult.success(products);

      } catch (e) {

        try {

          final cachedProducts =
          await _categoryLocalDataSource
              .getProductsByCategoryLocal(
              request.categoryId);

          final entities =
          ProductLocalMapper.toEntity(
              cachedProducts);

          return ApiResult.success(entities);

        } catch (_) {

          return ApiResult.failure(
            ErrorHandler.handle(e),
          );
        }
      }
    }else{
      try {

        final cachedProducts =
        await _categoryLocalDataSource
            .getProductsByCategoryLocal(
            request.categoryId);

        final entities =
        ProductLocalMapper.toEntity(
            cachedProducts);

        return ApiResult.success(entities);

      } catch (e) {

        return ApiResult.failure(
          ErrorHandler.handle(e),
        );
      }
    }

  }
}