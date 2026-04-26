import 'package:dio/dio.dart';
import 'package:my_store/core/network/api_contstants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../features/auth/data/models/auth_model.dart';
import '../../features/auth/data/models/customer_model.dart';
import '../../features/address/data/models/address_model.dart';
import '../../features/cart/data/models/cart_item_model.dart';
import '../../features/category/data/models/category_model.dart';
import '../../features/orders/data/models/order_review_model.dart';
import '../../features/payment/data/models/payment_collection_model.dart';
import '../../features/payment/data/models/payment_provider_model.dart';
import '../common_models/models/product_models.dart';
import '../../features/payment/data/models/payment_session_model.dart';
import '../../features/products/data/models/product_details_model.dart';
import '../../features/shipping/data/models/shipping_model.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET(ApiConstants.productUrl)
  Future<ProductResponseModel> getProduct(
    @Query("fields") String fields,
    @Query("limit") int limit,
    @Query("offset") int offset,
    @Query("region_id") String regionId,
      @Query("q") String? query,
  );

  @GET(ApiConstants.productDetails)
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
  Future<CategoryResponseModel> getCategories();

  @GET(ApiConstants.productUrl)
  Future<ProductResponseModel> getProductsByCategory(
    @Query("category_id") String categoryId,
    @Query("fields") String fields,
  );
  @POST(ApiConstants.carts)
  Future<String> createCart(@Body() Map<String, dynamic> body);

  @POST(ApiConstants.addCarts)
  Future<void> addCart(
    @Path("id") String id,
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiConstants.getCarts)
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

  @POST(ApiConstants.addShippingOptions)
  Future<void> addShippingMethod(
    @Path("id") String cartId,
    @Body() Map<String, dynamic> body,
  );
  @POST(ApiConstants.getCarts)
  Future<CartResponseModel> addShippingAddress(
    @Path("id") String cartId,
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiConstants.address)
  Future<AddressResponseModel> getAddresses();

  @POST(ApiConstants.address)
  Future<void> addAddress(@Body() Map<String, dynamic> body);

  @DELETE(ApiConstants.deleteAddress)
  Future<void> deleteAddress(@Path("id") String id);

  @GET(ApiConstants.paymentProvider)
  Future<PaymentProvidersResponseModel> getPaymentProviders(
    @Query("region_id") String regionId,
  );

  @POST(ApiConstants.paymentCollection)
  Future<PaymentCollectionResponse> createPaymentCollection(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.paymentSessions)
  Future<PaymentSessionResponseModel> createPaymentSession(
    @Path("id") String cartId,
    @Body() Map<String, dynamic> body,
  );
  @POST(ApiConstants.completeCart)
  Future<OrderReviewResponseModel> completeCart(@Path("id") String cartId);

  @GET(ApiConstants.getOrder)
  Future<OrderReviewResponseModel> getOrder(@Path("id") String id);
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
