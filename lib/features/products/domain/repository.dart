import 'package:my_store/core/network/api_result.dart';

import 'entities/product_details_entities.dart';
import 'entities/product_details_request.dart';

abstract class ProductDetailsRepository {
  Future<ApiResult<ProductDetailsEntities>> getProductDetails(
    ProductDetailsRequest params,
  );
}
