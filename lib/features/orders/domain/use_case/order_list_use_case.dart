import '../../../../core/network/api_result.dart';
import '../../../../core/network/use_case.dart';
import '../entitiy/order_list_entitiy.dart';
import '../repository.dart';

class OrderListUseCase extends UseCase<OrdersEntity, NoParams> {
  final OrderRepository repo;

  OrderListUseCase(this.repo);

  @override
  Future<ApiResult<OrdersEntity>> call(NoParams params) async {
    return await repo.getOrderList();
  }
}