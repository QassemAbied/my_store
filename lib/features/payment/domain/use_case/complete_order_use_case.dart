import 'dart:async';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../../../orders/domain/entitiy/order_review_entities.dart';
import '../repository.dart';

class CompleteOrderUseCase extends UseCase<OrderReviewEntity, String> {
  final PaymentRepository repo;

  CompleteOrderUseCase(this.repo);

  @override
  Future<ApiResult<OrderReviewEntity>> call(String cartId) async {
    return await repo.completeOrder(cartId);
  }
}
