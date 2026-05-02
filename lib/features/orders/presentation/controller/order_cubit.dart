import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/use_case.dart';
import '../../domain/use_case/order_list_use_case.dart';
import '../../domain/use_case/order_review_use_case.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderReviewUseCase _orderReviewUseCase;
  final OrderListUseCase _orderListUseCase;

  OrderCubit(this._orderReviewUseCase,this._orderListUseCase)
      : super(OrderInitial());




  Future<void> loadOrderReview(String orderId) async {
    emit(OrderReviewLoading());
    final result = await _orderReviewUseCase(orderId);

    result.result.fold(
      (failure) => emit(OrderReviewError(failure.toString())),
      (data) => emit(OrderReviewSuccess(data)),
    );
  }

  Future<void> loadOrderList() async {
    emit(OrderListLoading());
    final result = await _orderListUseCase(NoParams());

    result.result.fold(
          (failure) => emit(OrderListError(failure.toString())),
          (data) => emit(OrderListSuccess(data)),
    );
  }

}
