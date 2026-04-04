import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/features/home/domain/entities/product_entities.dart';

import '../entities/product_param.dart';

abstract class HomeRepositories {

  Future<ApiResult<ProductResponseEntity>> getProducts(ProductParams params);
}