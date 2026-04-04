import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/core/network/use_case.dart';

import '../entities/product_entities.dart';
import '../entities/product_param.dart';
import '../repositories/home_repositories.dart';

class ProductUseCase extends UseCase<ProductResponseEntity, ProductParams > {
  final HomeRepositories homeRepositories;

  ProductUseCase(this.homeRepositories);

  @override
  Future<ApiResult<ProductResponseEntity>> call(ProductParams  params) async {
    return await homeRepositories.getProducts(params);
  }
}
