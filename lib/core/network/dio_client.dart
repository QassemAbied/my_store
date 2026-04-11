import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_store/core/network/api_contstants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../services/shared_pref.dart';
import '../utils/constants.dart';

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
          'Content-Type':'application/json',
        }
      ),
    );
    _addInterceptors();
    return _dio!;
  }

 static void _addInterceptors(){
   _dio?.interceptors.add(
     InterceptorsWrapper(
       onRequest: (options, handler)  {
         final token =  SharedPrefHelper.getString( key:AppConstants.tokenKey, );

         if (token != null && token.isNotEmpty) {
           options.headers['Authorization'] = 'Bearer $token';
         }

         return handler.next(options);
       },
     ),
   );
   _dio?.interceptors.add(
     InterceptorsWrapper(
       onError: (error, handler) {
         if (kDebugMode) {
           print("Error Dio: ${error.message}");
         }
         return handler.next(error);
       },
     ),
   );
    _dio?.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
    ));
  }
}