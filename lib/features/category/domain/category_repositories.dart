import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/features/category/domain/entities/category_entities.dart';

import '../../../core/common_models/entities/product_entities.dart';
import 'entities/product_by_category_request.dart';

abstract class CategoryRepositories {
  Future<ApiResult<List<CategoryEntities>>> getCategories();
  Future<ApiResult<ProductResponseEntity>> getProductsByCategory(
    ProductByCategoryRequest request,
  );
}
