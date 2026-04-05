import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_store/core/network/api_contstants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../features/cart/data/models/cart_item_model.dart';
import '../../features/cart/data/models/regions_model.dart';
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
Future<String> createCart(
    @Body() Map<String, dynamic> body,
    );

  @POST("${ApiConstants.carts}/{id}/line-items")
  Future<void> addCart(
      @Path("id") String id,
      @Body() Map<String, dynamic> body,
      );

// 🟢 Get Cart
@GET("${ApiConstants.carts}/{id}")
Future<CartResponseModel> getCart(
    @Path("id") String id,
    );

// 🟢 Get Regions
@GET(ApiConstants.regions)
Future<String> getRegions();
}