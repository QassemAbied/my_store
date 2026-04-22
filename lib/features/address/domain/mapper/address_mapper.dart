import '../../data/models/address_model.dart';
import '../entities/address_entities.dart';

extension AddressMapper on AddressModel {
  AddressEntity toEntity() {
    return AddressEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      address1: address1,
      address2: address2,
      city: city,
      countryCode: countryCode,
      postalCode: postalCode,
    );
  }
}

extension AddressResponseMapper on AddressResponseModel {
  AddressResponseEntity toEntity() {
    return AddressResponseEntity(
      addresses: addresses.map((e) => e.toEntity()).toList(),
    );
  }
}
