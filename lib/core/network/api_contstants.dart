import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const Duration timeout = Duration(seconds: 30);
  static const String baseUrl = "http://10.0.2.2:9000";
  static String fixImageUrl(String url) {
    return url.replaceAll("localhost", "10.0.2.2");
  }

  static const String publishable = "x-publishable-api-key";
  static final String apiKey =dotenv.env['API_KEY']!;
  static const String contentType = "Content-Type";
  static const String applicationJson = "application/json";
  static const String authorization = "Authorization";
  static final String secretKey =dotenv.env['STRIPE_SECRET']!;

  static const String productUrl = "/store/products";

  static const String collections = "/store/collections";
  static const String categories = "/store/product-categories";
  static const String carts = "/store/carts";
  static const String addCarts = "/store/carts/{id}/line-items";
  static const String updateCartsItem = "/store/carts/{id}/line-items/{lineId}";
  static const String address = "/store/custom/addresses";
  static const String shippingOptions = "/store/shipping-options";
  static const String addShippingOptions = "/store/carts/{id}/shipping-methods";
  static const String paymentProvider = "/store/payment-providers";
  static const String regions = "/store/regions";
  static const String authRegister = "/auth/customer/emailpass/register";
  static const String profileRegister = "/store/register";
  static const String login = "/auth/customer/emailpass";
  static const String profile = "/store/custom/me";

  static const String paymentCollection = "/store/payment-collections";
  static const String paymentSessions = "/store/payment-collections/{id}/payment-sessions";

}
