import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/theme/app_colors.dart';
import 'package:my_store/features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/cart/domain/entities/cart_item.dart';

class CustomCartIconWidget extends StatelessWidget {
  const CustomCartIconWidget({
    super.key,
    required this.variantId,
    required this.quantity,
    required this.cartItem, required this.cartKey, required this.imageKey,
  });
  final String variantId;
  final int quantity;
  final CartItemEntity cartItem;
  final GlobalKey cartKey;
  final GlobalKey imageKey;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();
    final isCart = cartCubit.selectedItems.contains(variantId);
    return IconButton(
      onPressed: () {

        final cubit = context.read<CartCubit>();
        if (isCart) {
          final item = cubit.items?.cart.items.firstWhere(
            (e) => e.variantId == variantId,
          );
          if (item != null) {
            cubit.deleteCart(lineId: item.id, variantId: variantId);
          }
        } else {
          runAddToCartAnimation(
            context: context,
            cartKey: cartKey,
            imageKey: imageKey,
          );
          cubit.addCart(
            variantId: variantId,
            quantity: quantity,
            cartItem: cartItem,
          );
        }
      },
      icon: Icon(
        Icons.add_shopping_cart_sharp,
        color: isCart ? AppColors.success : AppColors.disabled,
      ),
    );
  }
}

void runAddToCartAnimation({
  required BuildContext context,
  required GlobalKey cartKey,
  required GlobalKey imageKey,
}) {
  final renderBox = imageKey.currentContext!.findRenderObject() as RenderBox;
  final start = renderBox.localToGlobal(Offset.zero);

  final cartBox = cartKey.currentContext!.findRenderObject() as RenderBox;
  final end = cartBox.localToGlobal(Offset.zero);

  final overlay = Overlay.of(context);

  final overlayEntry = OverlayEntry(
    builder: (context) {
      return TweenAnimationBuilder<Offset>(
        tween: Tween(begin: start, end: end),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          return Positioned(
            left: value.dx,
            top: value.dy,
            child: child!,
          );
        },
        child: const Material(
          color: Colors.transparent,
          child: Icon(Icons.shopping_bag, size: 30, color: Colors.green),
        ),
      );
    },
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(milliseconds: 600), () {
    overlayEntry.remove();
  });
}
