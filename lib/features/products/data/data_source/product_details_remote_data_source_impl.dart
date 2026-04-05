import 'package:my_store/core/network/rest_client.dart';
import 'package:my_store/features/products/data/data_source/product_details_remote_data_source.dart';
import 'package:my_store/features/products/data/models/product_details_model.dart';

import '../../domain/entities/product_details_request.dart';

class ProductDetailsRemoteDataSourceImpl  implements
    ProductDetailsRemoteDataSource{
  final RestClient _restClient;

  ProductDetailsRemoteDataSourceImpl(this._restClient);
  @override
  Future<ProductDetailsModel> getProductDetails(ProductDetailsRequest params)async {
    return await _restClient.getProductDetails(params.id, params.fields);
  }

}