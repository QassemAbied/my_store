import 'package:my_store/features/home/data/data_source/remote_data_source.dart';
import 'package:my_store/core/common_models/models/product_models.dart';
import '../../../../core/network/rest_client.dart';
import '../../domain/entities/product_param.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final RestClient restClient;
  RemoteDataSourceImpl({required this.restClient});
  @override
  Future<ProductResponseModel> getProducts(ProductParams params) async {
    return restClient.getProduct(
      params.fields,
      params.limit,
      params.offset,
      params.reginId,
        params.query,
      //params.expand,
    );
  }
}
