import 'package:flutter/material.dart';
import 'package:my_store/core/theme/app_colors.dart';
import 'package:my_store/features/products/presentation/screens/widgets/component_details_widget.dart';
import 'package:my_store/features/products/presentation/screens/widgets/image_slider_widget.dart';
import '../../domain/entities/product_details_entities.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.product});
  final ProductDetailsEntities product;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 350,
          pinned: true,
          backgroundColor: AppColors.background,
          flexibleSpace: FlexibleSpaceBar(
            background: ImageSliderWidget(product: product),
          ),
        ),

        SliverToBoxAdapter(
          child: ComponentDetailsWidget(product: product),
        ),
      ],
    );
  }
}
