import '../../../core/network/api_result.dart';
import 'entities/address_entities.dart';
import 'entities/address_request.dart';

abstract class AddressRepository{
  Future<ApiResult<AddressResponseEntity>> getAddresses();
  Future<ApiResult<void>> addAddress(CreateAddressParams body);
  Future<ApiResult<void>> deleteAddress(String addressId);
}