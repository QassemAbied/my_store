import '../../../../core/common_models/models/product_models.dart';
import '../../domain/entities/product_by_category_request.dart';
import '../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<CategoryResponseModel> getCategories();
  Future<ProductResponseModel> getProductsByCategory(
    ProductByCategoryRequest request,
  );
}
