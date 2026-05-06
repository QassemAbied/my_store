import 'package:flutter/material.dart';
import '../../../../../../core/common_models/entities/product_entities.dart';
import '../../../../../../core/common_widgets/custom_cached_image_widget.dart';

class ListProductOfCategoryWidget extends StatelessWidget {
  final List<ProductItemEntity> products;
  const ListProductOfCategoryWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: width * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return AspectRatio(
            aspectRatio: 1,
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              child: CustomNetworkImage(imageUrl: product.thumbnail ?? ""),
            ),
          );
        },
      ),
    );
  }
}
