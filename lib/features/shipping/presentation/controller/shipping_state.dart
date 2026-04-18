import '../../../cart/domain/entities/cart_item.dart';
import '../../domain/entities/shipping_entites.dart';

class ShippingState {}

final class ShippingInitial extends ShippingState {}



class ShippingLoading extends ShippingState {}
class ShippingSuccess extends ShippingState {
  final ShippingEntity shippingEntity;
  ShippingSuccess(this.shippingEntity);
}
class ShippingError extends ShippingState {
  final String message;
  ShippingError(this.message);
}

class AddShippingLoading extends ShippingState {}
class AddShippingSuccess extends ShippingState {}
class AddShippingError extends ShippingState {
  final String message;
  AddShippingError(this.message);
}

class AddShippingAddressLoading extends ShippingState {}
class AddShippingAddressSuccess extends ShippingState {
  final CartResponseEntity cart;
  AddShippingAddressSuccess(this.cart);
}
class AddShippingAddressError extends ShippingState {
  final String message;
  AddShippingAddressError(this.message);
}