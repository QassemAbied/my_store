import 'package:my_store/core/common_models/models/product_models.dart';
import 'package:my_store/features/category/data/models/category_model.dart';

import '../../../../core/network/rest_client.dart';
import '../../domain/entities/product_by_category_request.dart';
import 'category_remote_data_source.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final RestClient _restClient;

  CategoryRemoteDataSourceImpl(this._restClient);
  @override
  Future<CategoryResponseModel> getCategories() async {
    return await _restClient.getCategories();
  }

  @override
  Future<ProductResponseModel> getProductsByCategory(
    ProductByCategoryRequest request,
  ) async {
    return await _restClient.getProductsByCategory(
      request.categoryId,
      request.fields,
    );
  }
}
