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
