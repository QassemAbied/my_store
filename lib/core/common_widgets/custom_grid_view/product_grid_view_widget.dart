import 'package:flutter/material.dart';
import 'package:my_store/core/common_widgets/custom_grid_view/product_grid_item_widget.dart';
import '../../../../../core/common_models/entities/product_entities.dart';

class ProductListViewWidget extends StatelessWidget {
  const ProductListViewWidget({super.key, required this.product, required this.cartKey});
  final List<ProductItemEntity> product;
  final GlobalKey cartKey;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (_, index) {
        return ModernProductCard(
          product: product[index],
          cartKey: cartKey,
        );
      },
    );
  }
}
