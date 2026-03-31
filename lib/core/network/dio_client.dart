import 'package:dio/dio.dart';
import 'package:my_store/core/network/api_contstants.dart';

class DioClient {
  DioClient._();
  static Dio? _dio;

  static Dio getDio(){
    if(_dio != null) return _dio!;

    _dio=Dio(
      BaseOptions(
        connectTimeout: ApiConstants.timeout,
        receiveTimeout: ApiConstants.timeout,
        headers: {
          ApiConstants.publishable: ApiConstants.apiKey,
        }
      ),
    );
    return _dio!;
  }
}