import 'package:dio/dio.dart';
import 'err_message.dart';
import 'failures.dart';
import 'dart:io';

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    }

    if (error is SocketException) {
      return const NetworkFailure(
        ErrorMessages.noInternet,
      );
    }

    return const ServerFailure(
      ErrorMessages.serverError,
    );
  }

  static Failure _handleDioError(
      DioException error,
      )
  {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure(
          ErrorMessages.timeout,
        );

      case DioExceptionType.badResponse:
        return _handleStatusCode(
          error.response?.statusCode,
          error.response?.data,
        );

      case DioExceptionType.cancel:
        return const ServerFailure(
          'Request cancelled',
        );

      case DioExceptionType.unknown:
        return const NetworkFailure(
          ErrorMessages.noInternet,
        );

      default:
        return const ServerFailure(
          ErrorMessages.serverError,
        );
    }
  }

  static Failure _handleStatusCode(
      int? statusCode,
      dynamic data,
      )
  {
    final message =
    data is Map<String, dynamic>
        ? data['message'] ??
        ErrorMessages.serverError
        : ErrorMessages.serverError;

    switch (statusCode) {
      case 400:
        return BadRequestFailure(message);

      case 401:
      case 403:
        return UnauthorizedFailure(message);

      case 404:
        return NotFoundFailure(message);

      case 500:
      case 502:
      case 503:
        return ServerFailure(message);

      default:
        return ServerFailure(message);
    }
  }
}