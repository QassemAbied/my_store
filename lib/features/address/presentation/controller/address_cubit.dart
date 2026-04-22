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
        emit(AddressError(error.toString() ?? "Something went wrong"));
      },
      (data) {
        addresses = data;
        emit(AddressSuccess(data));
      },
    );
  }

  Future<void> addAddress(CreateAddressParams params) async {
    emit(AddAddressLoading());

    final result = await _addAddressUseCase.call(params);

    result.result.fold(
      (error) {
        emit(AddAddressError(error.toString() ?? "Failed to add address"));
      },
      (_) {
        emit(AddAddressSuccess());

        /// refresh list بعد الإضافة
        getAddresses();
      },
    );
  }

  Future<void> deleteAddress(String id) async {
    addresses?.addresses.removeWhere((e) => e.id == id);
    emit(AddressSuccess(addresses!));
    await _deleteAddressUseCase.call(id);
  }
}
