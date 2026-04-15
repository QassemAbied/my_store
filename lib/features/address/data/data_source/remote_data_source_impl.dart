import 'package:my_store/features/address/data/data_source/remote_data_source.dart';
import '../../../../core/network/rest_client.dart';
import '../models/address_model.dart';
import '../../domain/entities/address_request.dart';

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource{
  final RestClient _restClient;

  AddressRemoteDataSourceImpl(this._restClient);
  @override
  Future<void> addAddress(CreateAddressParams body)async {
    return await _restClient.addAddress({
      "first_name": body.firstName,
      "last_name": body.lastName,
      "phone": body.phone,
      "address_1":  body.address1,
      "address_2": body.address2,
      "city": body.city,
      "country_code": body.countryCode,


    });
  }

  @override
  Future<void> deleteAddress(String addressId)async {
    await _restClient.deleteAddress(addressId);
  }

  @override
  Future<AddressResponseModel> getAddresses()async {
    return await _restClient.getAddresses();
  }
}