

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/shipping/presentation/controller/shipping_state.dart';
import '../../../../core/services/shared_pref.dart';
import '../../domain/entities/shipping_entites.dart';
import '../../domain/entities/shipping_request.dart';
import '../../domain/ues_case/add_shipping_address_use_case.dart';
import '../../domain/ues_case/add_shipping_use_cas.dart';
import '../../domain/ues_case/shipping_use_case.dart';

class ShippingCubit extends Cubit<ShippingState> {
  final ShippingUseCase shippingUseCase;
  final AddShippingUseCas addShippingUseCas;
  final AddShippingAddressUseCase _addShippingAddressUseCase;

  ShippingCubit(this.shippingUseCase, this.addShippingUseCas, this._addShippingAddressUseCase) : super(ShippingInitial());
  String? cartId;
  ShippingEntity? shippingData;

  String? selectedId ;
  void setSelectedId(String id) {
    selectedId = id;
    if (shippingData != null) {
      emit(ShippingSuccess(shippingData!));
    }
  }
  Future<void> getShippingOptions() async {
    emit(ShippingLoading());

    cartId ??=  SharedPrefHelper.getString(key: 'cartId');
    if (cartId == null) {
      emit(ShippingError("Cart Id is null"));
      return;
    }


    final result = await shippingUseCase(
      cartId!,
    );
    result.result.fold(
          (failure) => emit(ShippingError("Get Shipping Error")),
          (data) {
           shippingData = data;
            emit(ShippingSuccess(data));}
    );

  }
  Future<void> addShippingOptions({required String shippingOptionId,})
  async {
    emit(AddShippingLoading());

    cartId ??=  SharedPrefHelper.getString(key: 'cartId');
    if (cartId == null) {
      emit(AddShippingError("Cart Id is null"));
      return;
    }


    final result = await addShippingUseCas(
        AddShippingOptionParams(cartId!,
            {"option_id": shippingOptionId}));
    result.result.fold((failure) =>
        emit(AddShippingError(failure.toString())), (
        _,
        ) async {
      // await getCartItems();
      emit(AddShippingSuccess());
    });
  }
  Future<void> addShippingAddress({required ShippingAddressRequest body})
  async {
    cartId ??=  SharedPrefHelper.getString(key: 'cartId');
    if (cartId == null) {
      emit(AddShippingAddressError("Cart Id is null"));
      return;
    }

    final result =
    await _addShippingAddressUseCase(ShippingAddressCartRequest(
        cartId: cartId!,
        body: body)
    );
    result.result.fold(

          (error) {
        emit(AddShippingAddressError(error.toString() ?? "Failed to delete address"));
      },
          (data) {
        emit(AddShippingAddressSuccess(data));
      },
    );

  }

}
