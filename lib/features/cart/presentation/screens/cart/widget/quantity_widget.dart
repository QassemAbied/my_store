import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/utils/spacing.dart';

import '../../../../../../core/theme/color_extension.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../cubit/cart_cubit.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key, this.item});
  final dynamic item;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        qtyBtn(context, Icons.remove, () {
          if (item.quantity > 1) {
            context.read<CartCubit>().updateCart(
              lineId: item.id,
              quantity: item.quantity - 1,
            );
          }
        }),
         horizontalSpace(10),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) =>
              ScaleTransition(scale: animation, child: child),
          child: Text(
            "${item.quantity}",
            key: ValueKey(item.quantity),
            style: AppTextStyle.medium(
              fontSize: 14,
              color: context.textPrimary,
            ),
          ),
        ),
        horizontalSpace(10),
        qtyBtn(context, Icons.add, () {
          context.read<CartCubit>().updateCart(
            lineId: item.id,
            quantity: item.quantity + 1,
          );
        }),
      ],
    );
  }
}

Widget qtyBtn(BuildContext context, IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Icon(icon, size: 18),
    ),
  );
}
