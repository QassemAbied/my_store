import 'package:my_store/core/network/network_info.dart';
import 'package:my_store/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:my_store/features/auth/domain/entities/customer_entity.dart';
import '../../../core/network/api_result.dart';
import '../../../core/error/error_handler.dart';
import '../domain/entities/auth_entity.dart';
import '../domain/entities/requests.dart';
import '../domain/mapper/auth_mapper.dart';
import '../domain/mapper/customer_local_mapper.dart';
import '../domain/mapper/customer_mapper.dart';
import '../domain/repository.dart';
import 'data_source/remote_data_source/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo _networkInfo;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(
     this.remoteDataSource,
     this._networkInfo,
     this._localDataSource
  );

  @override
  Future<ApiResult<AuthEntity>> registerAuth(LoginRequest request)
  async {
    try {
      final result = await remoteDataSource.registerAuth(request);

      return ApiResult.success(result.toEntity());
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<CustomerEntity>> register(RegisterRequest request)async {
    try {
      final result = await remoteDataSource.register(request);

      return ApiResult.success(result.toEntity());
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<AuthEntity>> login(LoginRequest request) async{
    try {
      final result = await remoteDataSource.login(request);

      return ApiResult.success(result.toEntity());
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<CustomerEntity>> getProfile( ) async{

    if(await _networkInfo.isServerAlive){
      try {
        final result = await remoteDataSource.getProfile();
        final customerLocal= CustomerLocalMapper.toLocalCustomerModel(result);

        await _localDataSource.cacheProfile(customerLocal);

        return ApiResult.success(result.toEntity());
      } catch (e) {
        try{
          final localProfile= await _localDataSource.getLocalProfile();
          final entity= CustomerLocalMapper.toLocalEntity(localProfile);
          return ApiResult.success(entity);
        }catch(_){
          return ApiResult.failure(ErrorHandler.handle(e));
        }

      }
    }else{
      try{
        final localProfile= await _localDataSource.getLocalProfile();
        final entity= CustomerLocalMapper.toLocalEntity(localProfile);
        return ApiResult.success(entity);
      }catch(e){
        return ApiResult.failure(ErrorHandler.handle(e));
      }
    }

  }
}
