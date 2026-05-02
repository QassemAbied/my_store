import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/orders/presentation/screen/order_history/widgets/empty_order_history.dart';
import 'package:my_store/features/orders/presentation/screen/order_history/widgets/loading_order_history_widget.dart';
import 'package:my_store/features/orders/presentation/screen/order_history/widgets/order_history_list_view_widget.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../controller/order_cubit.dart';
import '../../controller/order_state.dart';

class OrderHistoryBody extends StatelessWidget {
  const OrderHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {

        if (state is OrderListLoading) {
          return const OrdersShimmerList();
        }

        if (state is OrderListError) {
          return Center(
            child: Text(
              state.message,
              style: AppTextStyle.medium(
                fontSize: 16,
                color: context.error,
              ),
            ),
          );
        }

        if (state is OrderListSuccess) {
          if (state.order.orders.isEmpty) {
            return const EmptyOrdersWidget();
          }
          final orders = state.order.orders;

          return OrderHistoryListViewWidget(orders: orders);
        }

        return const SizedBox();
      },
    );
  }
}

