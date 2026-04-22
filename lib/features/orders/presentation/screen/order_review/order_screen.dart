import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/common_widgets/custom_primary_button.dart';
import 'package:my_store/features/orders/presentation/screen/order_review/order_body.dart';
import '../../../../../core/utils/extension.dart';
import '../../../../../core/utils/routing/routers.dart';
import '../../../../bottom_nav_bar/controller/bottom_nav_cubit.dart';
import '../../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../../cart/presentation/screens/step.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;

  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StepHeader(currentStep: 4, totalSteps: 4),
            Expanded(child: OrderBody()),
          ],
        ),
      ),
      floatingActionButton: CustomElevatedButton(
        onPressed: () async {
          await context.read<CartCubit>().getCartItems();
          context.read<BottomNavCubit>().changeBottomNavIndex(0);
          context.pushNamedAndRemoveUntil(Routers.bottomNav);
        },
        text: 'Reorder',
      ),
    );
  }
}
