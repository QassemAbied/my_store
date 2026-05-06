import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../cart/domain/entities/cart_item.dart';
import '../../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../domain/entities/product_details_entities.dart';
import '../../cubit/product_details_cubit.dart';

class AddToCartButton extends StatelessWidget {
  final ProductDetailsEntities product;

  const AddToCartButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ProductDetailsCubit>();
    final cartCubit = context.watch<CartCubit>();

    final variant = cubit.selectedVariant;

    final hasColor = product.product.options
        .any((e) => e.title.toLowerCase() == "color");

    final disabled = hasColor
        ? cubit.selectedSize == null || cubit.selectedColor == null
        : cubit.selectedSize == null;


    final isInCart = cartCubit.items?.cart.items.any(
          (e) => e.variantId == variant?.id,
    ) ?? false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: disabled
                ? context.disabled
                : isInCart
                ? Colors.green
                : context.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: disabled || variant == null
              ? null
              : () {
            final cart = context.read<CartCubit>();

            if (isInCart) {
              final item = cart.items?.cart.items
                  .where((e) => e.variantId == variant.id)
                  .firstOrNull;

              if (item != null) {
                cart.deleteCart(
                  lineId: item.id,
                  variantId: variant.id,
                );
              }
            } else {
              cart.addCart(
                variantId: variant.id,
                quantity: 1,
                cartItem: CartItemEntity(
                  id: variant.id,
                  variantId: variant.id,
                  title: product.product.title,
                  thumbnail: product.product.thumbnail,
                  price: 0,
                  quantity: 1, productId: product.product.id,
                ),
              );
            }
          },
          child: Text(
            disabled
                ? "Select Options"
                : isInCart
                ? "Remove from Cart"
                : "Add to Cart",
            style: AppTextStyle.semiBold(
              fontSize: 16,
              color: context.onPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
