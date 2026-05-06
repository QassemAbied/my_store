import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common_models/entities/product_entities.dart';
import '../../../../../core/common_widgets/custom_grid_view/product_grid_item_widget.dart';
import '../../cubit/home_cubit.dart';

class ProductGridWidget extends StatelessWidget {
  final GlobalKey cartKey;
  final List<ProductItemEntity> productItem;
  const ProductGridWidget({super.key, required this.cartKey,
    required this.productItem});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
     return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              if (index == productItem.length) {
                return const Center(
                  child:
                  CircularProgressIndicator(),
                );
              }
              final product = productItem[index];
              return ModernProductCard(
                product: product,
                cartKey: cartKey,);
            },
            childCount:
            productItem.length +
                (homeCubit.hasMore ? 1 : 0),
          ),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.65,
          ),
        ),
      );
  }
}
