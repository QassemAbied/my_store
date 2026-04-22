import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../entitiy/order_review_entities.dart';
import '../repository.dart';

class OrderReviewUseCase extends UseCase<OrderReviewEntity, String> {
  final OrderRepository repo;

  OrderReviewUseCase(this.repo);

  @override
  Future<ApiResult<OrderReviewEntity>> call(String cartId) async {
    return await repo.getOrderReview(cartId);
  }
}
