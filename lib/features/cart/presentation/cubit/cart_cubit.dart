import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/use_case.dart';
import '../../domain/entities/add_cart_request.dart';
import '../../domain/usecases/add_cart_use_case.dart';
import '../../domain/usecases/cart_item_use_case.dart';
import '../../domain/usecases/create_cart_use_case.dart';
import '../../domain/usecases/regions_use_case.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final RegionsUseCase regionsUseCase;
  final CartItemUseCase cartItemUseCase;
  final CreateCartUseCase cartUseCase;
  final AddCartUseCase addCartUseCase;

  CartCubit(this.regionsUseCase, this.cartItemUseCase,
      this.cartUseCase, this.addCartUseCase)
    : super(CartInitial());

  String? cartItemsId;


  Future getCartItems() async {
    emit(CartItemsLoading());
    if (cartItemsId != null) {
      final result = await cartItemUseCase(cartItemsId!);

      result.result.fold(
            (failure) => emit(CartItemsError("Get Cart Error")),
            (cartData) => emit(CartItemsSuccess(cartData)),
      );

      return;
    }
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
            cartItemsId= cartId;
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
  Future addCart({required String variantId,required int quantity})async{
    emit(AddCartLoading());
    if (cartItemsId == null) {
      await getCartItems();
    }
    final cartId = cartItemsId;
    if(cartId ==null){
      emit(AddCartError("Cart Id is null"));
      return;
    }
    final result = await addCartUseCase(

        AddCartRequest(cartId , {
          "variant_id": variantId,
          "quantity": quantity
        }));

    result.result.fold(
            (failure)=>emit(AddCartError(failure.toString())),
        (data)=>emit(AddCartSuccess()));


  }
}
