import 'package:my_store/features/home/data/data_source/remote_data_source.dart';
import 'package:my_store/features/home/data/models/product_models.dart';
import '../../../../core/network/rest_client.dart';

class RemoteDataSourceImpl implements RemoteDataSource{
  final RestClient restClient;
  RemoteDataSourceImpl({required this.restClient});
  @override
  Future<ProductResponseModel> getProducts()async {
  return  restClient.getProduct("id,title,thumbnail",);
  }
 }