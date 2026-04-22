import 'package:my_store/features/orders/data/models/order_review_model.dart';
import 'package:my_store/features/orders/domain/entitiy/order_review_entities.dart';

extension OrderMapper on OrderReviewResponseModel {
  OrderReviewEntity toEntity() {
    return OrderReviewEntity(
      id: order.id,
      status: order.status,
      email: order.email,
      items: order.items.map((e) => e.toEntity()).toList(),
      address: order.shippingAddress?.toEntity(),
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

extension AddressMapper on ShippingAddressModel {
  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      address: address1,
      city: city,
      country: countryCode,
    );
  }
}
