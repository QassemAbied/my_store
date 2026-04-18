import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/cart/presentation/screens/payment/payment_screen.dart';
import 'package:my_store/features/shipping/presentation/screen/shipping_screen.dart';
import 'package:my_store/features/cart/presentation/screens/step.dart';

import '../cubit/cart_cubit.dart';
import '../cubit/cart_state.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout (3/3)")),
      body: Column(
        children: [

          const StepHeader(currentStep: 4, totalSteps: 4,),

          const SizedBox(height: 20),

          /// 🧾 Order summary
          ListTile(
            title: const Text("Shoes"),
            subtitle: const Text("Qty: 2"),
            trailing: const Text("\$200"),
          ),

          ListTile(
            title: const Text("Watch"),
            subtitle: const Text("Qty: 1"),
            trailing: const Text("\$50"),
          ),

          const Divider(),

          const ListTile(
            title: Text("Total"),
            trailing: Text("\$250"),
          ),

          const Spacer(),

          /// 🔥 Place order
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                context.read<CartCubit>().checkout();
              },
              child: const Text("Place Order"),
            ),
          )
        ],
      ),
    );
  }
}