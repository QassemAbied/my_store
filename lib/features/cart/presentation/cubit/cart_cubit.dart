import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/services/shared_pref.dart';
import 'package:my_store/features/cart/domain/usecases/update_cart_use_case.dart';
import '../../../../core/network/use_case.dart';
import '../../domain/entities/params.dart';
import '../../domain/usecases/add_cart_use_case.dart';
import '../../domain/usecases/cart_item_use_case.dart';
import '../../domain/usecases/create_cart_use_case.dart';
import '../../domain/usecases/delete_cart_use_case.dart';
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


  CartCubit(
    this.regionsUseCase,
    this.cartItemUseCase,
    this.cartUseCase,
    this.addCartUseCase,
    this.deleteCartUseCase,
    this.updateCartUseCase,
      this.shippingUseCase,
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
}
