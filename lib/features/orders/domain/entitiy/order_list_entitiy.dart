class OrdersEntity {
  final List<OrderEntity> orders;
  final int count;

  OrdersEntity({
    required this.orders,
    required this.count,
  });
}

class OrderEntity {
  final String id;
  final String status;
  final int total;
  final String createdAt;
  final List<OrderItemEntity> items;

  OrderEntity({
    required this.id,
    required this.status,
    required this.total,
    required this.createdAt,
    required this.items,
  });
}

class OrderItemEntity {
  final String title;
  final int quantity;
  final int price;
  final String? thumbnail;

  OrderItemEntity({
    required this.title,
    required this.quantity,
    required this.price,
    this.thumbnail,
  });
}