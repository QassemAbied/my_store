import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/network/network_info.dart';
import 'package:my_store/core/services/shared_pref.dart';
import 'package:my_store/features/cart/domain/usecases/update_cart_use_case.dart';
import '../../../../core/network/use_case.dart';
import '../../data/data_source/local_data_source/cart_local_data_source.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/params.dart';
import '../../domain/mappers/cart_local_mapper.dart';
import '../../domain/usecases/add_cart_use_case.dart';
import '../../domain/usecases/cart_item_use_case.dart';
import '../../domain/usecases/create_cart_use_case.dart';
import '../../domain/usecases/delete_cart_use_case.dart';
import '../../domain/usecases/regions_use_case.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final RegionsUseCase regionsUseCase;
  final CartItemUseCase cartItemUseCase;
  final CreateCartUseCase cartUseCase;
  final AddCartUseCase addCartUseCase;
  final DeleteCartUseCase deleteCartUseCase;
  final UpdateCartUseCase updateCartUseCase;
  final CartLocalDataSource localDataSource;
  final NetworkInfo _networkInfo;

  CartCubit(
    this.regionsUseCase,
    this.cartItemUseCase,
    this.cartUseCase,
    this.addCartUseCase,
    this.deleteCartUseCase,
    this.updateCartUseCase,
    this.localDataSource,
      this._networkInfo
  ) : super(CartInitial());

  String? cartId;
  String? regionId;
  CartResponseEntity? items;



  bool isOfflineMode= false;
  Future<void> ensureCartId() async {
    cartId ??= SharedPrefHelper.getString(key: 'cartId');

    if (cartId != null) return;

    final regionResult = await regionsUseCase(NoParams());

    if (regionResult.result.isLeft()) {
      emit(CartItemsError("Region Error"));
      return;
    }

    final regionId = regionResult.result.getOrElse(() => "");

    await SharedPrefHelper.setData(key: 'region', value: regionId);
    final email = SharedPrefHelper.getString(key: 'email');

    final createResult = await cartUseCase({
      "region_id": regionId,
      "email": email,
    });

    if (createResult.result.isLeft()) {
      emit(CartItemsError("Create Cart Error"));
      return;
    }

    final newCartId = createResult.result.getOrElse(() => "");

    cartId = newCartId;

    await SharedPrefHelper.setData(key: 'cartId', value: newCartId);
  }

  Future<void> getCartItems() async {
    emit(CartItemsLoading());
    await ensureCartId();
    if (cartId == null) {
      emit(CartItemsError("Cart Id is null"));
      return;
    }
    final isOnline =
    await _networkInfo
        .isServerAlive;

    isOfflineMode = !isOnline;
    final result = await cartItemUseCase(cartId!);
    result.result.fold((failure) => emit(CartItemsError("Get Cart Error")), (
      cartData,
    ) {
      items = cartData;
      emit(CartItemsSuccess(cartData));
    });
  }

  Future<void> addCart({
    required String variantId,
    required int quantity,
    required CartItemEntity cartItem,
  })
  async {
    regionId ??= SharedPrefHelper.getString(key: 'region');
    await ensureCartId();
    if (cartId == null) return;

    items ??= CartResponseEntity(
      cart: CartEntity(items: [], total: 0, id: cartId!, regionId: regionId!),
    );

    final index = items!.cart.items.indexWhere((e) => e.variantId == variantId);

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

    await localDataSource.cacheCartItemsLocal(
      CartLocalMapper.toLocalEntityModel(items!),

      cartId!,
    );

    try {
      await addCartUseCase(
        AddCartRequest(cartId!, {
          "variant_id": variantId,
          "quantity": quantity,
        }),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> deleteCart({
    required String lineId,
    required String variantId,
  })
  async {
    if (items == null) return;
    items!.cart.items.removeWhere((e) => e.id == lineId);
    items!.cart.total = items!.cart.items.fold<int>(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    emit(CartItemsSuccess(items!));
    await localDataSource.cacheCartItemsLocal(
      CartLocalMapper.toLocalEntityModel(items!),

      cartId!,
    );
    try {
      await deleteCartUseCase(DeleteCartParams(cartId!, lineId));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> updateCart({
    required String lineId,
    required int quantity,
  })
  async {
    if (items == null) return;

    final item = items!.cart.items.firstWhere((e) => e.id == lineId);


    item.quantity = quantity;

    items!.cart.total = items!.cart.items.fold<int>(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    emit(CartItemsSuccess(items!));
    await localDataSource.cacheCartItemsLocal(
      CartLocalMapper.toLocalEntityModel(items!),

      cartId!,
    );
    try {
      await updateCartUseCase(
        UpdateCartParams(cartId!, lineId, {"quantity": quantity}),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> clearCart() async {
    items = null;
    cartId = null;
    await SharedPrefHelper.removeData('cartId');
    emit(CartInitial());
  }
}
