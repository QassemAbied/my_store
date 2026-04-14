import 'package:flutter/material.dart';
import 'package:my_store/features/cart/presentation/screens/widget/total_and_checkout_widget.dart';
import '../../../domain/entities/cart_item.dart';
import 'cart_list_widget.dart';

class CartComponentWidget extends StatelessWidget {
  const CartComponentWidget({super.key, required this.cartResponseEntity});
  final  CartResponseEntity cartResponseEntity;

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        CartListWidget(cartResponseEntity: cartResponseEntity,),
        TotalAndCheckoutWidget(cartResponseEntity: cartResponseEntity,),

      ],
    );
  }
}
