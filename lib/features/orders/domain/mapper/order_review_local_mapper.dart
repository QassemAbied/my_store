import '../../data/models/order_review_local_model.dart';
import '../../data/models/order_review_model.dart';
import '../entitiy/order_review_entities.dart';

class OrderReviewLocalMapper {


  // =========================
  // Remote -> Local
  // =========================

  static OrderReviewResponseLocalModel
  toLocalModel(
      OrderReviewResponseModel model,
      ) {

    return OrderReviewResponseLocalModel(

      order:
      toOrderLocalModel(model.order),
    );
  }

  static OrderReviewLocalModel
  toOrderLocalModel(
      OrderModel model,
      ) {

    return OrderReviewLocalModel(

      id: model.id,

      status: model.status,

      currencyCode:
      model.currencyCode,

      createdAt:
      model.createdAt,

      total: model.total,

      items:
      model.items
          .map(
            (e) => toItemLocalModel(e),
      ).toList(),

      shippingAddress:
      model.shippingAddress != null

          ? toAddressLocalModel(
          model.shippingAddress!)

          : null,

      customer:
      model.customer != null

          ? toCustomerLocalModel(
          model.customer!)

          : null,
    );
  }

  static OrderReviewItemLocalModel
  toItemLocalModel(
      OrderItemModel model,
      ) {

    return OrderReviewItemLocalModel(

      title: model.title,

      quantity: model.quantity,

      unitPrice: model.unitPrice,

      thumbnail: model.thumbnail,
    );
  }

  static ShippingAddressLocalModel
  toAddressLocalModel(
      ShippingAddressModel model,
      ) {

    return ShippingAddressLocalModel(

      address1: model.address1,

      city: model.city,

      countryCode:
      model.countryCode,

      firstName: model.firstName,

      lastName: model.lastName,
    );
  }

  static CustomerOrderLocalModel
  toCustomerLocalModel(
      CustomerModel model,
      ) {

    return CustomerOrderLocalModel(
      email: model.email,
    );
  }

  // =========================
  // Local -> Entity
  // =========================

  static OrderReviewEntity
  toLocalEntity(
      OrderReviewResponseLocalModel model,
      ) {

    return OrderReviewEntity(

      id: model.order.id,

      status: model.order.status,

      currencyCode:
      model.order.currencyCode,

      createdAt:
      model.order.createdAt,

      total: model.order.total,

      email:
      model.order.customer?.email,

      items:
      model.order.items
          .map(
            (e) => toLocalItemEntity(e),
      ).toList(),

      address:
      model.order.shippingAddress != null

          ? toLocalAddressEntity(
          model.order.shippingAddress!)

          : null,
    );
  }

  static OrderItemEntity
  toLocalItemEntity(
      OrderReviewItemLocalModel model,
      ) {

    return OrderItemEntity(

      title: model.title,

      quantity: model.quantity,

      price: model.unitPrice,

      thumbnail: model.thumbnail,
    );
  }

  static ShippingAddressEntity
  toLocalAddressEntity(
      ShippingAddressLocalModel model,
      ) {

    return ShippingAddressEntity(

      address: model.address1,

      city: model.city,

      country: model.countryCode,

      firstName: model.firstName,

      lastName: model.lastName,
    );
  }
}