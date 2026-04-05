import 'package:dio/dio.dart';
import 'package:my_store/core/network/api_contstants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../features/home/data/models/product_models.dart';
import '../../features/products/data/models/product_details_model.dart';
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

@GET("${ApiConstants.productUrl}/{id}")
Future<ProductDetailsModel> getProductDetails(
    @Path("id") String id,
    @Query("fields") String fields,
    );

// 🟢 Get Collections
@GET(ApiConstants.collections)
Future<void> getCollections(
    @Query("limit") int limit,
    @Query("offset") int offset,
    );

// 🟢 Get Categories
@GET(ApiConstants.categories)
Future<void> getCategories();

// 🟢 Create Cart
@POST(ApiConstants.carts)
Future<void> createCart();

// 🟢 Get Cart
@GET("${ApiConstants.carts}{id}")
Future<void> getCart(
    @Path("id") String id,
    );

// 🟢 Get Regions
@GET(ApiConstants.regions)
Future<void> getRegions();
}