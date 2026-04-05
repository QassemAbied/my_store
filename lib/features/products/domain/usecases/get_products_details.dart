import 'package:my_store/features/products/domain/repository.dart';

import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../entities/product_details_entities.dart';
import '../entities/product_details_request.dart';

class GetProductsDetailsUseCase
    extends UseCase<ProductDetailsEntities, ProductDetailsRequest> {
  final ProductDetailsRepository _repository;

  GetProductsDetailsUseCase(this._repository);

  @override
  Future<ApiResult<ProductDetailsEntities>> call(
    ProductDetailsRequest params,
  ) async {
    return await _repository.getProductDetails(params);
  }
}
