import 'package:my_store/features/cart/domain/entities/cart_item.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartItemsLoading extends CartState {}

class CartItemsSuccess extends CartState {
  final CartResponseEntity cartResponseEntity;

  CartItemsSuccess(this.cartResponseEntity);
}

class CartItemsError extends CartState {
  final String message;
  CartItemsError(this.message);
}


class AddCartLoading extends CartState {}

class AddCartSuccess extends CartState {}

class AddCartError extends CartState {
  final String message;
  AddCartError(this.message);
}