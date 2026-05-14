import '../../data/models/cart_item_model.dart';
import '../../data/models/cart_local_model.dart';
import '../entities/cart_item.dart';

class CartLocalMapper {
  static CartResponseEntity toLocalEntity(CartResponseLocalModel cart) {
    return CartResponseEntity(cart: toCartLocalEntity(cart.cart));
  }
  static CartEntity toCartLocalEntity(CartLocalModel cart) {
    return CartEntity(
        id: cart.id,
        regionId: cart.regionId,
        total: cart.total,
        items: cart.items.map((e)=>toCartItemLocalEntity(e)).toList(),
        subtotal: cart.subtotal,
        shippingTotal: cart.shippingTotal,
        currencyCode: cart.currencyCode,
        email: cart.email,
        shippingAddress: cart.shippingAddress!=null?toAddressLocalEntity(cart.shippingAddress!):null,
        billingAddress: cart.billingAddress!=null?toAddressLocalEntity(cart.billingAddress!):null,
    );
  }
  static CartItemEntity toCartItemLocalEntity(CartItemLocalModel cart) {
    return CartItemEntity(
        id: cart.id,
        title: cart.title,
        quantity: cart.quantity,
        price: cart.price,
        productId: cart.productId,
        thumbnail: cart.thumbnail,
        variantId: cart.variantId,
    );
  }
  static AddressEntity toAddressLocalEntity(AddressLocalModel address) {
    return AddressEntity(
      firstName: address.firstName,
      lastName: address.lastName,
      address1: address.address1,
      city: address.city,
      countryCode: address.countryCode,
    );
  }




  static CartResponseLocalModel toLocalModel(CartResponseModel cart)
  {
    return CartResponseLocalModel(cart: toCartLocalModel(cart.cart));
  }
  static CartLocalModel toCartLocalModel(CartModel cart) {
    return CartLocalModel(
      id: cart.id,
      regionId: cart.regionId,
      total: cart.total,
      items: cart.items.map((e)=>toCartItemLocalModel(e)).toList(),
      subtotal: cart.subtotal,
      shippingTotal: cart.shippingTotal,
      currencyCode: cart.currencyCode,
      email: cart.email,
      shippingAddress: cart.shippingAddress!=null?toAddressLocalModel(cart.shippingAddress!):null,
      billingAddress: cart.billingAddress!=null?toAddressLocalModel(cart.billingAddress!):null,
    );
  }
  static CartItemLocalModel toCartItemLocalModel(CartItemModel cart)
  {
    return CartItemLocalModel(
      id: cart.id,
      title: cart.title,
      quantity: cart.quantity,
      price: cart.price,
      productId: cart.productId,
      thumbnail: cart.thumbnail,
      variantId: cart.variantId,
    );
  }
  static AddressLocalModel toAddressLocalModel(AddressModel address)
  {
    return AddressLocalModel(
      firstName: address.firstName,
      lastName: address.lastName,
      address1: address.address1,
      city: address.city,
      countryCode: address.countryCode,
    );
  }

  static CartResponseLocalModel
  toLocalEntityModel(
      CartResponseEntity cart,
      ) {

    return CartResponseLocalModel(

      cart: CartLocalModel(

        id: cart.cart.id,

        regionId: cart.cart.regionId,

        total: cart.cart.total,

        items: cart.cart.items
            .map(
              (e) => CartItemLocalModel(

            id: e.id,

            title: e.title,

            quantity: e.quantity,

            price: e.price,

            productId: e.productId,

            thumbnail: e.thumbnail,

            variantId: e.variantId,
          ),
        ).toList(),

        subtotal: cart.cart.subtotal,

        shippingTotal:
        cart.cart.shippingTotal,

        currencyCode:
        cart.cart.currencyCode,

        email:
        cart.cart.email,

        shippingAddress:
        cart.cart.shippingAddress != null

            ? AddressLocalModel(

          firstName:
          cart.cart.shippingAddress!
              .firstName,

          lastName:
          cart.cart.shippingAddress!
              .lastName,

          address1:
          cart.cart.shippingAddress!
              .address1,

          city:
          cart.cart.shippingAddress!
              .city,

          countryCode:
          cart.cart.shippingAddress!
              .countryCode,
        )

            : null,

        billingAddress:
        cart.cart.billingAddress != null

            ? AddressLocalModel(

          firstName:
          cart.cart.billingAddress!
              .firstName,

          lastName:
          cart.cart.billingAddress!
              .lastName,

          address1:
          cart.cart.billingAddress!
              .address1,

          city:
          cart.cart.billingAddress!
              .city,

          countryCode:
          cart.cart.billingAddress!
              .countryCode,
        )

            : null,
      ),
    );
  }
}