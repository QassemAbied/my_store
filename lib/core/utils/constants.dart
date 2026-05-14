import '../services/shared_pref.dart';

class AppConstants {
  static const String themeKey='theme';
  static const String tokenKey='TOKEN';
  static String? token=SharedPrefHelper.getString(key: tokenKey);
  static const String categoryLocalKey='categorys';
  static const String productLocalKey='productes';
  static const String cartLocalKey='cart';
  static const String profileLocalKey='profile';
  static const String addressLocalKey='addresses';
  static const String orderLocalKey='order';
  static const String orderReviewLocalKey='orderReview';

}
