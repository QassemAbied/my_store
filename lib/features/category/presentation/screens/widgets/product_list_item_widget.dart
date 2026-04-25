import 'package:flutter/material.dart';
import '../../../../../core/common_models/entities/product_entities.dart';
import '../../../../../core/common_widgets/custom_cart_icon_widget.dart';
import '../../../../../core/network/api_contstants.dart';
import '../../../../../core/theme/color_extension.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/spacing.dart';
import '../../../../cart/domain/entities/cart_item.dart';

class ModernProductCard extends StatelessWidget {
  final ProductItemEntity product;
  final GlobalKey cartKey;

  ModernProductCard({super.key,
    required this.product,
    required this.cartKey});

  final GlobalKey imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final cartItem = CartItemEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: product.title ?? "",
      quantity: 1,
      price: product.variants?[0].price ?? 0,
      thumbnail: product.thumbnail ?? "",
      variantId: product.variants?[0].id ?? '',
    );
    final price = product.variants?.isNotEmpty == true
        ? product.variants!.first.price ?? 0
        : 0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.surfaceColor,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 12),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.network(
                    key: imageKey,
                    ApiConstants.fixImageUrl(product.thumbnail ?? ''),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                        bottom: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          context.primaryColor.withValues(alpha: 0.2),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.surfaceColor,
                      shape: BoxShape.circle,
                    ),
                    child: CustomCartIconWidget(
                      variantId: product.variants?[0].id ?? '',
                      quantity: 1,
                      cartItem: cartItem,
                      cartKey: cartKey,
                      imageKey: imageKey,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.semiBold(
                    fontSize: 17,
                    color: context.textPrimary,
                  ),
                ),
                verticalSpace(4),
                Text(
                  "Price: \$$price",
                  style: AppTextStyle.bold(
                    fontSize: 14,
                    color: context.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
