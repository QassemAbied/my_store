import '../../domain/entities/address_entities.dart';

class AddressState {}

final class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressSuccess extends AddressState {
  final AddressResponseEntity addresses;

  AddressSuccess(this.addresses);
}

class AddressError extends AddressState {
  final String message;

  AddressError(this.message);
}

class AddAddressLoading extends AddressState {}

class AddAddressSuccess extends AddressState {}

class AddAddressError extends AddressState {
  final String message;

  AddAddressError(this.message);
}
