import '../../../../../core/common_models/models/product_response_local_model.dart';
import '../../models/category_local_model.dart';

abstract class CategoryLocalDataSource {
  Future<CategoryResponseLocalModel> getCategoriesLocal();
  Future<ProductResponseLocalModel> getProductsByCategoryLocal(String categoryId);
  Future<void> cacheCategoriesLocal(CategoryResponseLocalModel categories);
  Future<void> cacheProductsByCategoryLocal(ProductResponseLocalModel products, String categoryId);
}
