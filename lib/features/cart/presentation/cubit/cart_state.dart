import 'package:my_store/features/cart/domain/entities/cart_item.dart';

import '../../domain/entities/address_entities.dart';
import '../../domain/entities/shipping_entites.dart';

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

class DeleteCartLoading extends CartState {}
class DeleteCartSuccess extends CartState {}
class DeleteCartError extends CartState {
  final String message;
  DeleteCartError(this.message);
}

class UpdateCartLoading extends CartState {}
class UpdateCartSuccess extends CartState {}
class UpdateCartError extends CartState {
  final String message;
  UpdateCartError(this.message);
}


class ShippingLoading extends CartState {}
class ShippingSuccess extends CartState {
  final ShippingEntity shippingEntity;
  ShippingSuccess(this.shippingEntity);
}
class ShippingError extends CartState {
  final String message;
  ShippingError(this.message);
}

class AddShippingLoading extends CartState {}
class AddShippingSuccess extends CartState {}
class AddShippingError extends CartState {
  final String message;
  AddShippingError(this.message);
}



class CheckoutLoading extends CartState {}

class CheckoutSuccess extends CartState {}

class CheckoutError extends CartState {
  final String message;
  CheckoutError(this.message);
}




class AddressLoading extends CartState {}

/// success (GET)
class AddressSuccess extends CartState {
  final AddressResponseEntity addresses;

  AddressSuccess(this.addresses);
}

/// error
class AddressError extends CartState {
  final String message;

  AddressError(this.message);
}

/// 🔥 ADD loading
class AddAddressLoading extends CartState {}

/// 🔥 ADD success
class AddAddressSuccess extends CartState {}

/// 🔥 ADD error
class AddAddressError extends CartState {
  final String message;

  AddAddressError(this.message);
}

/// 🔥 DELETE loading
class DeleteAddressLoading extends CartState {}

/// 🔥 DELETE success
class DeleteAddressSuccess extends CartState {}

/// 🔥 DELETE error
class DeleteAddressError extends CartState {
  final String message;

  DeleteAddressError(this.message);
}



class AddShippingAddressSuccess extends CartState {
  final CartResponseEntity cart;
  AddShippingAddressSuccess(this.cart);
}

class AddShippingAddressError extends CartState {
  final String message;
  AddShippingAddressError(this.message);
}




