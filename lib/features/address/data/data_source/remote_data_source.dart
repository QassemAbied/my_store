import '../models/address_model.dart';
import '../../domain/entities/address_request.dart';

abstract class AddressRemoteDataSource {
  Future<AddressResponseModel> getAddresses();
  Future<void> addAddress(CreateAddressParams body);
  Future<void> deleteAddress(String addressId);
}