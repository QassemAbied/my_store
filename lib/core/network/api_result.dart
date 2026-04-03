import 'package:dartz/dartz.dart';

import '../error/failures.dart';

class ApiResult<T> {
  final Either<Failure, T> result;

  ApiResult._(this.result);

  factory ApiResult.success(T data) {
    return ApiResult._(Right(data));
  }

  factory ApiResult.failure(Failure failure) {
    return ApiResult._(Left(failure));
  }
}