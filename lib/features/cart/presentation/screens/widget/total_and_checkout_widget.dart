import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/utils/spacing.dart';

import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../domain/entities/cart_item.dart';
import '../../cubit/cart_cubit.dart';

class TotalAndCheckoutWidget extends StatelessWidget {
  const TotalAndCheckoutWidget({super.key, required this.cartResponseEntity});
  final CartResponseEntity cartResponseEntity;
  @override
  Widget build(BuildContext context) {
    final cart = cartResponseEntity.cart;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(blurRadius: 15, color: Colors.black.withValues(alpha: 0.1)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: AppTextStyle.semiBold(
                  fontSize: 16,
                  color: context.textPrimary,
                ),
              ),
              Text(
                "${cart.total} EGP",
                style: AppTextStyle.bold(fontSize: 18, color: Colors.green),
              ),
            ],
          ),

          verticalSpace(12),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.read<CartCubit>().checkout();
              },
              child: const Text("Checkout"),
            ),
          ),
        ],
      ),
    );
  }
}
