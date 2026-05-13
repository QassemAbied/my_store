import '../../data/models/address_local_model.dart';
import '../../data/models/address_model.dart';
import '../entities/address_entities.dart';

class AddressLocalMapper {
  static AddressResponseLocalModel toLocalMode(AddressResponseModel address) {
    return AddressResponseLocalModel(
      addresses: address.addresses.map((e) => toAddressLocalMode(e)).toList(),
    );
  }

  static AddressItemLocalModel toAddressLocalMode(AddressModel local) {
    return AddressItemLocalModel(
      id: local.id,
      firstName: local.firstName,
      lastName: local.lastName,
      phone: local.phone,
      address1: local.address1,
      address2: local.address2,
      city: local.city,
      countryCode: local.countryCode,
    );
  }

  static AddressResponseEntity toLocalEntity(
    AddressResponseLocalModel address,
  ) {
    return AddressResponseEntity(
      addresses: address.addresses.map((e) => toAddressLocalEntity(e)).toList(),
    );
  }

  static AddressEntity toAddressLocalEntity(AddressItemLocalModel local) {
    return AddressEntity(
      id: local.id,
      firstName: local.firstName,
      lastName: local.lastName,
      phone: local.phone,
      address1: local.address1,
      address2: local.address2,
      city: local.city,
      countryCode: local.countryCode,
    );
  }




  static AddressResponseLocalModel  toLocalEntityModel(
      AddressResponseEntity address,
      ) {
    return AddressResponseLocalModel(
      addresses: address.addresses.map((e) => toAddressEntityModel(e)).toList(),
    );
  }

  static AddressItemLocalModel  toAddressEntityModel(AddressEntity local) {
    return AddressItemLocalModel(
      id: local.id,
      firstName: local.firstName,
      lastName: local.lastName,
      phone: local.phone,
      address1: local.address1,
      address2: local.address2,
      city: local.city,
      countryCode: local.countryCode,
    );
  }
}
