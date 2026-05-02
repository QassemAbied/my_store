import '../../data/models/order_list_model.dart';
import '../entitiy/order_list_entitiy.dart';

extension OrdersMapper on OrdersResponseModel {
  OrdersEntity toEntity() {
    return OrdersEntity(
      orders: orders.toEntityList(),
      count: count,
    );
  }
}

extension OrderMapper on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      status: status,
      total: total,
      createdAt: createdAt,
      items: items.toEntityList(),
    );
  }
}

extension OrderItemMapper on OrderItemModel {
  OrderItemEntity toEntity() {
    return OrderItemEntity(
      title: title,
      quantity: quantity,
      price: unitPrice,
      thumbnail: thumbnail,
    );
  }
}

extension OrderListMapper on List<OrderModel> {
  List<OrderEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }
}

extension OrderItemListMapper on List<OrderItemModel> {
  List<OrderItemEntity> toEntityList() {
    return map((e) => e.toEntity()).toList();
  }
}