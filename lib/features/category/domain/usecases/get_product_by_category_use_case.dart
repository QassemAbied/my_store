import 'package:my_store/core/network/api_result.dart';

import '../../../../core/common_models/entities/product_entities.dart';
import '../../../../core/network/use_case.dart';
import '../category_repositories.dart';
import '../entities/product_by_category_request.dart';

class GetProductsByCategoryUseCase
    extends UseCase<ProductResponseEntity, ProductByCategoryRequest> {
  final CategoryRepositories _categoryRepositories;

  GetProductsByCategoryUseCase(this._categoryRepositories);

  @override
  Future<ApiResult<ProductResponseEntity>> call(
    ProductByCategoryRequest params,
  ) async {
    return await _categoryRepositories.getProductsByCategory(params);
  }
}
