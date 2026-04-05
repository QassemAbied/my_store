import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/use_case.dart';
import '../../domain/usecases/cart_item_use_case.dart';
import '../../domain/usecases/create_cart_use_case.dart';
import '../../domain/usecases/regions_use_case.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final RegionsUseCase regionsUseCase;
  final CartItemUseCase cartItemUseCase;
  final CreateCartUseCase cartUseCase;

  CartCubit(this.regionsUseCase, this.cartItemUseCase, this.cartUseCase)
    : super(CartInitial());

  String? cartItemsId;


  Future getCartItems() async {
    emit(CartItemsLoading());

    final resultRegions = await regionsUseCase(NoParams());

    resultRegions.result.fold(
      (failure) {
        emit(CartItemsError("Region Error"));
      },
      (regionId) async {
        final resultCreateCart = await cartUseCase(
            {"region_id": regionId});

        resultCreateCart.result.fold(
          (failure) {
            emit(CartItemsError("Create Cart Error"));
          },
          (cartId) async {
            cartId= cartItemsId!;
            final resultCartItems = await cartItemUseCase(cartId);

            resultCartItems.result.fold(
              (failure) {
                emit(CartItemsError("Get Cart Error"));
              },
              (cartData) {
                emit(CartItemsSuccess(cartData));
              },
            );
          },
        );
      },
    );
  }
}
