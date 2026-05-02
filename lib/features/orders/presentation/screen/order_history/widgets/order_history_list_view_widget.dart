import 'package:flutter/material.dart';
import '../../../../domain/entitiy/order_list_entitiy.dart';
import 'order_history_list_item_widget.dart';

class OrderHistoryListViewWidget extends StatelessWidget {
  const OrderHistoryListViewWidget({super.key, required this.orders});
 final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return OrderHistoryListItemWidget(order: orders[index]);
      },
    );
  }
}
