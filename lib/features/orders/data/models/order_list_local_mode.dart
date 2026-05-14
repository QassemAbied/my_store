import 'package:hive_ce/hive.dart';

part 'order_list_local_mode.g.dart';

@HiveType(typeId: 14)
class OrdersResponseLocalModel extends HiveObject {

  @HiveField(0)
  final List<OrderLocalModel> orders;

  @HiveField(1)
  final int count;

  OrdersResponseLocalModel({
    required this.orders,
    required this.count,
  });
}

@HiveType(typeId: 15)
class OrderLocalModel extends HiveObject {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String status;

  @HiveField(2)
  final int total;

  @HiveField(3)
  final String createdAt;

  @HiveField(4)
  final List<OrderItemLocalModel> items;

  OrderLocalModel({
    required this.id,
    required this.status,
    required this.total,
    required this.createdAt,
    required this.items,
  });
}

@HiveType(typeId: 16)
class OrderItemLocalModel extends HiveObject {

  @HiveField(0)
  final String title;

  @HiveField(1)
  final int quantity;

  @HiveField(2)
  final int unitPrice;

  @HiveField(3)
  final String? thumbnail;

  OrderItemLocalModel({
    required this.title,
    required this.quantity,
    required this.unitPrice,
    this.thumbnail,
  });
}