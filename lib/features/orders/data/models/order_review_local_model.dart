import 'package:hive_ce/hive.dart';

part 'order_review_local_model.g.dart';

@HiveType(typeId: 17)
class OrderReviewResponseLocalModel extends HiveObject {

  @HiveField(0)
  final OrderReviewLocalModel order;

  OrderReviewResponseLocalModel({
    required this.order,
  });
}

@HiveType(typeId: 18)
class OrderReviewLocalModel extends HiveObject {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String status;

  @HiveField(2)
  final String currencyCode;

  @HiveField(3)
  final String createdAt;

  @HiveField(4)
  final int total;

  @HiveField(5)
  final List<OrderReviewItemLocalModel> items;

  @HiveField(6)
  final ShippingAddressLocalModel? shippingAddress;

  @HiveField(7)
  final CustomerOrderLocalModel? customer;

  OrderReviewLocalModel({
    required this.id,
    required this.status,
    required this.currencyCode,
    required this.createdAt,
    required this.total,
    required this.items,
    this.shippingAddress,
    this.customer,
  });
}

@HiveType(typeId: 19)
class CustomerOrderLocalModel extends HiveObject {

  @HiveField(0)
  final String? email;

  CustomerOrderLocalModel({
    this.email,
  });
}

@HiveType(typeId: 20)
class OrderReviewItemLocalModel extends HiveObject {

  @HiveField(0)
  final String title;

  @HiveField(1)
  final int quantity;

  @HiveField(2)
  final int unitPrice;

  @HiveField(3)
  final String? thumbnail;

  OrderReviewItemLocalModel({
    required this.title,
    required this.quantity,
    required this.unitPrice,
    this.thumbnail,
  });
}

@HiveType(typeId: 21)
class ShippingAddressLocalModel extends HiveObject {

  @HiveField(0)
  final String address1;

  @HiveField(1)
  final String city;

  @HiveField(2)
  final String countryCode;

  @HiveField(3)
  final String? firstName;

  @HiveField(4)
  final String? lastName;

  ShippingAddressLocalModel({
    required this.address1,
    required this.city,
    required this.countryCode,
    this.firstName,
    this.lastName,
  });
}