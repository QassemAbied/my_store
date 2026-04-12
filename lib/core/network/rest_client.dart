import 'package:dio/dio.dart';
import 'package:my_store/core/network/api_contstants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../features/auth/data/models/auth_model.dart';
import '../../features/auth/data/models/customer_model.dart';
import '../../features/cart/data/models/address_model.dart';
import '../../features/cart/data/models/cart_item_model.dart';
import '../../features/cart/data/models/payment_provider_model.dart';
import '../../features/cart/data/models/shipping_model.dart';
import '../../features/home/data/models/product_models.dart';
import '../../features/products/data/models/product_details_model.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
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

  @GET(ApiConstants.collections)
  Future<void> getCollections(
    @Query("limit") int limit,
    @Query("offset") int offset,
  );

  @GET(ApiConstants.categories)
  Future<void> getCategories();

  @POST(ApiConstants.carts)
  Future<String> createCart(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.addCarts)
  Future<void> addCart(
    @Path("id") String id,
    @Body() Map<String, dynamic> body,
  );

  @GET("${ApiConstants.carts}/{id}")
  Future<CartResponseModel> getCart(@Path("id") String id);

  @GET(ApiConstants.regions)
  Future<String> getRegions();

  @DELETE(ApiConstants.updateCartsItem)
  Future<void> deleteCartItem(
    @Path("id") String cartId,
    @Path("lineId") String lineId,
  );

  @POST(ApiConstants.updateCartsItem)
  Future<void> updateCartItem(
    @Path("id") String cartId,
    @Path("lineId") String lineId,
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiConstants.shippingOptions)
  Future<ShippingResponseModel> getShippingOptions(
    @Query("cart_id") String cartId,
  );
  @GET(ApiConstants.paymentProvider)
  Future<PaymentProvidersResponseModel> getPaymentProviders(
    @Query("region_id") String regionId,
  );

  @POST(ApiConstants.addShippingOptions)
  Future<void> addShippingMethod(
    @Path("id") String cartId,
    @Body() Map<String, dynamic> body,
  );
  @POST("${ApiConstants.carts}/{id}")
  Future<CartResponseModel> addShippingAddress(
    @Path("id") String cartId,
    @Body() Map<String, dynamic> body,
  );

  @POST("${ApiConstants.carts}/{id}/complete")
  Future<void> completeCart(@Path("id") String cartId);
  @GET(ApiConstants.address)
  Future<AddressResponseModel> getAddresses();

  @POST(ApiConstants.address)
  Future<void> addAddress(@Body() Map<String, dynamic> body);

  @DELETE("${ApiConstants.address}/{id}")
  Future<void> deleteAddress(@Path("id") String id);

  @POST(ApiConstants.authRegister)
  Future<AuthResponseModel> registerAuth(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.profileRegister)
  Future<CustomerResponseModel> registerProfile(
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiConstants.profile)
  Future<CustomerResponseModel> getProfile();

  @POST(ApiConstants.login)
  Future<AuthResponseModel> login(@Body() Map<String, dynamic> body);
}
