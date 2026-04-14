import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/services/shared_pref.dart';
import 'package:my_store/features/cart/domain/usecases/update_cart_use_case.dart';
import '../../../../core/network/use_case.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/params.dart';
import '../../domain/usecases/add_address_use_case.dart';
import '../../domain/usecases/add_cart_use_case.dart';
import '../../domain/usecases/add_shipping_address_use_case.dart';
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
  final AddShippingAddressUseCase _addShippingAddressUseCase;
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
      this._addShippingAddressUseCase
  ) : super(CartInitial());

  String? cartId;
  String? regionId;
  final Set<String> selectedItems = {};
    CartResponseEntity? items;
  Future<void> ensureCartId() async {
    cartId ??=  SharedPrefHelper.getString(key: 'cartId');

    if (cartId != null) return;

    final regionResult = await regionsUseCase(NoParams());

    if (regionResult.result.isLeft()) {
      emit(CartItemsError("Region Error"));
      return;
    }

    final regionId = regionResult.result.getOrElse(() => "");

    await SharedPrefHelper.setData(
      key: 'region',
      value: regionId,
    );

    final createResult = await cartUseCase({
      "region_id": regionId,
    });

    if (createResult.result.isLeft()) {
      emit(CartItemsError("Create Cart Error"));
      return;
    }

    final newCartId = createResult.result.getOrElse(() => "");

    cartId = newCartId;

    await SharedPrefHelper.setData(
      key: 'cartId',
      value: newCartId,
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
      (cartData) {
        items=cartData;
        selectedItems.clear();

        selectedItems.addAll(
          items!.cart.items.map((e) => e.variantId),
        );
        emit(CartItemsSuccess(cartData));}
    );
  }
  Future<void> addCart({required String variantId, required int quantity, required CartItemEntity cartItem,})
  async {
    regionId ??= SharedPrefHelper.getString(key: 'region');

    await ensureCartId();
    if (cartId == null) return;

    items ??= CartResponseEntity(
      cart: CartEntity(
        items: [],
        total: 0,
        id: cartId!,
        regionId: regionId!,
      ),
    );

    final index = items!.cart.items.indexWhere(
          (e) => e.variantId == variantId,
    );

    if (index != -1) {

      items!.cart.items[index].quantity += quantity;
    } else {

      items!.cart.items.insert(0, cartItem);
    }

    items!.cart.total = items!.cart.items.fold<int>(
      0,
          (sum, item) => sum + (item.price * item.quantity),
    );

    emit(CartItemsSuccess(items!));
    selectedItems.add(variantId);

    try {
      await addCartUseCase(
        AddCartRequest(
          cartId!,
          {"variant_id": variantId, "quantity": quantity},
        ),
      );

      await getCartItems();

    } catch (e) {
      if (index != -1) {
        items!.cart.items[index].quantity -= quantity;
      } else {
        items!.cart.items.removeWhere(
              (e) => e.variantId == variantId,
        );
      }

      items!.cart.total = items!.cart.items.fold<int>(
        0,
            (sum, item) => sum + (item.price * item.quantity),
      );

      emit(CartItemsSuccess(items!));
    }
  }
  Future<void> deleteCart({required String lineId, required String variantId,})
  async {
    if (items == null) return;

    final removedItem =
    items!.cart.items.firstWhere((e) => e.id == lineId);

    items!.cart.items.removeWhere((e) => e.id == lineId);

    items!.cart.total = items!.cart.items.fold<int>(
      0,
          (sum, item) => sum + (item.price * item.quantity),
    );

    selectedItems.remove(variantId);

    emit(CartItemsSuccess(items!));

    try {
      await deleteCartUseCase(
        DeleteCartParams(cartId!, lineId),
      );
    } catch (e) {
      items!.cart.items.insert(0, removedItem);

      items!.cart.total = items!.cart.items.fold<int>(
        0,
            (sum, item) => sum + (item.price * item.quantity),
      );

      selectedItems.add(variantId);

      emit(CartItemsSuccess(items!));
    }
  }
  Future<void> updateCart({required String lineId, required int quantity,})
  async {
    if (items == null) return;

    final item =
    items!.cart.items.firstWhere((e) => e.id == lineId);

    final oldQuantity = item.quantity;

    item.quantity = quantity;

    items!.cart.total = items!.cart.items.fold<int>(
      0,
          (sum, item) => sum + (item.price * item.quantity),
    );

    emit(CartItemsSuccess(items!));

    try {
      await updateCartUseCase(
        UpdateCartParams(cartId!, lineId, {"quantity": quantity}),
      );
    } catch (e) {
      item.quantity = oldQuantity;

      items!.cart.total = items!.cart.items.fold<int>(
        0,
            (sum, item) => sum + (item.price * item.quantity),
      );

      emit(CartItemsSuccess(items!));
    }
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

  Future<void> addShippingOptions({required String shippingOptionId,}) async {
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


  Future<void> addShippingAddress({required ShippingAddressRequest body}) async {
    await ensureCartId();

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
