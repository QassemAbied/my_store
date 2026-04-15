import '../../../core/error/failures.dart';
import '../../../core/network/api_result.dart';
import '../domain/entities/address_entities.dart';
import '../domain/entities/address_request.dart';
import '../domain/mapper/address_mapper.dart';
import '../domain/repository.dart';
import 'data_source/remote_data_source.dart';

class AddressRepositoryImpl implements AddressRepository{
  final AddressRemoteDataSource _cartRemoteDataSource;

  AddressRepositoryImpl(this._cartRemoteDataSource);

  @override
  Future<ApiResult<void>> addAddress(CreateAddressParams body)async {
    try {
      final res=  await _cartRemoteDataSource.addAddress(body);
      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<void>> deleteAddress(String addressId)async {
    try {
      final res=  await _cartRemoteDataSource.deleteAddress(addressId);
      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(ServerFailure());
    }
  }

  @override
  Future<ApiResult<AddressResponseEntity>> getAddresses()async {
    try {
      final res= await _cartRemoteDataSource.getAddresses();
      return ApiResult.success(res.toEntity());
    } catch (e) {
      return ApiResult.failure(ServerFailure());
    }
  }
}