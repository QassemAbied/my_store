import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/orders/presentation/screen/order_review/widgets/address_widget.dart';
import 'package:my_store/features/orders/presentation/screen/order_review/widgets/dummy_payment_widget.dart';
import 'package:my_store/features/orders/presentation/screen/order_review/widgets/hero_header_widget.dart';
import 'package:my_store/features/orders/presentation/screen/order_review/widgets/total_card_widget.dart';
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
           return CustomScrollView(
             slivers: [
               SliverAppBar(
                 expandedHeight: 250,
                 pinned: true,
                 flexibleSpace: FlexibleSpaceBar(
                   background: HeroHeaderWidget( order: order,),
                 ),
               ),

               SliverPadding(
                 padding:  EdgeInsets.all(
                     16
                 ),
                 sliver: SliverList(
                   delegate: SliverChildListDelegate([
                     verticalSpace(20),

                     OrderSummeryWidget(
                         items: order.items,
                       item: order,
                       isShow: false,
                     ),
                     verticalSpace(20),
                     if (order.address != null)
                       AddressWidget(order: order,),
                     verticalSpace(16),
                     DummyPaymentWidget(),
                     verticalSpace(20),
                     TotalCardWidget(order: order,),


                   ]),
                 ),
               ),
             ],
           );
        }

        return const SizedBox();
      },
    );
  }
}
