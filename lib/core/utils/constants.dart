import '../services/shared_pref.dart';

class AppConstants {
  static const String themeKey='theme';
  static const String tokenKey='TOKEN';
  static String? token=SharedPrefHelper.getString(key: tokenKey);
}
