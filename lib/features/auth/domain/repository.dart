import 'package:my_store/core/network/api_result.dart';
import 'package:my_store/features/auth/domain/entities/auth_entity.dart';

import 'entities/customer_entity.dart';
import 'entities/requests.dart';

abstract class AuthRepository{
  Future<ApiResult<AuthEntity>> registerAuth( LoginRequest request);
  Future<ApiResult<CustomerEntity>> register( RegisterRequest request);
  Future<ApiResult<AuthEntity>> login( LoginRequest request);
  Future<ApiResult<CustomerEntity>> getProfile( );


}