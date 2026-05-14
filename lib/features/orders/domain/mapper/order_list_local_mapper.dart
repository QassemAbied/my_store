import '../../data/models/order_list_local_mode.dart';
import '../../data/models/order_list_model.dart';
import '../entitiy/order_list_entitiy.dart';

class OrdersLocalMapper {

  // =========================
  // Remote -> Local
  // =========================

  static OrdersResponseLocalModel
  toLocalModel(
      OrdersResponseModel model,
      ) {

    return OrdersResponseLocalModel(

      orders:
      model.orders
          .map(
            (e) => toOrderLocalModel(e),
      ).toList(),

      count: model.count,
    );
  }

  static OrderLocalModel
  toOrderLocalModel(
      OrderModel model,
      ) {

    return OrderLocalModel(

      id: model.id,

      status: model.status,

      total: model.total,

      createdAt: model.createdAt,

      items:
      model.items
          .map(
            (e) => toItemLocalModel(e),
      ).toList(),
    );
  }

  static OrderItemLocalModel
  toItemLocalModel(
      OrderItemModel model,
      ) {

    return OrderItemLocalModel(

      title: model.title,

      quantity: model.quantity,

      unitPrice: model.unitPrice,

      thumbnail: model.thumbnail,
    );
  }

  // =========================
  // Local -> Entity
  // =========================

  static OrdersEntity
  toLocalEntity(
      OrdersResponseLocalModel model,
      ) {

    return OrdersEntity(

      orders:
      model.orders
          .map(
            (e) => toLocalOrderEntity(e),
      ).toList(),

      count: model.count,
    );
  }

  static OrderEntity
  toLocalOrderEntity(
      OrderLocalModel model,
      ) {

    return OrderEntity(

      id: model.id,

      status: model.status,

      total: model.total,

      createdAt: model.createdAt,

      items:
      model.items
          .map(
            (e) => toLocalItemEntity(e),
      ).toList(),
    );
  }

  static OrderItemEntity
  toLocalItemEntity(
      OrderItemLocalModel model,
      ) {

    return OrderItemEntity(

      title: model.title,

      quantity: model.quantity,

      price: model.unitPrice,

      thumbnail: model.thumbnail,
    );
  }
}