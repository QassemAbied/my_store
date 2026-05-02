import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/common_widgets/custom_primary_button.dart';
import 'package:my_store/features/orders/presentation/screen/order_review/order_body.dart';
import '../../../../../core/utils/extension.dart';
import '../../../../../core/utils/routing/routers.dart';
import '../../../../bottom_nav_bar/controller/bottom_nav_cubit.dart';
import '../../../../cart/presentation/cubit/cart_cubit.dart';

class OrderReviewScreen extends StatelessWidget {
  final String orderId;
  final bool showButton;

  const OrderReviewScreen({super.key, required this.orderId,
  this.showButton=false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: OrderBody()),
          ],
        ),
      ),
      bottomNavigationBar:showButton? Padding(
        padding: const EdgeInsets.all(16),
        child: CustomElevatedButton(
          onPressed: () async {
            await context.read<CartCubit>().getCartItems();
            context.read<BottomNavCubit>().changeBottomNavIndex(0);
            context.pushNamedAndRemoveUntil(Routers.bottomNav);
          },
          text: 'Reorder',
        ),
      ):null,
    );
  }
}
