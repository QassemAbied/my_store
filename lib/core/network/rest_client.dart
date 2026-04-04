import 'package:dio/dio.dart';
import 'package:my_store/core/network/api_contstants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../features/home/data/models/product_models.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RestClient  {
factory RestClient(Dio dio,{String baseUrl})= _RestClient;
@GET(ApiConstants.productUrl)
  Future<ProductResponseModel> getProduct(
    @Query("fields") String fields,
    @Query("limit") int limit,
    @Query("offset") int offset,
    );
}