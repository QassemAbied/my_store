import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/cart/presentation/screens/widget/cart_component_widget.dart';
import 'package:my_store/features/cart/presentation/screens/widget/cart_empty_widget.dart';
import 'package:my_store/features/cart/presentation/screens/widget/cart_shimmer_widget.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_state.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartItemsLoading) {
          return const CartListShimmer();
        }
        if (state is CartItemsError) {
          return Center(child: Text(state.message));
        }
        if (state is CartItemsSuccess) {
          final cart = state.cartResponseEntity.cart;
          final items = cart.items;
          if (items.isEmpty) {
            return EmptyCartWidget();
          }
          return CartComponentWidget(
            cartResponseEntity: state.cartResponseEntity,
          );
        }

        return const SizedBox();
      },
    );
  }
}
