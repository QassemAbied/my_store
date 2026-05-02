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
        SliverPadding(padding: EdgeInsetsGeometry.all(16),
          sliver: SliverList(delegate: SliverChildListDelegate(
            [
              SecureTextWidget(),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartItemsSuccess) {
                    final cart = state.cartResponseEntity.cart;

                    return OrderSummeryWidget(
                      items: cart.items,
                      item:  cart,
                      isShow: true,
                    );
                  }

                  return Center(child: CircularProgressIndicator());
                },
              ),
              PayButtonWidget()
            ]
          )),
        ),
      ],
    );
  }
}
