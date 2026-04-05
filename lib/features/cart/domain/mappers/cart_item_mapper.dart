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
      items: model.items.map((item) => toItemEntity(item)).toList(),
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
}