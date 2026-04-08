import '../../data/models/cart_item_model.dart';
import '../entities/cart_item.dart';

class CartMapper {
  static CartResponseEntity toResponseEntity(CartResponseModel model) {
    return CartResponseEntity(
      cart: toEntity(model.cart),
    );
  }

  static CartEntity toEntity(CartModel model) {
    return CartEntity(
      id: model.id,
      regionId: model.regionId,
      total: model.total,
      subtotal: model.subtotal,
      shippingTotal: model.shippingTotal,
      currencyCode: model.currencyCode,
      email: model.email,
      items: model.items.map(toItemEntity).toList(),
      shippingAddress: model.shippingAddress != null
          ? toAddressEntity(model.shippingAddress!)
          : null,
      billingAddress: model.billingAddress != null
          ? toAddressEntity(model.billingAddress!)
          : null,
    );
  }

  static CartItemEntity toItemEntity(CartItemModel model) {
    return CartItemEntity(
      id: model.id,
      title: model.title,
      quantity: model.quantity,
      price: model.price,
      thumbnail: model.thumbnail,
    );
  }

  static AddressEntity toAddressEntity(AddressModel model) {
    return AddressEntity(
      firstName: model.firstName,
      lastName: model.lastName,
      address1: model.address1,
      city: model.city,
      countryCode: model.countryCode,
    );
  }
}