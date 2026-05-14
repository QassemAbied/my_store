import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/use_case.dart';
import '../../domain/entities/address_entities.dart';
import '../../domain/entities/address_request.dart';
import '../../domain/ues_case/add_address_use_case.dart';
import '../../domain/ues_case/delete_address_use_case.dart';
import '../../domain/ues_case/get_address_use_case.dart';
import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final GetAddressUseCase _getAddressUseCase;
  final AddAddressUseCase _addAddressUseCase;
  final DeleteAddressUseCase _deleteAddressUseCase;
  AddressCubit(
    this._getAddressUseCase,
    this._addAddressUseCase,
    this._deleteAddressUseCase,
  ) : super(AddressInitial());

  int? selectedIndex;
  AddressResponseEntity? addresses;

  void selectAddress(int index) {
    selectedIndex = index;
    emit(AddressSuccess(addresses!));
  }

  Future<void> getAddresses() async {
    emit(AddressLoading());

    final result = await _getAddressUseCase.call(NoParams());

    result.result.fold(
      (error) {
        emit(AddressError(error.message));
      },
      (data) {
        addresses = data;
        selectedIndex = 0;
        emit(AddressSuccess(data));
      },
    );
  }

  Future<void> addAddress(CreateAddressParams params) async {
    addresses ??= AddressResponseEntity(addresses: []);
    final tempAddress = AddressEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),

      firstName: params.firstName,

      lastName: params.lastName,

      phone: params.phone,

      address1: params.address1,

      address2: params.address2,

      city: params.city,

      countryCode: params.countryCode,
    );

    addresses?.addresses.insert(0, tempAddress);
    emit(AddressSuccess(addresses!));

    final result = await _addAddressUseCase.call(params);

    result.result.fold(
      (error) {
        if (kDebugMode) {
          print(error.message);
        }
      },

      (_) async {
        // await getAddresses();
      },
    );
  }

  Future<void> deleteAddress(String id) async {
    addresses?.addresses.removeWhere((e) => e.id == id);
    emit(AddressSuccess(addresses!));

    final result = await _deleteAddressUseCase.call(id);

    result.result.fold(
      (error) {
        if (kDebugMode) {
          print(error.message);
        }
      },

      (_) async {
        // await getAddresses();
      },
    );
  }
}
