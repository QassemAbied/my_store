import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/core/utils/use_case.dart';

import '../entities/product_entities.dart';
import '../repositories/home_repositories.dart';

class ProductUseCase extends UseCase<ProductResponseEntity, NoParams> {
  final HomeRepositories homeRepositories;

  ProductUseCase(this.homeRepositories);

  @override
  Future<ApiResult<ProductResponseEntity>> call(NoParams params) async {
    return await homeRepositories.getProducts();
  }
}
