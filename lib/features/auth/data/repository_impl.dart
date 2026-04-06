import 'package:my_store/core/error/failures.dart';
import 'package:my_store/features/auth/domain/entities/customer_entity.dart';

import '../../../core/network/api_result.dart';
import '../domain/entities/auth_entity.dart';
import '../domain/entities/requests.dart';
import '../domain/mapper/auth_mapper.dart';
import '../domain/mapper/customer_mapper.dart';
import '../domain/repository.dart';
import 'data_source/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<AuthEntity>> registerAuth(LoginRequest request)
  async {
    try {
      final result = await remoteDataSource.registerAuth(request);

      return ApiResult.success(result.toEntity());
    } catch (e) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<CustomerEntity>> register(RegisterRequest request)async {
    try {
      final result = await remoteDataSource.register(request);

      return ApiResult.success(result.toEntity());
    } catch (e) {
      return ApiResult.failure(ServerFailure());
    }
  }
}
