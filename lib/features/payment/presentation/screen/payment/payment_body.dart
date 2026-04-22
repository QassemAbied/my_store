import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/payment/presentation/screen/payment/widget/pay_button_widget.dart';
import 'package:my_store/features/payment/presentation/screen/payment/widget/secure_text_widget.dart';
import '../../../../../core/common_widgets/custom_order_summery/order_summery_widget.dart';
import '../../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../../cart/presentation/cubit/cart_state.dart';

class PaymentBody extends StatelessWidget {
  const PaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SecureTextWidget(),
          ),
        ),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartItemsSuccess) {
              final cart = state.cartResponseEntity.cart;

              return OrderSummeryWidget(
                items: cart.items,
                subtotal: cart.subtotal ?? 0,
                shippingTotal: cart.shippingTotal ?? 0,
                total: cart.total,
              );
            }

            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: PayButtonWidget(),
          ),
        ),
      ],
    );
  }
}
