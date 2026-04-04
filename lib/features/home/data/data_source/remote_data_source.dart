import 'package:my_store/features/home/data/models/product_models.dart';

import '../../domain/entities/product_param.dart';

abstract class RemoteDataSource {
  Future<ProductResponseModel> getProducts(ProductParams params);
}