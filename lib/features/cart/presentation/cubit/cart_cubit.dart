import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/services/shared_pref.dart';
import 'package:my_store/features/cart/domain/usecases/update_cart_use_case.dart';
import '../../../../core/network/use_case.dart';
import '../../domain/entities/params.dart';
import '../../domain/usecases/add_address_use_case.dart';
import '../../domain/usecases/add_cart_use_case.dart';
import '../../domain/usecases/add_shipping_use_cas.dart';
import '../../domain/usecases/cart_item_use_case.dart';
import '../../domain/usecases/complete_cart_use_case.dart';
import '../../domain/usecases/create_cart_use_case.dart';
import '../../domain/usecases/delete_address_use_case.dart';
import '../../domain/usecases/delete_cart_use_case.dart';
import '../../domain/usecases/get_address_use_case.dart';
import '../../domain/usecases/regions_use_case.dart';
import '../../domain/usecases/shipping_use_case.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final RegionsUseCase regionsUseCase;
  final CartItemUseCase cartItemUseCase;
  final CreateCartUseCase cartUseCase;
  final AddCartUseCase addCartUseCase;
  final DeleteCartUseCase deleteCartUseCase;
  final UpdateCartUseCase updateCartUseCase;
  final ShippingUseCase shippingUseCase;
   final AddShippingUseCas addShippingUseCas;
   final CompleteCartUseCase completeCartUseCase;
  final GetAddressUseCase _getAddressUseCase;
  final AddAddressUseCase _addAddressUseCase;
  final DeleteAddressUseCase _deleteAddressUseCase;



  CartCubit(
    this.regionsUseCase,
    this.cartItemUseCase,
    this.cartUseCase,
    this.addCartUseCase,
    this.deleteCartUseCase,
    this.updateCartUseCase,
      this.shippingUseCase,
      this.addShippingUseCas,
      this.completeCartUseCase,
    this._getAddressUseCase,
    this._addAddressUseCase,
    this._deleteAddressUseCase,
  ) : super(CartInitial());

  String? cartId;

  Future<void> ensureCartId() async {
    cartId ??= SharedPrefHelper.getString(key: 'cartId');

    if (cartId != null) return;

    final regionResult = await regionsUseCase(NoParams());

    await regionResult.result.fold(
      (failure) async {
        emit(CartItemsError("Region Error"));
      },
      (regionId) async {
        final createResult = await cartUseCase({"region_id": regionId});

        createResult.result.fold(
          (failure) {
            emit(CartItemsError("Create Cart Error"));
          },
          (newCartId) async {
            cartId = newCartId;

            await SharedPrefHelper.setData(key: 'cartId', value: newCartId);
          },
        );
      },
    );
  }

  Future<void> getCartItems() async {
    emit(CartItemsLoading());

    await ensureCartId();

    if (cartId == null) {
      emit(CartItemsError("Cart Id is null"));
      return;
    }

    final result = await cartItemUseCase(cartId!);

    result.result.fold(
      (failure) => emit(CartItemsError("Get Cart Error")),
      (cartData) => emit(CartItemsSuccess(cartData)),
    );
  }

  Future<void> addCart({
    required String variantId,
    required int quantity,
  }) async {
    emit(AddCartLoading());

    await ensureCartId();

    if (cartId == null) {
      emit(AddCartError("Cart Id is null"));
      return;
    }

    final result = await addCartUseCase(
      AddCartRequest(cartId!, {"variant_id": variantId, "quantity": quantity}),
    );

    result.result.fold((failure) => emit(AddCartError(failure.toString())), (
      _,
    ) async {
      // await getCartItems();
      emit(AddCartSuccess());
    });
  }

  Future<void> deleteCart({required String lineId}) async {
    emit(DeleteCartLoading());

    await ensureCartId();

    if (cartId == null) {
      emit(DeleteCartError("Cart Id is null"));
      return;
    }

    final result = await deleteCartUseCase(DeleteCartParams(cartId!, lineId));

    result.result.fold((failure) => emit(DeleteCartError(failure.toString())), (
      _,
    ) async {
      //await getCartItems();
      emit(DeleteCartSuccess());
    });
  }

  Future<void> updateCart({
    required String lineId,
    required int quantity,
  }) async {
    emit(UpdateCartLoading());

    await ensureCartId();

    if (cartId == null) {
      emit(UpdateCartError("Cart Id is null"));
      return;
    }

    final result = await updateCartUseCase(
      UpdateCartParams(cartId!, lineId, {"quantity": quantity}),
    );

    result.result.fold((failure) => emit(UpdateCartError(failure.toString())), (
      _,
    ) async {
      //await getCartItems();
      emit(UpdateCartSuccess());
    });
  }


  Future<void> getShippingOptions() async {
    emit(ShippingLoading());
    await ensureCartId();
    if (cartId == null) {
      emit(ShippingError("Cart Id is null"));
      return;
    }
    final result = await shippingUseCase(
      cartId!,
    );
    result.result.fold(
      (failure) => emit(ShippingError("Get Shipping Error")),
      (shippingData) => emit(ShippingSuccess(shippingData)),
    );

  }

  Future<void> addShippingOptions({
    required String shippingOptionId,
  }) async {
    emit(AddShippingLoading());

    await ensureCartId();

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


  Future<void> checkout() async {
    emit(CheckoutLoading());

    await ensureCartId();

    if (cartId == null) {
      emit(CheckoutError("Cart Id is null"));
      return;
    }

    final result = await completeCartUseCase(cartId!);

    result.result.fold(
          (failure) => emit(CheckoutError("Checkout failed")),
          (_) async {
        // 🧹 ممكن تمسح الكارت بعد النجاح
        cartId = null;
        await SharedPrefHelper.removeData( 'cartId');

        emit(CheckoutSuccess());
      },
    );
  }



  Future<void> getAddresses() async {
    emit(AddressLoading());

    final result = await _getAddressUseCase.call(NoParams());

    result.result.fold(

      (error) {
        emit(AddressError(error.toString() ?? "Something went wrong"));
      },
          (data) {
        emit(AddressSuccess(data));
      },
    );
  }

  /// ================= ADD =================
  Future<void> addAddress(CreateAddressParams params) async {
    emit(AddAddressLoading());

    final result = await _addAddressUseCase.call(params);

    result.result.fold(

      (error) {
        emit(AddAddressError(error.toString()?? "Failed to add address"));
      },
          (_) {
        emit(AddAddressSuccess());

        /// refresh list بعد الإضافة
        getAddresses();
      },
    );
  }

  /// ================= DELETE =================
  Future<void> deleteAddress(String id) async {
    emit(DeleteAddressLoading());

    final result = await _deleteAddressUseCase.call(id);

    result.result.fold(

       (error) {
        emit(DeleteAddressError(error.toString() ?? "Failed to delete address"));
      },
          (_) {
        emit(DeleteAddressSuccess());

        /// refresh list بعد الحذف
        getAddresses();
      },
    );
  }

}
