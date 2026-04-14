import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/utils/spacing.dart';
import 'package:my_store/features/cart/presentation/screens/widget/quantity_widget.dart';
import '../../../../../core/network/api_contstants.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../cubit/cart_cubit.dart';
import 'cart_item_delete_widget.dart';

class CartItemWidget extends StatefulWidget {
  final dynamic item;

  const CartItemWidget({super.key, required this.item});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  bool isDeleting = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      child: isDeleting
          ? const SizedBox.shrink()
          : Container(
       // key: ValueKey(item.id),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.surfaceColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  ApiConstants.fixImageUrl(item.thumbnail),
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppTextStyle.semiBold(
                      fontSize: 16,
                      color: context.textPrimary,
                    ),
                  ),
                   verticalSpace( 6),
                  Text(
                    "${item.price} EGP",
                    style: AppTextStyle.bold(
                      fontSize: 15,
                      color: Colors.green,
                    ),
                  ),
                   verticalSpace( 10),
                 QuantityWidget(item: item),
                ],
              ),
            ),

            CartItemDeleteWidget( item: item,
              onDelete: () async {
                setState(() => isDeleting = true);

                await Future.delayed(
                  const Duration(milliseconds: 300),
                );

                context.read<CartCubit>().deleteCart(
                  lineId: item.id,
                  variantId: item.variantId,
                );
              },)
          ],
        ),
      ),
    );
  }
}





