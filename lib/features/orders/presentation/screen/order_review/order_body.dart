import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/orders/presentation/screen/order_review/widgets/address_widget.dart';
import 'package:my_store/features/orders/presentation/screen/order_review/widgets/dummy_payment_widget.dart';
import 'package:my_store/features/orders/presentation/screen/order_review/widgets/header_order_review_widget.dart';
import 'package:my_store/features/orders/presentation/screen/order_review/widgets/time_line_order_widget.dart';
import '../../../../../core/common_widgets/custom_order_summery/order_summery_widget.dart';
import '../../../../../core/utils/spacing.dart';
import '../../controller/order_cubit.dart';
import '../../controller/order_state.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderReviewLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is OrderReviewError) {
          return Center(child: Text(state.message));
        }

        if (state is OrderReviewSuccess) {
          final order = state.order;
          final total = order.items.fold(
            0,
            (sum, e) => sum + (e.price * e.quantity),
          );

          return CustomScrollView(
            slivers: [
              HeaderOrderReviewWidget(order: order),
              const TimeLineOrderWidget(),
              SliverToBoxAdapter(child: verticalSpace(10)),
              const DummyPaymentWidget(),
              SliverToBoxAdapter(child: verticalSpace(10)),
              OrderSummeryWidget(
                items: order.items,
                subtotal: total,
                shippingTotal: 0,
                total: total,
              ),
              SliverToBoxAdapter(child: verticalSpace(10)),
              AddressWidget(order: order),
              SliverToBoxAdapter(child: verticalSpace(50)),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
