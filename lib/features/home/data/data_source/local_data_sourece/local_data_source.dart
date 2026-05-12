import '../../../../../core/common_models/models/product_response_local_model.dart';

abstract class LocalDataSource {
  Future<ProductResponseLocalModel> getProducts();
  Future<void> cacheProducts(ProductResponseLocalModel products);
}