import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import 'api_contstants.dart';
abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future<bool> get isServerAlive;
}

class NetworkInfoImpl implements NetworkInfo {
  final Dio dio;

  NetworkInfoImpl(this.dio);

  @override
  Future<bool> get isConnected async {

    final result =
    await Connectivity()
        .checkConnectivity();

    return !result.contains(
      ConnectivityResult.none,
    );
  }


  @override
  Future<bool> get isServerAlive async {

    try {

      final response = await dio.get(

        ApiConstants.health,

        options: Options(

          connectTimeout:
          const Duration(seconds: 1),

          receiveTimeout:
          const Duration(seconds: 1),
        ),
      );

      return response.statusCode == 200;

    } catch (_) {

      return false;
    }
  }
}