import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/order_review_use_case.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderReviewUseCase _orderReviewUseCase;
  OrderCubit(this._orderReviewUseCase) : super(OrderInitial());

  Future<void> loadOrderReview(String orderId) async {
    emit(OrderReviewLoading());
    final result = await _orderReviewUseCase(orderId);

    result.result.fold(
      (failure) => emit(OrderReviewError(failure.toString())),
      (data) => emit(OrderReviewSuccess(data)),
    );
  }
}
