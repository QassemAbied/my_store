import 'package:flutter/material.dart';
import '../../../domain/entities/cart_item.dart';
import 'cart_item_widget.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key, required this.cartResponseEntity});
  final CartResponseEntity cartResponseEntity;
  @override
  Widget build(BuildContext context) {
    final cart = cartResponseEntity.cart;
    final items = cart.items;
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return CartItemWidget(
              key: ValueKey(item.id),
              item: item);
        },
      ),
    );
  }
}
