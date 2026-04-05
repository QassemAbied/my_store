


class CartResponseEntity {
  final CartEntity cart;

  CartResponseEntity({required this.cart});

}


class CartEntity {
  final String id;
  final String regionId;
  final int total;
  final List<CartItemEntity> items;

  CartEntity({
    required this.id,
    required this.regionId,
    required this.total,
    required this.items,
  });
}

class CartItemEntity {
  final String id;
  final String thumbnail;
  final String title;
  final int quantity;
  final int price;

  CartItemEntity({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price, required this.thumbnail,
  });
}