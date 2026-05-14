import '../../models/address_local_model.dart';

abstract class AddressLocalDataSource {

  Future<AddressResponseLocalModel> getAddressesLocal();
  Future<void> cacheAddresses(AddressResponseLocalModel addresses);
}