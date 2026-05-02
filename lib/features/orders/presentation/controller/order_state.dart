import '../../domain/entitiy/order_list_entitiy.dart';
import '../../domain/entitiy/order_review_entities.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderReviewLoading extends OrderState {}

class OrderReviewSuccess extends OrderState {
  final OrderReviewEntity order;

  OrderReviewSuccess(this.order);
}

class OrderReviewError extends OrderState {
  final String message;

  OrderReviewError(this.message);
}



class OrderListLoading extends OrderState {}

class OrderListSuccess extends OrderState {
  final OrdersEntity order;

  OrderListSuccess(this.order);
}

class OrderListError extends OrderState {
  final String message;

  OrderListError(this.message);
}
