import 'package:my_store/features/home/data/models/product_models.dart';

abstract class RemoteDataSource {
  Future<ProductResponseModel> getProducts();
}